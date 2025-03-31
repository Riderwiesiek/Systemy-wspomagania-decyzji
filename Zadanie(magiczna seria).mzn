int: len;  % Długość ciągu
array[1..len] of var 0..len: a;  % Ciąg a

% Warunki: liczba a[i] mówi ile razy liczba (i-1) występuje w ciągu
constraint forall(i in 1..len) (
    a[i] == sum([1 | j in 1..len where a[j] == i-1])
);

% Rozwiązanie
solve satisfy;

% Wyświetlanie wyników
output ["a = \(a)"];
