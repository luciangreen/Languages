% translate4.pl

%translate4(Input,Lang1,Lang2,Input) :-
%	split_on_number(Lang1,Lang3,_),
%	split_on_number(Lang2,Lang3,_),!.
translate4(Input,Lang1,Lang2,Input) :-
	Lang1="en2",
	split_on_number(Lang1,Lang3,_),
	split_on_number(Lang2,Lang3,_),!.
translate4(Input,"en","en2",Input) :- !.
translate4(Input,Lang,Lang,Input) :- !.
translate4(Input,From_lang,To_lang,Output) :-
	split_on_number(From_lang,Lang3,_),
	split_on_number(To_lang,Lang4,_),
	%not(Lang3=Lang4),
	translate(Input,Lang3,Lang4,Output),!.

/**

need to run test1(off,1,R). to load db before following.

get_lang_word3(member1,"en","en2",A).
A="member 1".

get_lang_word3("yes_1","en","en2",A).
A = "yes 1". 

get_lang_word3("yes1","en","en2",A).
A = "yes 1".


get_lang_word3("member 1","en2","en",A).
A = member1.

get_lang_word3("yes 1","en2","en",A).
A = yes1.

get_lang_word3("yes  1","en2","en",A).
A = yes1.


get_lang_word3("Yes 1","en2","fr",A).                                            
A = "Oui 1".

get_lang_word3("Oui 1","fr","en2",A).
A = "Yes 1".


get_lang_word3("membre 1","fr","en2",A).
A = "member 1".

get_lang_word3("membre 1","fr","en",A).
A = member1.

get_lang_word3("Yes 1","en2","en",A).
A = 'Yes1'.

**/