--
-- Prime Calculator by E. W. Dijkstra
--
-- as presented in
--
--     A.S. Tanenbaum - General-Purose Macro Processor as a Poor Man's Compiler-Compiler, IEEE TOSE, Sol.SE-2, No.2, JUNE 1976
--
-- Changes:
-- - literal tranlation to lua
--

local N = 100
local M = 10
function PRIME()  -- PROCEDURE DECLARATION;
  local X, SQUARE, I, K, LIM, PRIM -- DECLARATION OF VARIABLES;
  local P, V = {}, {}
  P[1] = 2 -- ASSIGNMENT TO FIRST ELEMENT OF p;
  print(2) -- OUTPUT A LINE CONTAINING THE NUMBER 2;
  X = 1
  LIM = 1
  SQUARE = 4
  for I = 2, N do -- LOOP. I TAKES ON 2, 3, ... N;
    repeat -- STOPS WHEN "UNTIL" CONDITION IS TRUE;
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
    until PRIM -- THIS LINE CLOSES THE REPEAT
    P[I] = X
    print(X)
  end
end
PRIME()
