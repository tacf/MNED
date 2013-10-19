function y = metRK4 (f, a, b, alpha, N)
% Método de Runge-Kutta de ordem 4.
%

  brk4 = ToButcher([0 1/2 1/2 1], [1/2 0 0; 0 1/2 0; 0 0 1], [1/6 1/3 1/3 1/6], 4);
  y    = RungeKutta(brk4, f, a, b, alpha, N);
end
