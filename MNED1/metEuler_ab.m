function y = metEuler_ab (f, a, b, ya, N)
% O mesmo que
%
%    y = metEuler_ha (f, (b-a)/N, a, ya, N)
%
  y = metEuler_ha (f, (b-a)/N, a, ya, N);
end
