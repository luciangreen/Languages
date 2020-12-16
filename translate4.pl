% translate4.pl

translate4(Input,Lang1,Lang2,Input) :-
	split_on_number(Lang1,Lang3,_),
	split_on_number(Lang2,Lang3,_),!.
translate4(Input,From_lang,To_lang,Output) :-
	split_on_number(From_lang,Lang3,_),
	split_on_number(To_lang,Lang4,_),
	not(Lang3=Lang4),
	translate(Input,Lang3,Lang4,Output),!.
