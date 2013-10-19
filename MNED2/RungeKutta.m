function y = RungeKutta (butcher, f, a, b, alpha, N)
% Implementa o método de Runge-Kutta indicado pelo quadro de Butcher.
%
  [bs, ba, bb, bc] = FromButcher (butcher);
  
  h    = (b-a)/N;
  x(1) = a;
  y(1) = alpha;

  for i=1:N
    k(1) = h * f(x(i), y(i));
    for j=2:bs
      k(j) = h*f(x(i) + bc(j)*h, y(i) + sum(ba(j-1,1:j-1) .* k(1,j-1)));
    end

    x(i+1) = x(i) + h;
    y(i+1) = y(i) + sum(bb .* k);
  end

end
