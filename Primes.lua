--
-- Prime Calculator by E. W. Dijkstra
--
-- as presented in
--
--     A.S. Tanenbaum - General-Purose Macro Processor as a Poor Man's Compiler-Compiler, IEEE TOSE, Sol.SE-2, No.2, JUNE 1976
--

function prime(N)
  local x, x_isprime = 1, nil
  local SQUARE, LIM = 4, 1
  local P, V = {1}, {}
  while #P < N do
    repeat
      x = x + 2
      if SQUARE <= x then
        V[LIM] = SQUARE
        LIM = LIM + 1
        SQUARE = P[LIM] * P[LIM]
      end
      x_isprime = true
      for k = 2, LIM - 1 do
        if not x_isprime then break end
        if V[k] < x then
          V[k] = V[k] + P[k]
        end
        x_isprime = x ~= V[k]
      end
    until x_isprime
    P[#P + 1] = x
  end
  return P
end

function main()
  for _,p in pairs(prime(100)) do
    print(p)
  end
end
main()
