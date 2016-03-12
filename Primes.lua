--
-- Prime Calculator by E. W. Dijkstra
--
-- as presented in
--
--     A.S. Tanenbaum - General-Purose Macro Processor as a Poor Man's Compiler-Compiler, IEEE TOSE, Sol.SE-2, No.2, JUNE 1976
--

function PRIME(N)
  local X, SQUARE, I, K, LIM, PRIM
  local P, V = {}, {}
  P[1] = 2
  X = 1
  LIM = 1
  SQUARE = 4
  for I = 2, N do
    repeat
      X = X + 2
      if SQUARE <= X then
        V[LIM] = SQUARE
        LIM = LIM + 1
        SQUARE = P[LIM] * P[LIM]
      end
      local K = 2
      local PRIM = true
      while PRIM and K < LIM do
        if V[K] < X then
          V[K] = V[K] + P[K]
        end
        PRIM = X ~= V[K]
        K = K + 1
      end
    until PRIM
    P[I] = X
  end
  return P
end

function main()
  for _,p in pairs(PRIME(100)) do
    print(p)
  end
end
main()
