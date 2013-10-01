function comp = compara (f, h, a, ya, N, y)
% Compara a aproximação obtida pelo método de Euler com a solução exacta.
%
% comp = compara (f, h, a, ya, N, y)
%
% Expõe lado-a-lado os resultados das aproximações com os valores exactos,
% deduzindo-se assim o erro cometido ponto-a-ponto.
%
% A saída é uma tabela de 4 colunas:
%  1ª coluna: os pontos a+h, a+2h, ..., a+N*h
%  2ª coluna: as aproximações para os pontos a+h, ..., a+N*h
%  3ª coluna: os valores exactos para os pontos a+h, ..., a+N*h
%  4ª coluna: a diferença entre os valores exactos e os aproximados
%
% PARAMETROS:
%
% f, h, a, ya, N são os argumentos para 'metEuler'.
% y é a solução analítica do PVI.
%
% EXEMPLO:
%
% A solução exacta do PVI
%
%    y'(x) = x*y(x)
%    y(0)  = 1
%
% é y(x) = e^((x^2)/2). O erro cometido pelo método de Euler nos pontos
% y(0.1), y(0.2), y(0.3) e y(0.4) é encontrado através do comando:
%
%    compara (@(x,y) x*y, 0.1, 0, 1, 4, @(x) e^((x^2)/2))
%

  aprox = metEuler (f, h, a, ya, N);
  exact = arrayfun (y, a+h:h:(h*N));
  erro  = exact .- aprox;
  comp  = [(a+h:h:h*N); aprox; exact; erro].';
end
