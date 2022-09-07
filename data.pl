:-include('../listprologinterpreter/operators.pl').

data([],Value,Value) :- !.
/**
data(Value1a,Value2,Value3) :-
	data_symbol(Symbol),
	((Value1a=Symbol)->
	append(Value2,[Value1a],Value3)),!.
**/
%data(Value1a,Value2,Value3) :-
%	((Value1a="=\\=")->
%	append(Value2,[Value1a],Value3)),!.
%data(Value1a,Value2,Value3) :-
%	((Value1a="->")->
%	append(Value2,[Value1a],Value3)),!.
data1(Value1a,Value1b%Value1a,Value2,Value3
) :-
	from_lang2(From_lang),
	to_lang2(To_lang),
	%trace,
	((atom(Value1a)->true;(string(Value1a)->true;(number(Value1a))))->
	(translate2(Value1a,From_lang,To_lang,Value1b))), %% translate1a,2
	%append(Value2,[Value1b],Value3))),
	!.
data([Value1],Value2,Value3) :-
 var(Value1),
	append(Value2,[Value1],Value3),!.
data(Value1,Value2,Value3) :-
%trace,
	to_lang2(To_lang),
	from_lang2(From_lang),
	get_lang_word3(v,"en",From_lang,V),
	Value1=[V,Value4],
	get_lang_word3(V,From_lang,To_lang,Value6b),
	data(Value4,_,Value6),
	(var(Value6)->(Value6c=Value6,Value6c1=[]);Value6=[Value6c|Value6c1]),
	foldr(append,[[Value6b],[Value6c],Value6c1],Value6d),
	append(Value2,Value6d,Value3),!.
	
data(Value1,Value2,Value3) :-
	to_lang2(To_lang),
	from_lang2(From_lang),
	get_lang_word3(input,"en",From_lang,I),
	%trace,
	Value1=I,%->true;(notrace,fail)),

	get_lang_word3(I,From_lang,To_lang,Value6b),
	%data1(Value4,Value6),
	append(Value2,[Value6b],Value3),!.
data(Value1,Value2,Value3) :-
	to_lang2(To_lang),
	from_lang2(From_lang),
	get_lang_word3(output,"en",From_lang,O),
	Value1=O,
	get_lang_word3(O,From_lang,To_lang,Value6b),
	%data1(Value4,Value6),
	append(Value2,[Value6b],Value3),!.
	
data(Value1a,Value2,Value3) :-
	%from_lang2(From_lang),
	%to_lang2(To_lang),
	%trace,
	((atom(Value1a)->true;(string(Value1a)->true;(number(Value1a))))->
	(Value1a=Value1b,%translate2(Value1a,From_lang,To_lang,Value1b), %% translate1a,2
	append(Value2,[Value1b],Value3))),
	!.
data(Value1,Value2,Value3) :-
	to_lang2(To_lang),
	from_lang2(From_lang),
	get_lang_word3(n,"en",From_lang,N),
	Value1=([N,Value4]=Value4a),
	get_lang_word3(N,From_lang,To_lang,Value6b),
	data1(Value4,Value6),
	(Value4a=[_|_]->data(Value4a,[],Value6a);
	data(Value4a,[],[Value6a])),
	append(Value2,[[Value6b,Value6]=Value6a],Value3),!.
data(Value1,Value2,Value3) :-
	to_lang2(To_lang),
	from_lang2(From_lang),
	get_lang_word3(n,"en",From_lang,N),
	Value1=[[N,Value4]=Value4a],
	get_lang_word3(N,From_lang,To_lang,Value6b),
	data1(Value4,Value6),
	(Value4a=[_|_]->data(Value4a,[],Value6a);
	data(Value4a,[],[Value6a])),
	append(Value2,[[Value6b,Value6]=Value6a],Value3),!.
