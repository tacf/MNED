function [x,y] = RungeKuttaadapt (rk, f, a, b, alpha, TOL, N=2)
% Aplica um método de Runge-Kutta seguindo a estratégia de passo variável.
%
% [x,y] = RungeKuttaadapt (rk, f, a, b, alpha, TOL, N=2)
%
% PARAMETROS:
%
% rk é um método de Runge-Kutta, e.g. @metRK2 ou @metRK4.
%

  x(1) = a;
  y(1) = alpha;
  i = 1;

% Escrito com ciclos while em vez de ciclos do-until/repeat-until por razões 
% de compatibilidade entre Octave e Matlab.

  while x(i) < b
    h = (b-a)/N;
    tol = TOL;
    xih = min(x(i)+h, b);

    y1 = rk(f, x(i), xih, y(i), 1)(end);
    y2 = rk(f, x(i), xih, y(i), 2)(end);

    while abs(y1-y2) > tol
      h = h/N;
      tol = tol/N;
      xih = min(x(i)+h, b);
      y1 = rk(f, x(i), xih, y(i), 1)(end);
      y2 = rk(f, x(i), xih, y(i), 2)(end);
    end

    x(i+1) = xih;
    y(i+1) = y2;
    i = i+1;
  end
end
