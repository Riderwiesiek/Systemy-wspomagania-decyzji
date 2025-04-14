% Liczba wierzchołków i krawędzi (wczytywana z .dzn)
int: nodesNumber;
int: edgesNumber;

% Lista krawędzi: każda para (i,j) oznacza krawędź
array[1..edgesNumber, 1..2] of int: edges;

% Zmienna: kolor przypisany do każdego węzła (od 1 do nodesNumber)
array [1..nodesNumber] of var 1..nodesNumber: nodes;

% Maksymalna liczba kolorów (do minimalizacji)
var 1..nodesNumber: colorsNumber;

% Ograniczenie: sąsiednie wierzchołki muszą mieć różne kolory
constraint
  forall(e in 1..edgesNumber) (
    let {
      var int: u = nodes[edges[e, 1]],
      var int: v = nodes[edges[e, 2]]
    } in
      u != v
  );

% Liczba kolorów to maksymalny kolor użyty
constraint colorsNumber = max(nodes);

% --- ŁAMANIE SYMETRII ---
int: minColorsNumber;
constraint forall(i in 1..minColorsNumber)(nodes[i] = i);

% Cel: zminimalizować liczbę kolorów
solve minimize colorsNumber;
