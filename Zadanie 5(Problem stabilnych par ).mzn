% Dane wejściowe
int: n; % Liczba mężczyzn i kobiet
array[1..n, 1..n] of int: m_ranks; % Preferencje mężczyzn (rankingi kobiet)
array[1..n, 1..n] of int: w_ranks; % Preferencje kobiet (rankingi mężczyzn)

% Zmienne decyzyjne
array[1..n] of var 1..n: wives;    % Żona dla każdego mężczyzny
array[1..n] of var 1..n: husbands; % Mąż dla każdej kobiety

% 1. Spójność wzajemna (mężczyzna m ma żonę w, kobieta w ma męża m)
constraint forall(m in 1..n) (
    husbands[wives[m]] = m
);
constraint forall(w in 1..n) (
    wives[husbands[w]] = w
);

% 2. Stabilność par
constraint forall(m in 1..n, w1 in 1..n, w2 in 1..n where w1 != w2) (
    (m_ranks[w1, m] < m_ranks[w2, m]) -> (w_ranks[w1, husbands[w1]] < w_ranks[w1, m])
);

constraint forall(w in 1..n, m1 in 1..n, m2 in 1..n where m1 != m2) (
    (w_ranks[w, m1] < w_ranks[w, m2]) -> (m_ranks[m1, w] < m_ranks[m2, w])
);

% 3. Nadmiarowe ograniczenia
% Użycie predykatu `alldifferent` dla zmiennych wives i husbands.
constraint forall(m in 1..n) (
    forall(m2 in 1..n where m != m2)(wives[m] != wives[m2])
);
constraint forall(w in 1..n) (
    forall(w2 in 1..n where w != w2)(husbands[w] != husbands[w2])
);

% 4. Zakotwiczenie
% Możemy zdefiniować, że Adam (mężczyzna 1) ma być z Beatą (kobieta 2)
constraint wives[1] = 2;  % Adam (mężczyzna 1) ma być z Beatą (kobieta 2)

% 5. Łamanie symetrii
constraint wives[1] < wives[2]; % Pierwsza para ma "najlepszą" partnerkę

% Rozwiązywanie problemu
solve satisfy;

% Wyświetlanie rozwiązania
output ["wives = ", show(wives), "\nhusbands = ", show(husbands)];
