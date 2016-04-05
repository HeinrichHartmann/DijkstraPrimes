module DijkstraPrimes

let isPrime p q x =
    let q' = [ 0 .. List.length q - 1 ] |> List.map (fun i -> let e = List.nth q i in if i <> 0 && x > e then e + List.nth p i else e)
    in (q', if List.isEmpty q' then true else q' |> Seq.skip 1 |> Seq.exists ((=) x) |> not)
let rec iterWhile  f p x = let v, x' = p x in if v then x' else iterWhile f p (f x')
let     iterDWhile f p x = iterWhile f p (f x)
let primes () =
    Seq.append [2] (
        Seq.unfold (fun (x, l, p, q) ->
            let q', x', l' =
                iterDWhile
                    (fun (q, x, l) ->
                        let x' = x + 2
                        let q' = if x' >= l then q @ [ l ] else q
                        let l' = if x' >= l then let v = List.nth p (List.length q + 1) in v * v else l
                        in q', x', l')
                    (fun (q, x, l) -> let q', v = isPrime p q x in v, (q', x, l))
                    (q, x, l)
            in Some (x', (x', l', p @ [ x' ], q'))
    ) (1, 4, [ 2 ], List.empty)) |> Seq.cache // for perf