data(Value1,Value2,Value3) :-
	to_lang2(To_lang),
	from_lang2(From_lang),
	get_lang_word3(v,"en",From_lang,V),
	Value1=([V,Value4]=Value4a),
	get_lang_word3(V,From_lang,To_lang,Value6b),
	data1(Value4,Value6),
	(Value4a=[_|_]->data(Value4a,[],Value6a);
	data(Value4a,[],[Value6a])),
	append(Value2,[[Value6b,Value6]=Value6a],Value3),!.
data(Value1,Value2,Value3) :-
	to_lang2(To_lang),
	from_lang2(From_lang),
	get_lang_word3(v,"en",From_lang,V),
	Value1=[[V,Value4]=Value4a],
	get_lang_word3(V,From_lang,To_lang,Value6b),
	data1(Value4,Value6),
	(Value4a=[_|_]->data(Value4a,[],Value6a);
	data(Value4a,[],[Value6a])),
	append(Value2,[[Value6b,Value6]=Value6a],Value3),!.

data(Value1,Value2,Value3) :-
	to_lang2(To_lang),
	from_lang2(From_lang),
	get_lang_word3(n,"en",From_lang,N),
	Value1=[N,Value4],
	get_lang_word3(N,From_lang,To_lang,Value6b),
	data1(Value4,Value6),
	append(Value2,[Value6b,Value6],Value3),!.

data(Value1,Value2,Value3) :-
	to_lang2(To_lang),
	from_lang2(From_lang),
	get_lang_word3(t,"en",From_lang,T),
	Value1=[T,Value4],
	get_lang_word3(T,From_lang,To_lang,Value6b),
	data1(Value4,Value6),
	append(Value2,[Value6b,Value6],Value3),!.

	

data(Value1,Value2,Value3) :-
	Value1=(Value4=Value4a),
	data(Value4,[],Value6),
	data(Value4a,[],Value6a),
	append(Value2,[Value6=Value6a],Value3).
data(Value1,Value2,Value3) :-
	Value1=[Value4=Value4a],
	data(Value4,[],Value6),
	data(Value4a,[],Value6a),
	append(Value2,[Value6=Value6a],Value3).
data(Value1,Value2,Value3) :-
	Value1=[[Value4|Value4a]|Value5],
	data([Value4|Value4a],[],Value6),
	append(Value2,[Value6],Value7),
	data(Value5,Value7,Value3),!.
data(Value1,Value2,Value3) :-
	Value1=[""|Value5],
	append(Value2,[""],Value7),
	data(Value5,Value7,Value3),!.
data(Value1,Value2,Value3) :-
	Value1=[[]|Value5],
	append(Value2,[[]],Value7),
	data(Value5,Value7,Value3),!.
data(Value1,Value2,Value3) :-
	Value1=[Value4|Value5],
	data(Value4,[],Value6),
	append(Value2,Value6,Value7),
	data(Value5,Value7,Value3),!.

data(Value1,Value2,Value3b) :-

curly_head_taila(Value1,Value4,Value5),
%trace,
	data([Value4],[],Value6),
	append(Value2,Value6,Value7),
	data(Value5,Value7,Value3),
		curly_square(Value3a,[Value3]),
				[Value3a]=Value3b,!.

data_symbol(":-").
data_symbol("->").
data_symbol("|").
data_symbol(=).
data_symbol(A) :- operator(A).
data_symbol(A) :- comparisonoperator(A).

translate1("v","en","fr","v").
translate1("true","en","fr","vrai").
translate1("v","en","de","v").
translate1("true","en","de","wahr").
translate3(A,_,_,A).

trans_alg(Algorithm1,From_lang,To_lang,Algorithm2) :-
	retractall(from_lang2(_)),
	assertz(from_lang2(From_lang)),
	retractall(to_lang2(_)),
	assertz(to_lang2(To_lang)),
	retractall(lang(_)),
	assertz(lang(To_lang)),
	load_lang_db,
	data([Algorithm1],[],[Algorithm2]),!.
