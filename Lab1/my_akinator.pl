size(peasant, 0).
size(archer, 0).
size(footman, 0).
size(griffin, 1).
size(priest, 0).
size(cavalier, 1).
size(angel, 1).

size(scout, 0).
size(blood_maiden, 0).
size(minotaur, 0).
size(dark_rider, 1).
size(hydra, 1).
size(shadow_witch, 0).
size(shadow_dragon, 1).

size(imp, 0).
size(horden_demon, 0).
size(hell_hound, 0).
size(succubus, 0).
size(hell_charger, 1).
size(pit_fiend, 1).
size(devil, 1).

size(fire_elemental, 0).
size(fire_elemental, 0).

faction(peasant, 1).
faction(archer, 1).
faction(footman, 1).
faction(griffin, 1).
faction(priest, 1).
faction(cavalier, 1).
faction(angel, 1).

faction(scout, 2).
faction(blood_maiden, 2).
faction(minotaur, 2).
faction(dark_rider, 2).
faction(hydra, 2).
faction(shadow_witch, 2).
faction(shadow_dragon, 2).

faction(imp, 3).
faction(horden_demon, 3).
faction(hell_hound, 3).
faction(succubus, 3).
faction(hell_charger, 3).
faction(pit_fiend, 3).
faction(devil, 3).

faction(fire_elemental, 0).
faction(water_elemental, 0).

tier(peasant, 1).
tier(archer, 2).
tier(footman, 3).
tier(griffin, 4).
tier(priest, 5).
tier(cavalier, 6).
tier(angel, 7).

tier(scout, 1).
tier(blood_maiden, 2).
tier(minotaur, 3).
tier(dark_rider, 4).
tier(hydra, 5).
tier(shadow_witch, 6).
tier(shadow_dragon, 7).

tier(imp, 1).
tier(horden_demon, 2).
tier(hell_hound, 3).
tier(succubus, 4).
tier(hell_charger, 5).
tier(pit_fiend, 6).
tier(devil, 7).

tier(fire_elemental, 4).
tier(water_elemental, 4).

flyer(peasant, 0).
flyer(archer, 0).
flyer(footman, 0).
flyer(griffin, 1).
flyer(priest, 0).
flyer(cavalier, 0).
flyer(angel, 1).

flyer(scout, 0).
flyer(blood_maiden, 0).
flyer(minotaur, 0).
flyer(dark_rider, 0).
flyer(hydra, 0).
flyer(shadow_witch, 0).
flyer(shadow_dragon, 1).

flyer(imp, 0).
flyer(horden_demon, 0).
flyer(hell_hound, 0).
flyer(succubus, 0).
flyer(hell_charger, 0).
flyer(pit_fiend, 0).
flyer(devil, 1).

flyer(fire_elemental, 0).
flyer(water_elemental, 0).

shooter(peasant, 0).
shooter(archer, 1).
shooter(footman, 0).
shooter(griffin, 0).
shooter(priest, 1).
shooter(cavalier, 0).
shooter(angel, 0).

shooter(scout, 1).
shooter(blood_maiden, 0).
shooter(minotaur, 0).
shooter(dark_rider, 0).
shooter(hydra, 0).
shooter(shadow_witch, 1).
shooter(shadow_dragon, 0).

shooter(imp, 0).
shooter(horden_demon, 0).
shooter(hell_hound, 0).
shooter(succubus, 1).
shooter(hell_charger, 0).
shooter(pit_fiend, 1).
shooter(devil, 0).

shooter(fire_elemental, 1).
shooter(water_elemental, 1).

caster(fire_elemental, 0).
caster(water_elemental, 1).

question1(X1):- write("Can your unit fly?"), nl,
				write("0. No, he's not flying"), nl,
				write("1. Yes, he's flying"),nl,
				read(X1).

question2(X2):- write("Can your unit shoot?"), nl,
				write("0. No, he's not shooting"), nl,
				write("1. Yes, he's shooting"),nl,
				read(X2).

question3(X3):- write("Your unit is large?"), nl,
				write("0. No"), nl,
				write("1. Yes"),nl,
				read(X3).

question4(X4):- write("What tier is your unit in?"), nl,
				write("1. tier 1"), nl,
				write("2. tier 2"), nl,
				write("3. tier 3"), nl,
				write("4. tier 4"), nl,
				write("5. tier 5"), nl,
				write("6. tier 6"), nl,
				write("7. tier 7"), nl,
				read(X4).

question5(X5):- write("What faction is your unit in?"), nl,
				write("0. Neutrals"), nl,
				write("1. Alliance"), nl,
				write("2. Dark Elves"), nl,
				write("3. Inferno"), nl,
				read(X5).

question6(X6):- write("Your unit casts spells?"), nl,
				write("0. No"), nl,
				write("1. Yes"), nl,
				read(X6).

%in_list(+List, +Element)
%DESCRIPTION:
%Проверка на наличие элемента в списке
in_list([El|_], El).
in_list([_|T], El) :- in_list(T, El).

%check_result(+Result)
%DESCRIPTION:
%Проверка результата на единственность
check_result(Result):- length(Result, Count), (Count =:= 1->[Answer | _] = Result, write(Answer), write("."), fail; true).

start:- write("Guess a squad of heroes 5. Four factions are available: Alliance, Inferno, Dark Elves, Neutrals"), nl,
		question1(X1),
		findall(Y, (flyer(Y, X1)), MatchList1),
		check_result(MatchList1),

		question2(X2),
		findall(Y, (flyer(Y, X1), shooter(Y, X2)), MatchList2),
		check_result(MatchList2),

		question3(X3),
		findall(Y, (flyer(Y, X1), shooter(Y, X2), size(Y, X3)), MatchList3),
		check_result(MathList3),

		question4(X4),
		findall(Y, (flyer(Y, X1), shooter(Y, X2), size(Y, X3), tier(Y, X4)), MatchList4),
		check_result(MatchList4),

		question5(X5),
		findall(Y, (flyer(Y, X1), shooter(Y, X2), size(Y, X3), tier(Y, X4), faction(Y, X5)), MathList5),
		check_result(MatchList5),

		(in_list(MathList5, fire_elemental), in_list(MathList5, water_elemental)->
				question6(X6),
				findall(Y, (caster(Y, X6)), MathList6),
				check_result(MathList6), true; false).