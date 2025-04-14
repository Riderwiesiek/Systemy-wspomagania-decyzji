%include "alldifferent.mzn";  % Dodajemy bibliotekę

%int: N;

%array[1..N] of var 1..N: rows;
%array[1..N] of var 1..N: cols;

% Królowe w różnych wierszach
%constraint alldifferent(rows);

% Przekątne ↘ (rows[i] + i różne)
%constraint alldifferent([rows[i] + i | i in 1..N]);

% Przekątne ↙ (rows[i] - i różne)
%constraint alldifferent([rows[i] - i | i in 1..N]);

% Ręczne odwrotne przypisanie (rows do cols)
%constraint forall(i in 1..N) (
%    cols[rows[i]] = i
%);

%solve satisfy;

%output ["rows = ", show(rows), "\ncols = ", show(cols)];


include "alldifferent.mzn";  % Dodanie biblioteki do obsługi "alldifferent"

int: N;  % Liczba królowych (rozmiar szachownicy N x N)

% Zmienne decyzyjne
array[1..N] of var 1..N: rows;  % Gdzie znajduje się królowa w każdym wierszu
array[1..N] of var 1..N: cols;  % Gdzie znajduje się królowa w każdej kolumnie

% Ograniczenia

% 1. Wszystkie królowe muszą być w różnych wierszach
constraint alldifferent(rows);

% 2. Wszystkie królowe muszą być w różnych przekątnych ↘ (rosnąca suma wiersza i kolumny)
constraint alldifferent([rows[i] + i | i in 1..N]);

% 3. Wszystkie królowe muszą być w różnych przekątnych ↙ (rosnąca różnica wiersza i kolumny)
constraint alldifferent([rows[i] - i | i in 1..N]);

% 4. Ręczne odwrotne przypisanie, gdzie cols odpowiada odwrotności rows
constraint forall(i in 1..N) (
    cols[rows[i]] = i
);

% Rozwiązanie: szukamy dowolnego rozwiązania
solve satisfy;

% Wyświetlanie rozwiązania
output ["rows = ", show(rows), "\ncols = ", show(cols)];
