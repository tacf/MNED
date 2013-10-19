function [s, a, b, c] = FromButcher (butcher)
% Desconstrói um quadro de Butcher.
%
% [s, a, b, c] = FromButcher (butcher)
%
% Extrai os valores s, a, b, c de uma tabela com o formato:
%
%    c(1)
%    c(2)    a(2,1)
%    c(3)    a(3,1)    a(3,2)
%    ...     ...       ...      ... ...
%    c(s-1)  a(s-1,1)  a(s-1,2) ... a(s-1,s-1)
%    c(s)    a(s,1)    a(s,2)   ... a(s,s-1)    a(s,s)
%            b(1)      b(2)     ... b(s-1)      b(s)
%
% Contrastar esta função com 'ToButcher'.
%

  s = length(butcher)-1;
  c = butcher(1:s,1);
  b = butcher(s+1,2:s+1);
  a = butcher(2:s,2:s);

end
