data([],Value,Value) :- !.
data(Value1a,Value2,Value3) :-
	((Value1a=":-")->
	append(Value2,[Value1a],Value3)),!.
%data(Value1a,Value2,Value3) :-
%	((Value1a="=\\=")->
%	append(Value2,[Value1a],Value3)),!.
data(Value1a,Value2,Value3) :-
	((Value1a="->")->
	append(Value2,[Value1a],Value3)),!.
data(Value1a,Value2,Value3) :-
	to_lang(To_lang),
	((atom(Value1a)->true;(string(Value1a)->true;(number(Value1a))))->
	(translate2(Value1a,"en",To_lang,Value1b), %% translate2
	append(Value2,[Value1b],Value3))),!.
data(Value1,Value2,Value3) :-
	Value1=(Value4=Value4a),
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

translate1("v","en","fr","v").
translate1("true","en","fr","vrai").
translate1("v","en","de","v").
translate1("true","en","de","wahr").
translate3(A,_,_,A).
