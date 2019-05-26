
front(X,Y) :- behind(Y,X).
infront(grumpy,dopey).
infront(doc,droopy).
infront(doc,happy).
infront(happy,sleepy).
infront(happy,smelly).
infront(happy,bashful).
infront(sneezy,dopey).
infront(smelly,grumpy).
infront(smelly,stumpy).
infront(smelly,sneezy).
infront(dopey,droopy).
infront(sleepy,grumpy).
infront(sleepy,bashful).
infront(stumpy,dopey).

behind(X,Y) :- front(Y,X).
behind(stumpy,sneezy).
behind(stumpy,doc).
behind(sleepy,stumpy).
behind(sleepy,smelly).
behind(sleepy,happy).
behind(bashful,smelly).
behind(bashful,droopy).
behind(bashful,sleepy).
behind(dopey,sneezy).
behind(dopey,doc).
behind(dopey,sleepy).
behind(smelly,doc).


start() :- 
	order([droopy, bashful, doc, dopey, sneezy, smelly, happy,sleepy, stumpy], [grumpy]).


order([Dwarfs|[]], Ord) :- write("Order: "), write(Ord), nl.

order([Dwarfs|Rem], [First|[]]) :- 

	(front(Dwarfs, First) -> order(Rem, [Dwarfs, First])

		; order([Rem], [First, Dwarfs])

	).

order([Dwarfs|Rem], [First|Rem2]) :-

	(front(Dwarfs, First) -> order(Rem, [Dwarfs, First|Rem2])

		; order([Dwarfs|Rem], [First, Rem2])

	).