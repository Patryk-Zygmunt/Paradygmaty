import Distribution.Simple

xo str= ( (length (filter (\x->x/='x'  && x/= 'X') str)) == (length (filter (\x->x/='o'&& x/= 'O') str )))


splitSign (Just l)= [(length ( (filter (0<) l))),(foldl (+) 0 (filter (0>) l ))]



cont w l = Just & filter (\x-> contai w x ) l
contai w x  =

iseq _ [] = False
iseq w (a:l)
           |len && (((take (length w) (a:l))) == w) = True
            |True  = iseq w l
           where len = length (a:l) >= length w


eat9  ( (a:n:b:l))
             | check a n b = [a] ++ eat9 (b:l)
             | True  = [a] ++ eat9 (n:b:l)
             where check a n b = (n=='9' && a=='7' && b=='7')

eat9 l = l