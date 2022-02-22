%% lang_db_generator(Target_language)
%% New repository, with dbs in each rep

:- include('../culturaltranslationtool/ctt2.pl').
%:- include('../culturaltranslationtool/edit.pl').
:- include('../listprologinterpreter/la_strings').
:- include('translate4.pl').

:- dynamic lang_db/1.

%% List_of_words may be list of words to translate and add or an original language code

% lang_db_generator([["a","a"],["b","b exp"]],["fr"]). - create the db
% lang_db_generator("fr",["de"]). - add de with same entries as fr
% lang_db_generator("fr",["ab"]). - add ab "
% Alternatively, lang_db_generator("fr",["de","ab"]). instead of last two lines

load_lang_db1(Entry3) :-
	
	% if l.o.w. is orig lang, read from it instead
	
	directory_files("../listprologinterpreter/languages/",F),
	delete_invisibles_etc(F,G),
	findall(Entry2,(member(Filex1,G),
	string_concat("../listprologinterpreter/languages/",Filex1,Filex),
		phrase_from_file_s(string(String00a), Filex),
		string_codes(String02b,String00a),
		atom_to_term(String02b,String02a,[]),
		string_concat(Target_language3,".txt",Filex),
		string_concat("../listprologinterpreter/languages/",Target_language2,Target_language3),

findall([En_word,En_word2,Target_language2,T_word],(member(Entry,String02a),((Entry=[En_word,En_word2,Target_language2,T_word],string(En_word),string(En_word2),string(T_word))->true;(concat_list(["Error: File: ",Filex,", Entry: ",Entry," not in format [\"<En_word>\",\"<En_word2>\",\"<Target_language2>\",\"<T_word>\"]."],Notification1),writeln(Notification1),abort))),Entry2)
),Entry2a),
	maplist(append,[Entry2a],[Entry3]).
	
