function y = metEuler (f, h, a, ya, N)
% Aproximação da solução de um PVI pelo método de Euler.
%
% y = metEuler (f, h, a, ya, N)
% 
% Calcula uma aproximação para a solução y de um problema de
% valores iniciais (PVI)
%
%    y'(x) = f(x, y(x))
%    y(a)  = alpha
%
% com x a variar entre a, a+h, a+2h, ..., a+N*h.
%
% PARAMETROS:
%
% ya corresponde a alpha, o valor inicial da solução.
% N é o total de pontos discretizados.
%
% EXEMPLO:
%
% A solução exacta do PVI
%
%    y'(x) = x*y(x)
%    y(0)  = 1
%
% é y(x) = e^((x^2)/2). Uma aproximação dos pontos y(0.2) e y(0.4)
% é obtida através do comando
%
%    metEuler (@(x,y) x*y, 0.2, 0, 1, 2)
%

  x(1) = a;
  y(1) = ya;
  
  for i=1:N+1
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + h * f(x(i), y(i));
  end

  y=y(2:N+1); % descartar y(1) que é a solução inicial dada.
end
