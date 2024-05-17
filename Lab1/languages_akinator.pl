high(ruby, 1).
high(c_sharp, 1).
high(python, 1).
high(c_plu_plus, 1).
high(f_sharp, 1).
high(prolog, 1).
high(c, 1).
high(asm, 0).
high(fortran, 1).
high(delphi, 1).
high(swift, 1).

decl(ruby,0).
decl(c_sharp,0).
decl(python,0).
decl(c_plu_plus,0).
decl(f_sharp,1).
decl(prolog,1).
decl(c,0).
decl(asm,0).
decl(fortran, 0).
decl(delphi, 0).
decl(swift, 0).

interpret(ruby,1).
interpret(python,1).
interpret(f_sharp,1).
interpret(prolog,1).
interpret(c_sharp,0).
interpret(c_plu_plus,0).
interpret(c,0).
interpret(asm,0).
interpret(fortran, 0).
interpret(delphi, 0).
interpret(swift, 0).

oop(ruby,3).
oop(c_sharp,3).
oop(python,2).
oop(c_plu_plus,2).
oop(f_sharp,1).
oop(prolog,1).
oop(c,0).
oop(asm,0).
oop(fortran, 1).
oop(delphi, 2).
oop(swift ,3).

cross(ruby,1).
cross(python,1).
cross(c_plu_plus,1).
cross(prolog,1).
cross(c,1).
cross(asm,1).
cross(c_sharp,0).
cross(f_sharp,0).
cross(fortran, 1).
cross(delphi, 1).
cross(swift, 0).

visual(c_sharp,3).
visual(ruby,2).
visual(python,2).
visual(c_plu_plus,2).
visual(f_sharp,2).
visual(prolog,1).
visual(c,0).
visual(asm,0).
visual(fortran, 0).
visual(delphi, 0).
visual(swift, 3).

mobile(c_sharp,0).
mobile(ruby,0).
mobile(python,0).
mobile(c_plu_plus,0).
mobile(f_sharp,0).
mobile(prolog,0).
mobile(c,0).
mobile(asm,0).
mobile(fortran, 0).
mobile(delphi, 0).
mobile(swift, 1).

scientefic_computation(c_sharp, 0).
scientefic_computation(ruby, 0).
scientefic_computation(python, 0).
scientefic_computation(c_plu_plus, 1).
scientefic_computation(f_sharp, 0).
scientefic_computation(prolog, 0).
scientefic_computation(c, 1).
scientefic_computation(asm, 0).
scientefic_computation(fortran, 1).
scientefic_computation(delphi, 0).
scientefic_computation(swift, 0).

popular(c_sharp, 1).
popular(ruby, 0).
popular(python, 1).
popular(c_plu_plus, 1).
popular(f_sharp, 0).
popular(prolog, 0).
popular(c, 0).
popular(asm, 0).
popular(fortran, 0).
popular(delphi, 0).
popular(swift, 1).

question1(X1):-	write("Is your language high level?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X1).

question2(X2):-	write("Is your language declarative?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X2).

question3(X3):-	write("Is your language interpret?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X3).

question4(X4):-	write("Does your language support OOP?"),nl,
				write("3. It is OOP itself"),nl,
				write("2. yes"),nl,
				write("1. yes, but very hard"),nl,
				write("0. NO"),nl,
				read(X4).

question5(X5):-	write("Is your language crossplatformic?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X5).

question6(X6):-	write("Does your language support visual interface for user?"),nl,
				write("3. It is visual itself"),nl,
				write("2. yes"),nl,
				write("1. yes, but very hard"),nl,
				write("0. NO"),nl,
				read(X6).

question7(X7):-	write("Is your language for mobile phones?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X7).				

question8(X8):- write("Is your language for scientific computation"), nl,
				write("1. Yes"), nl,
				write("0. NO"), nl,
				read(X8).

question9(X9):- write("Is your language popular"), nl,
				write("1. Yes"), nl,
				write("0. No"), nl,
				read(X9).


pr:-	question1(X1),question2(X2),question3(X3),question4(X4),
		question5(X5),question6(X6),question7(X7), question8(X8),
		question9(X9),high(X,X1),decl(X,X2),interpret(X,X3),
		oop(X,X4), cross(X,X5),visual(X,X6),mobile(X,X7),
		scientefic_computation(X, X8), popular(X, X9),
		write(X).