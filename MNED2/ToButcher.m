function butcher = ToButcher (c, a, b, s)
% Gera o respectivo quadro de Butcher.
%
% butcher = ToButcher (c, a, b, s)
%
% Constrói a seguinte tabela:
%
%    c(1)
%    c(2)    a(2,1)
%    c(3)    a(3,1)    a(3,2)
%    ...     ...       ...      ... ...
%    c(s-1)  a(s-1,1)  a(s-1,2) ... a(s-1,s-1)
%    c(s)    a(s,1)    a(s,2)   ... a(s,s-1)    a(s,s)
%            b(1)      b(2)     ... b(s-1)      b(s)
%
% EXEMPLO:
%
% O quadro
%
%    0  |
%    1/2| 1/2
%    1/2| 0    1/2
%    1  | 0    0    1
%    ---+------------------
%       | 1/6  1/3  1/3 1/6
%
% é produzido através da seguinte invocação:
%
%    ToButcher ([0 1/2 1/2 1], [1/2 0 0; 0 1/2 0; 0 0 1], [1/6 1/3 1/3 1/6], 4)
%

  butcher = zeros(s+1);

  for i=2:s
    for j=2:s
      butcher(i,j) = a(i-1,j-1);
    end
  end

  for i=1:s
    butcher(i,1) = c(i);
    butcher(s+1,i+1) = b(i);
  end

end
