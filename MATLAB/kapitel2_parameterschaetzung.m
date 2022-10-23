%Matlab Skript zur Aufgabe "Temperaturschätzung" in VL2
load("temperaturmessung.mat");

% Modellansatz= T5 = theta1* T1 + theta2* T2 + theta3* T3+ theta4*T4
y=T5;% T5 ist Ausgangsgrösse
M=[T1 T2 T3 T4]; %Messwerte
theta = pinv(M)*y; %Berechnung parameter mit pseudoinverse
display(theta); %Parameterwerte ausgeben

e=(y-M*theta); %Schätzfehler berechnen
e_squared = transpose(e)*e; %quadratisches Fehlermaß berechnen
display(e_squared); %Fehler ausgeben

% Modellansatz= T5 = theta1* T1 + theta2* T2 + theta3* T3+ theta4*T4 + theta5*T1*T2
M_new = [T1 T2 T3 T4 T1.*T2]; %Messvektor erhält aufgrund verändertem Modellansatz weitere komponente (beachte: Komponentenweise multiplikation!)
theta_new = pinv(M_new)*y;
display(theta_new);
e_new=(y-M_new*theta_new);
e_squared_new = transpose(e_new)*e_new;
display(e_squared_new);

%Hinweis: der zweite Modellansatz führt hier auf einen kleineren fehler, da
%es mehr Parameter (und somit auch mehr Freiheitsgrade) gibt um die Daten
%zu approximieren. Allerdings ist ein Modell mit mehr Parametern in der
%Praxis nicht immer besser! (erinnere Diskussion inder Vorlesung zum Thema
%Oferfitting)