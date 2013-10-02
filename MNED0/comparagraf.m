function comparagraf (f, h, a, ya, N, y)
% Auxiliar visual à função 'compara'.
%
% comparagraf (f, h, a, ya, N, y)
%
% Mostra num único gráfico os resultados das aproximações (a vermelho) 
% e os valores exactos (a azul).
%
% PARAMETROS:
%
% f, h, a, ya, N, y são os argumentos para 'compara'.
%
% EXEMPLO:
%
% A solução exacta do PVI
%
%    y'(x) = x*y(x)
%    y(0)  = 1
%
% é y(x) = e^((x^2)/2). Para comparar visualmente as aproximações obtidas
% segundo o método de Euler nos pontos y(0.1), y(0.2), y(0.3) e y(0.4) com
% os valores exactos, invoca-se o comando:
%
%    comparagraf (@(x,y) x*y, 0.1, 0, 1, 4, @(x) e^((x^2)/2))
%

  comparacao = compara (f, h, a, ya, N, y);

  exact = comparacao (1:N, 3);
  aprox = comparacao (1:N, 2);
  xx    = comparacao (1:N, 1);

  figure ();
  plot (xx, exact, '-ob');
  hold on;
  plot (xx, aprox, '-or');

end