lang_db_generator(List_of_words,Target_language1) :-

	load_lang_db1(Entry3),

	%%(not(member([_,Target_language1,_],Entry3))->
	
		(string(List_of_words)->
	(findall([Word1,Word2],(member([Word1,Word2,List_of_words,_],Entry3)),List_of_words2),List_of_words3=[]);
	
	(findall([Word1,Word2,List_of_words,Item_a],(member([Word1,Word2,List_of_words,Item_a],Entry3)),List_of_words3), %%** test
		findall(_,(member([Word,Word2],List_of_words),(string(Word),string(Word2))->true;(concat_list(["Error: Word1: ",Word," or Word2: ",Word2," in list of words not in format [\"<Word1>\",\"<Word2>\"]."],Notification1),writeln(Notification1),abort)),_)),List_of_words=List_of_words2),

%% list of langs to put words into
	
	findall(_,(member(Target_language10,Target_language1),
	(string(Target_language10)->true;(concat_list(["Error: Target_language1: ",Target_language1," not in format \"<Target_language1>\"."],Notification1),writeln(Notification1),abort)),

%split_on_number(Target_language10,Target_language101,_),
%trace,
findall([Input,Input1,Target_language10,Output3],(
member([Input,Input1],List_of_words2),
(Target_language10="en2"->Output3=Input1;translate(Input1,"en",Target_language10,Output3))),Output4),

	%% save file
	%% ** add to prev file
	%% ** keep metaphorical translations (x bt xx with simplified ctt (no bt-trans dict) and customised output)
	%% numbers after command names
	%%	- check words on google translate, ctt speeds bt
	
	append(List_of_words3,Output4,Output4a), %% ** test
	
	concat_list(["../listprologinterpreter/languages/",Target_language10,".txt"],File1),
	term_to_atom(Output4a,File_contents),open_s(File1,write,Stream),write(Stream,File_contents),close(Stream)),_).
	
delete_invisibles_etc(F,G) :-
	findall(J,(member(H,F),atom_string(H,J),not(J="."),not(J=".."),not(string_concat(".",_,J))),G).

% test with t=w+1

translate1(Input,From_l,Target_language1,Output3) :-
concat_list([Input," ",From_l," ",Target_language1],Output3).

load_lang_db :-
%% error if lang not found
	load_lang_db1(Entry3),
	lang(Lang),
	(Lang="en"->true;
	(member([_,_,Lang,_],Entry3)->true;
	(concat_list(["Error: Language: ",Lang," not in listprologinterpreter/languages folder."],Notification1),writeln(Notification1),abort))),
	
	retractall(lang_db(_)),
 	assertz(lang_db(Entry3)),!.

get_lang_word(Input,Output) :-
%% error if word not found
	(not(lang(Lang))->(Lang="en");lang(Lang)),
	%lang_db(Lang_db),
	(not(lang_db(Lang_db))->(load_lang_db,lang_db(Lang_db));lang_db(Lang_db)),
	(Lang="en"->%Input=Output1,
	atom_string(Output,Input);
	((%(%((Input="member2"->trace;true),
	split_on_number(Input,Input1,Input10),member([Input1,_Input101,Lang,Output2],Lang_db),
	%notrace,
	(Input10="" -> Output=Output2;
	concat_list([Output2," ",Input10],Output))) -> true;
	(concat_list(["Error: Word: ",Input," not in Language: ",Lang," in lang_db."],Notification1),writeln(Notification1),abort))),
	%Output=Output1,
	!.
	%atom_string(Output,Output1),!.

%split_on_number(Input,Input1,Input10) :-
%findall([Input1,Input10],split_on_number1(Input,Input1,Input10),Output1),
%reverse(Output1,[[Input1,Input10]|_]).
split_on_number(Input,Input1,Input10) :-
	string_concat(A,B,Input),
	string_concat(C,D,B),
	string_length(C,1),
	((C=" ",
	string_concat(E,F,D),
	string_concat(J,K,E),
	string_length(K,1),
	K=" ",

	string_concat(G,_H,F),
	%trace,
	string_length(G,1),
	(number_string(_,G)),%->true;not(G=" ")),
	%((
	%C=" ",
	%)->(
	concat_list([A,C,J],Input1),
	%Input1=A,
	Input10=F))%->true;
	%(number_string(_,C),
	%Input1=A,Input10=B))
	,!.%);
split_on_number(Input,Input1,Input10) :-
	string_concat(A,B,Input),
	string_concat(C,D,B),
	string_length(C,1),
	((C=" ",
	string_concat(_E,F,D),

	string_concat(G,_H,F),
	%trace,
	string_length(G,1),

	(number_string(_,G)),%->true;not(G=" ")),
	%((
	%C=" ",
	%)->(
	%concat_list([A,C,J],Input1),
	Input1=A,
	Input10=F)->true;
	(number_string(_,C),
	Input1=A,Input10=B))
	,!.%);

split_on_number(Input,Input1,Input10) :-
	Input1=Input,Input10="".

replace(A,Find,Replace,F) :- 	
	split_string(A,Find,Find,B),findall([C,Replace],(member(C,B)),D),maplist(append,[D],[E]),concat_list(E,F),!.
	
% stringconcat-> in both algs above
%	concatenate strings v
/**
% membre 2->member2
get_en_lang_word(Input,Output) :-
%% error if word not found
	lang(Lang),
	lang_db(Lang_db),
	(Lang="en"->%Input=Output1,
	atom_string(Input,Output);
	((%(%((Input="member2"->trace;true),
	%split_on_number(Input,Input1,Input10),
	member([Output,_Input101,Lang,Input],Lang_db))->true;
	%notrace,
	%(%Input10="" -> Output=Output2;
	%concat_list([Output2," ",Input10],Output))) -> true;
	(concat_list(["Error: Word: ",Input," not in Language: ",Lang," in lang_db."],Notification1),writeln(Notification1),abort))),
	%Output=Output1,
	!.
	**/
	