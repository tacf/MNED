function y = metRK2 (f, a, b, alpha, N)
% Método de Runge-Kutta de ordem 2.
%

  brk2 = ToButcher([0 1], [1 0], [1/2 1/2], 2);
  y    = RungeKutta(brk2, f, a, b, alpha, N);
end
