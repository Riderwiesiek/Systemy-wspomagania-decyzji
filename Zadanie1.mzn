% Zadanie 1

int: target = 1505;

int: owoce = 215;
int: frytki = 275;
int: salatka = 335;
int: skrzydelka = 355;
int: paluszki = 420;
int: zestaw_probny = 580;

var int: x_owoce;
var int: x_frytki;
var int: x_salatka;
var int: x_skrzydelka;
var int: x_paluszki;
var int: x_zestaw_probny;

% Ograniczenie: liczby muszą być nieujemne
constraint x_owoce >= 0;
constraint x_frytki >= 0;
constraint x_salatka >= 0;
constraint x_skrzydelka >= 0;
constraint x_paluszki >= 0;
constraint x_zestaw_probny >= 0;

% Ograniczenie: suma kosztów musi być równa 1505
constraint owoce * x_owoce + frytki * x_frytki + salatka * x_salatka + 
           skrzydelka * x_skrzydelka + paluszki * x_paluszki + 
           zestaw_probny * x_zestaw_probny = target;

solve satisfy;

output ["Owoce: " ++ show(x_owoce) ++ "\n" ++
        "Frytki: " ++ show(x_frytki) ++ "\n" ++
        "Sałatka: " ++ show(x_salatka) ++ "\n" ++
        "Skrzydełka: " ++ show(x_skrzydelka) ++ "\n" ++
        "Paluszki: " ++ show(x_paluszki) ++ "\n" ++
        "Zestaw próbny: " ++ show(x_zestaw_probny) ++ "\n"]