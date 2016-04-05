module DijkstraPrimes(primes) where

{-
        DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
                    Version 2, December 2004 
 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net> 
 Everyone is permitted to copy and distribute verbatim or modified 
 copies of this license document, and changing it is allowed as long 
 as the name is changed. 
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 
  0. You just DO WHAT THE FUCK YOU WANT TO.
  
  Copyright © 2061 PoroCYon
This work is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You
Want To Public License, Version 2, as published by Sam Hocevar.
See http://www.wtfpl.net/ for more details.
-}

import Data.List
import Data.Maybe

(|>) :: a -> (a -> b) -> b
(|>) x f = f x

isPrime :: [Int] -> [Int] -> Int -> ([Int], Bool)
isPrime p q x =
    let q' = [ 0 .. length q - 1] |> map (\ i -> let e = q !! i in if i /= 0 && x > e then e + p !! i else e)
    in (q', if null q' then True else q' |> drop 1 |> elem x |> not)

iterWhile :: (a -> a) -> (a -> (Bool, a)) -> a -> a
iterWhile f p x = let (v, x') = p x in if v then x' else iterWhile f p (f x')

iterDWhile :: (a -> a) -> (a -> (Bool, a)) -> a -> a
iterDWhile f p x = iterWhile f p (f x)

primes :: [Int]
primes =
    2 : (unfoldr (\ (x, l , p, q) ->
                let (q', x', l') = iterDWhile
                                    (\ (q, x, l) ->
                                        let x' = x + 2                             in
                                        let q' = if x' >= l then q ++ [ l ] else q in
                                        let l' = if x' >= l then let v = p !! (length q + 1) in v * v else l
                                        in (q', x', l'))
                                    (\ (q, x, l) -> let (q', v) = isPrime p q x in (v, (q', x, l)))
                                    (q, x, l)
                in Just (x', (x', l', p ++ [  x' ], q'))
            ) (1, 4, [ 2 ], []))
