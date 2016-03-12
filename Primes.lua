--
-- Prime Calculator by E. W. Dijkstra
--
-- as presented in
--
--     A.S. Tanenbaum - General-Purose Macro Processor as a Poor Man's Compiler-Compiler, IEEE TOSE, Sol.SE-2, No.2, JUNE 1976
--

function prime(N)
  -- returns a table of the first N prime numbers.
  local P = {2} -- we know that 2 is prime
  -- We track the following information:
  local x, x_isprime = 1, false -- the current prime candidate
  local PM = {} -- PM[k] is always a multiple of P[k]
  local p_square, p_idx = 4, 1 -- P[p_idx]^2 == p_square
  while #P < N do
    repeat
      x, x_isprime = x + 2, true
      if p_square <= x then
        -- Initialize PM[p_idx] to a multiple of the pivotal prime P[p_idx]
        -- Any multiple, that is not greater than x would give correct results.
        -- We have the ideal candidate at hand:
        PM[p_idx] = p_square
        p_idx, p_square = p_idx+1, P[p_idx+1]^2
      end
      for k = 2, p_idx - 1 do
        if PM[k] < x then PM[k] = PM[k] + P[k] end
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
