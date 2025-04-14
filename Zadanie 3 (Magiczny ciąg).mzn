int: n;                             % Długość ciągu
set of int: range = 0..n-1;

array[range] of var range: magic;  % Każdy element w zakresie 0..n-1

% Główna definicja magicznego ciągu: dla każdej i, magic[i] = liczba i w tablicy
constraint
  forall(i in range)(
    magic[i] = sum(j in range)(bool2int(magic[j] = i))
  );

% Nadmiarowe ograniczenia
%constraint sum(magic) = n;   % suma wszystkich wartości = liczba elementów
%constraint sum([magic[i] * i | i in range]) = n;   % ważona suma = n

solve satisfy;

output ["magic = ", show(magic)];
