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
  local x = 1 -- the current prime candidate
  local PM = {} -- PM[k] is always a multiple of P[k]
  local p_square = 4 -- is always square of pivot prime P[#PM+1]
  local is_prime = function(x)
    for k = 2, #PM do
      if x > PM[k] then PM[k] = PM[k] + P[k] end
      if x == PM[k] then return false end
    end
    return true
  end
  while #P < N do
    repeat
      x = x + 2
      if x >= p_square then
        PM[#PM+1], p_square = p_square, P[#PM+2]^2
      end
    until is_prime(x)
    P[#P + 1] = x
  end
  return P
end

function isPrime(n)
	primes={}
	if n<=0 then return false end
	if n<=2 then return true end
	if (n%2==0) then return false end
	for i=3,n/2,2 do
		if (n%i==0) then return false end
	end
	return true
end

function main()
  for _,p in pairs(prime(100)) do
    print(p)
    assert(isPrime(p))
  end
end
main()
