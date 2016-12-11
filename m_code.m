clc
clear
close all

% Initializarea valorilor perioadei si numarului de coeficienti
P = 40;
N = 50;

% Setarea duratei si generarea semnalului triunghiular
t = 1:0.01:6;
x_tr = sawtooth(2*pi*t/P, 0.5);

% Calculul coeficientilor seriei 
for k = 1:50
    f = @(t) x_tr.*(exp(-i*k*2*pi*t/P));
    X(k) = integral(f , 1, P);     % prima varianta de calcul
%     X(k) = int(x_tr.*abs(exp(-i*k*2*pi*t/P)), t, 0, P); %a doua varianta
end

% Refacerea semnalului utilizand coeficientii obtinuti
s = 0;
for k = 1:50
    s = s + X(k)*exp(j*k*2*pi*t/P);
end

x_ref = X(0)/P + 2*s;

% Afisarea rezultatelor
plot(t, x_tr, 'r', t, x_ref, 'b')
title('Graficul semnalelor')
xlabel('Timp [s]')
ylabel('Amplitudine [V]')



