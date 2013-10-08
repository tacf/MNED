function y = metEuler_ha (f, h, a, ya, N)
% Aproximação da solução de um sistema de PVI pelo método de Euler.
%
% y = metEuler_ha (f, h, a, ya, N)
%
% Calcula uma aproximação para a solução y = [y_1, y_2, ..., y_i] de
% um sistema de problemas de valores iniciais (PVI)
%
%    y'   = F(x, y)
%    y(a) = [y_1(a), y_2(a), ..., y_i(a)]
%
% com x a variar entre a, a+h, a+2h, ..., a+N*h.
%
% O resultado é uma tabela N+1*i em que a n-ésima linha é
% constituída pelas aproximações y_1(a+n*h), y_2(a+n*h), ...,
% y_i(a+n*h).
%
% EXEMPLO:
%
% A equação de van der Pol
%
%    y''(x) - u*(1-y(x)^2)*y'(x) + y(x) = 0
%    y(a)  = alpha
%    y'(a) = beta
%
% pode ser reescrita num sistema como
%
%    y'(x) = r(x)
%    r'(x) = u*(1-y(x)^2)*r(x) - y(x)
%    y(a)  = alpha
%    r(a)  = beta
%
% Transportando para matrizes, podemos considerar o sistema
%
%    [y ; r]'      = [r ; u*(1-y(x)^2)*r(x) - y(x)]
%    [y(a) ; r(a)] = [alpha ; beta]
%
% equivalentemente
%
%    z'   = F(x, z)
%    z(a) = [alpha ; beta]
%
% onde F=@(x,z) [z(2) ; u*(1-z(1)^2)*z(2) + z(1)].
%
% Se tomarmos u = 1, a = 1, alpha = 2 e beta = 0, podemos aproximar
% os pontos y(1.1), y'(1.1), y(1.2), y'(1.2), ..., y(2), y'(2) através
% dos comandos:
%
%    f = @(x,z) = [z(2) ; (1-z(1)^2)*z(2) + z(1)];
%    metEuler_ha (f, 0.1, 1, [2 ; 0], 10)
%
% A 1ª coluna do resultado contém as aproximações y(1), y(1.1), ...,
% y(2) e a 2ª coluna as aproximações y'(1), y'(1,1), ..., y'(2).
%

  % Permitir que z(a) seja dado tanto por um vector linha como por um
  % vector coluna.
  if (1 == size(ya,1))
     ya = ya';
  end

  x(1)   = a;
  y(1,:) = ya;
  
  for i=1:N
    x(i+1)   = x(i) + h;
    y(i+1,:) = y(i,:) + h*f(x(i), y(i,:))';
  end

end
