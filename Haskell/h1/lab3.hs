qwa f p l =  map f  $ filter p l

go  o v = v  o

rev l = foldr (\x y->y++[x]) [] l

pis f s e = sum $ map f [s..e]

firs l = filter (filt) l
filt a = (all (\x -> ( a `mod` x)  /= 0) [2..(a-1)])
