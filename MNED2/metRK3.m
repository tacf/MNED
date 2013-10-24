function y = metRK3 (f, a, b, alpha, N)
% Método de Runge-Kutta de ordem 3.
%

  brk3 = ToButcher([0 1/2 1], [1/2 0 0; -1 2 0], [1/6 4/6 1/6], 3);
  y    = RungeKutta(brk3, f, a, b, alpha, N);
end
