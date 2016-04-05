module DijkstraPrimes(primes) where

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
