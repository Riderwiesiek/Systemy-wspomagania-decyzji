% Dane wejściowe
int: items_n;                           % liczba przedmiotów
int: knapsacks_n;                       % liczba plecaków
int: capacity;                          % pojemność każdego plecaka

array[1..items_n] of int: values;       % wartość każdego przedmiotu
array[1..items_n] of int: weights;      % waga każdego przedmiotu

% Zmienna: czy przedmiot j jest w plecaku i
array[1..knapsacks_n, 1..items_n] of var 0..1: taken;

% Każdy przedmiot może być zapakowany do co najwyżej jednego plecaka
constraint
  forall(j in 1..items_n)(
    sum(i in 1..knapsacks_n)(taken[i, j]) <= 1
  );

% Waga w każdym plecaku nie może przekroczyć jego pojemności
constraint
  forall(i in 1..knapsacks_n)(
    sum(j in 1..items_n)(taken[i, j] * weights[j]) <= capacity
  );

% Łamanie symetrii — porównanie leksykograficzne plecaków
%constraint
%  forall(i in 1..knapsacks_n-1)(
%    lex_less([taken[i, j] | j in 1..items_n], [taken[i+1, j] | j in 1..items_n])
%  );

% Funkcja celu: maksymalizuj sumę wartości zapakowanych przedmiotów
var int: total_value = sum(i in 1..knapsacks_n, j in 1..items_n)(taken[i,j] * values[j]);

output [
  "Total value: \(total_value)\n",
  "Taken:\n",
  concat([ "Knapsack \(i): " ++ show([taken[i, j] | j in 1..items_n]) ++ "\n"
           | i in 1..knapsacks_n ])
];