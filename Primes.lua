--
-- Prime Calculator by E. W. Dijkstra
--
-- as presented in
--
--     A.S. Tanenbaum - General-Purose Macro Processor as a Poor Man's Compiler-Compiler, IEEE TOSE, Sol.SE-2, No.2, JUNE 1976
--

function prime(N)
  local x, x_isprime = 1, nil
  local p_square, p_idx = 4, 1
  local P, PM = {1}, {}
  while #P < N do
    repeat
      x = x + 2
      if p_square <= x then
        PM[p_idx] = p_square
        p_idx = p_idx + 1
        p_square = P[p_idx] * P[p_idx]
      end
      x_isprime = true
      for k = 2, p_idx - 1 do
        if PM[k] < x then
          PM[k] = PM[k] + P[k]
        end
        if x == PM[k] then
          x_isprime = false
          break
        end
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
