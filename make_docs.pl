% make_docs.pl

:-include('../listprologinterpreter/la_strings.pl').
:-include('../culturaltranslationtool/ctt.pl').
:-include('data.pl').
:-include('lang_db_generator-nonabort.pl').

string(String) --> list(String).

list([]) --> [].
list([L|Ls]) --> [L], list(Ls).

make_docs :-
	writeln("Enter target language code for LPI docs:"),
	read_string(user_input, "\n", "\r", _End2, To_lang),
	retractall(lang(_)),
	assertz(lang(To_lang)),
	load_lang_db,
	phrase_from_file_s(string(Docs), "docs.txt"),
	split_string(Docs,"`","`",Input1),
	process1(Input1,To_lang,"",String),
	concat_list([To_lang,".txt"],File),
	(open_s(File,write,Stream),
	write(Stream,String),
	close(Stream)),
	writeln(String),!.

process1(Input1,To_lang,String1,String2) :-
	Input1=[A,B|Rest],
	split_string(A,"<>","<>",Input2),
	process2(Input2,To_lang,String1,String3),
	term_to_atom(B1,B),
	retractall(to_lang2(_)),
	assertz(to_lang(To_lang)),
	(data([B1],[],[B2])->true;(concat_list(["Error: Couldn't translate list prolog: ",B],N),writeln(N),abort)),
	%trace,
	term_to_atom(B2,B3),
	concat_list([String3,"`",B3,"`"],String4),
writeln("****"),
writeln(String4),
	process1(Rest,To_lang,String4,String2),!.
process1([],_To_lang,String,String) :- !.
process1([A|As],_To_lang,String1,String2) :- 
%trace,
	%term_to_atom(A,A1),
	%term_to_atom(As,As1),
	(As=[]->(concat_list([String1,A],String2)
	%,notrace
	);
	(maplist(append,[[[String1],[A],As]],[C]),
	concat_list(C,String2)
	%,notrace
	)),!.

% v< x > v < x > 
process2(Input2,To_lang,String1,String2) :-
	Input2=[A,B,C,D|Rest],
	split_string(A,"&","&",A11), % docs.txt needs a character between `,<,>,&
	process3(A11,To_lang,"",A1),
	split_string(C,"&","&",C11),
	process3(C11,To_lang,"",C1),
	concat_list([String1,A1,"<",B,">",C1,"<",D,">"],String3),
writeln("****"),
writeln(String3),
	process2(Rest,To_lang,String3,String2),!.
process2([],_To_lang,String,String) :- !.
process2([A|As],_To_lang,String1,String2) :- 
	%term_to_atom(A,A1),
	%term_to_atom(As,As1),
	(As=[]->concat_list([String1,A],String2);
	(maplist(append,[[[String1],[A],As]],[C]),
	concat_list(C,String2))),!.

% v & x &
process3(Input2,To_lang,String1,String2) :-
	Input2=[A,B|Rest],
	translate2(A,"en",To_lang,A1),
	%translate2(C,"en",To_lang,C1),
	%C=C1,
	concat_list([String1,A1,B],String3),
writeln("****"),
writeln(String3),
	process3(Rest,To_lang,String3,String2),!.
process3([],_To_lang,String,String) :- !.
process3([A|As],_To_lang,String1,String2) :- 
	%term_to_atom(A,A1),
	%term_to_atom(As,As1),
	(As=[]->concat_list([String1,A],String2);
	(maplist(append,[[[String1],[A],As]],[C]),
	concat_list(C,String2))),!.

%term_to_atom2(A,B) :-
%	term_to_atom(A,C),
	
translate1a(A,_,_,A).

translate2(A,_From_lang,_To_lang,B) :-
	(number(A)->A=F;replace(A,"_"," ",F)),
	get_lang_word2(F,B).

	

