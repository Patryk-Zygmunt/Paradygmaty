--Write a function that removes every lone 9 that is inbetween 7s.
eat9  ( (a:n:b:l))
             | check a n b = [a] ++ eat9 (b:l)
             | True  = [a] ++ eat9 (n:b:l)
             where check a n b = (n=='9' && a=='7' && b=='7')

eat9 l = l

countPositivesSumNegatives :: Maybe [Int] -> [Int]
countPositivesSumNegatives Nothing = []
countPositivesSumNegatives (Just []) = []
countPositivesSumNegatives (Just l) = [(length ( (filter (0<) l))),(foldl (+) 0 (filter (0>) l ))]
---
isSortedAndHow :: [Int] -> String
isSortedAndHow lst = check lst

check(a:b:l)
        |a>=b = desc (a:b:l)
        |a<=b = asc (a:b:l)
asc [_] = "yes, ascending"
asc (a:b:l)= if (a<=b) then asc (b:l) else "no"
desc [_]="yes, descending"
desc (a:b:l) = if (a>=b) then desc (b:l) else "no"
------
-- | Returns true if the number of
-- Xs is equal to the number of Os
-- (case-insensitive)
xo :: String -> Bool
xo str= ( (length (filter (\x->x/='x'  && x/= 'X') str)) == (length (filter (\x->x/='o'&& x/= 'O') str )))
---
---expandedForm 12    -- Should return '10 + 2'
expandedForm :: Int -> String
expandedForm n = conc $ zerros (show n)

licz [] c = c
licz (x:l) c =  licz  l  $ [(x,(length c))] ++ c 

addZ (x,l) = [x] ++ ['0'|z<-[1..l]]

zerros l = map addZ   (filter  (\(x,_)->x/='0')  (licz (reverse( l)) []))

conc [x] = x
conc (x:l) = x ++ " + "++ conc l 
---
powersOfTwo :: Int -> [Int]
powersOfTwo n = [(2^x)|x<-[0..n]]
-----
----Maximum Length Difference
mxdiflg :: [String] -> [String] -> Maybe Int
mxdiflg s1 s2 = maxdf s1 s2

maxdf [] [] = Nothing  
maxdf _ [] = Nothing
maxdf [] _ = Nothing
maxdf s1 s2 = Just $ findMax (shortestWord s1 (length (head s1)),(longestWord s1 0)) ((shortestWord s2 (length (head s2))),(longestWord s2 0))


findMax (s1,l1) (s2,l2)  = max (abs(l1-s2))   (abs(l2-s1))


longestWord [] long = long 
longestWord (w:l) long 
                 |long < length w = longestWord l (length w)
                 |True  = longestWord l long

shortestWord [] short = short
shortestWord (w:l) short 
                 |short > length w = shortestWord l (length w)
                 |True  = shortestWord l short
                 
 ---
                