:-include('../listprologinterpreter/operators.pl').

data([],Value,Value) :- !.
data(Value1a,Value2,Value3) :-
	data_symbol(Symbol),
	((Value1a=Symbol)->
	append(Value2,[Value1a],Value3)),!.
%data(Value1a,Value2,Value3) :-
%	((Value1a="=\\=")->
%	append(Value2,[Value1a],Value3)),!.
%data(Value1a,Value2,Value3) :-
%	((Value1a="->")->
%	append(Value2,[Value1a],Value3)),!.
data(Value1a,Value2,Value3) :-
	from_lang2(From_lang),
	to_lang2(To_lang),
	%trace,
	((atom(Value1a)->true;(string(Value1a)->true;(number(Value1a))))->
	(translate2(Value1a,From_lang,To_lang,Value1b), %% translate1a,2
	append(Value2,[Value1b],Value3))),!.
data(Value1,Value2,Value3) :-
	Value1=([v,Value4]=Value4a),
	data(v,[],[Value6b]),
	data(Value4,[],[Value6]),
	(Value4a=[_|_]->data(Value4a,[],Value6a);
	data(Value4a,[],[Value6a])),
	append(Value2,[[Value6b,Value6]=Value6a],Value3),!.
data(Value1,Value2,Value3) :-
	Value1=[[v,Value4]=Value4a],
	data(v,[],[Value6b]),
	data(Value4,[],[Value6]),
	(Value4a=[_|_]->data(Value4a,[],Value6a);
	data(Value4a,[],[Value6a])),
	append(Value2,[[Value6b,Value6]=Value6a],Value3),!.
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
	Value1=[Value4|Value5],
	data(Value4,[],Value6),
	append(Value2,Value6,Value7),
	data(Value5,Value7,Value3),!.

data_symbol(":-").
data_symbol("->").
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
	data([Algorithm1],[],[Algorithm2]),!.
