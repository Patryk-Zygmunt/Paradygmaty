 
import Data.List
import Data.Tree
import Data.Char
data Color = B|W|E deriving Eq
newtype Pole = P (Int,Int,Color)
newtype Tablica= T [Pole]
rozmiar=19
glebokosc=1
instance Show Tablica where  
              show (T (t))= printTablica t
			  
printTablica [] = ""
printTablica (x:xs)= (show x) ++ printTablica xs
 

 
instance Show Color where 
                show  B ="B"
                show  W ="W"
                show  E ="-"
                
instance Show Pole where
        show (P(x,y,c))
                |(x==1 &&y==1)= "["++ show c ++ "]"
                |x<rozmiar = "["++ show c ++ "]"
                |x==rozmiar = "["++ show c ++ "]"++ "\n" 
instance Ord Pole where
          	compare (P(x1,y1,_)) (P(x2,y2,_))
                                           	|y1 < y2 = LT
                                           	|y1 > y2 = GT
                                           	|x1 < x2 = LT
                                           	|x1 > x2 = GT
                       	 
instance Eq Pole where
          	(==) (P(x1,y1,_)) (P(x2,y2,_)) =(x1==x2 && y1==y2)
          	(/=) (P(x1,y1,_)) (P(x2,y2,_)) = y1/=y2 || x1/=x2   	


add x y c  p = zrobRuch (P(x,y,c)) p			
----Przeszukiwanie						
findPole x y (l) = (l !!((x-1)+((y-1)*rozmiar)))
przekatnaGora (P(x,y,c)) l   =findPole (x+1) (y-1) l 
przekatnaDol (P(x,y,c)) l   =findPole (x-1) (y+1) l 

---funkcje pomocnicze
zwrocKolor (P(x,y,c)) = c
zwrocX (P(x,y,c)) = x
zwrocY (P(x,y,c)) = y
isEmpty (P(x,y,c))=c==E  

---szukanie sasiadow i wartsciowanie
przekatnaTMP x1 y1 x2 y2
                     | x1==x2 && y1==y2= True
					 | (x1==(x2-1)) && (y1==(y2+1)) = True
					 | (x1==(x2+1)) && (y1==(y2-1)) = True
					 |  y2>20 && x2>20=False
					 |otherwise = przekatnaTMP x1 y1 (succ x2) (succ y2)
					 
lezyNaPrzekatnej (P(x1,y1,c1)) (P(x2,y2,c2)) =  (przekatnaTMP x1 y1 (x2-rozmiar) (y2-rozmiar))

zwrocPionowe _ []=[]
zwrocPionowe (P(x,y,c))  (p:ps)
                   |zwrocX p == x  =p:zwrocPionowe (P(x,y,c)) ps
                   | otherwise = zwrocPionowe (P(x,y,c)) ps
zwrocPoziome _ []=[]			   
zwrocPoziome (P(x,y,c))  (p:ps)
                   |zwrocY p == y  =p:zwrocPoziome (P(x,y,c)) ps
                   | otherwise = zwrocPoziome (P(x,y,c)) ps
zwrocPrzekatne _ []=[]				    
zwrocPrzekatne (P(x,y,c))  (p:ps)
                   |lezyNaPrzekatnej  (P(x,y,c)) p = p:zwrocPrzekatne (P(x,y,c)) ps
                   | otherwise = zwrocPrzekatne (P(x,y,c)) ps
zwrocSasiadowPion _ []=[]
zwrocSasiadowPion (P(x,y,c)) (p:ps)
                                  |abs((zwrocY p)-y)== 1=p:zwrocSasiadowPion p ps
								  |otherwise = zwrocSasiadowPion p ps
zwrocSasiadowPozio _ []=[]
zwrocSasiadowPozio (P(x,y,c)) (p:ps)                                  
								  |abs((zwrocX p)-x)== 1=p:zwrocSasiadowPozio p ps
                                  |otherwise = zwrocSasiadowPozio p ps								  
zwrocSasiadowPrzek _ []=[]
zwrocSasiadowPrzek (P(x,y,c)) (p:ps)
                                  |abs((zwrocY p)-y)== 1=p:zwrocSasiadowPrzek p ps	
								  |otherwise = zwrocSasiadowPrzek p ps
		
		
listaSasiadow p list=	[1  +(length  $ zwrocSasiadowPozio p (zwrocPoziome p list) )		
                            ,1 + (length  $ zwrocSasiadowPion p (zwrocPionowe p list)) 	
							 ,(length  $ zwrocSasiadowPrzek p (zwrocPrzekatne p list))]
liczbaSasiadow p list = map f $ listaSasiadow p list 

f x 
   |x==5 = 100
   |x==4 =x+3
   |x==3 =x+1
   |x<3  =x
   |x>6  = 0   

----main
parsuj s=(P((digitToInt(s !! 0)),(digitToInt(s !! 2)),B))
ruch s t = zrobRuch (parsuj s) t
	
koniecGryComp t = sprawdzKoniec $ ocenTablice t t W
koniecGryGracz t = sprawdzKoniec $ ocenTablice t t B

sprawdzKoniec [] = False 
sprawdzKoniec (x:l)
                  |x==100 = True
                  |otherwise = sprawdzKoniec l

graj tab = do
             if koniecGryComp tab
                                 then putStrLn "WYGRALES" 
             else if koniecGryGracz tab
                                 then do
                                   putStrLn (show tab)
                                   putStrLn "PRZEGRALES" 
                                else do
                 putStrLn (show tab)     
                 putStrLn "Wprowadz dane w formacie \"x y\" "
                 s <- getLine
                 let newBoard = (T(ruch s tab))
                 let comBoard  = znajdzRuch newBoard
                 putStrLn (show newBoard)				
                 graj comBoard
                 putStrLn ("")
                

main :: IO ()
main = do
    graj pls
    putStr("")

						
							


							

zrobRuch  p  (T([]))   = []
zrobRuch  p  (T(pp:l))
         	| pp/=p =pp:zrobRuch p (T(l))
			| zwrocKolor pp /=E = pp:zrobRuch p (T(l))
         	| pp==p = p:zrobRuch p (T(l))  
 
 
 
newBoard (P(x,z,c)) newColor lst= T(zrobRuch (P(x,z,newColor)) lst)
 
 
tworzTablice (T([])) old lst col =lst
tworzTablice (T(pp:l))  old lst  col
                	|isEmpty pp= tworzTablice (T(l)) old ((newBoard pp col old):lst) col
                	|otherwise = tworzTablice (T(l)) old (lst) col
 
possibleMoves (T(lst)) = tworzTablice (T(lst)) (T(lst)) [] W

---drzewa                        
tworzLas tab =  map (tworzDrzewo)  (possibleMoves tab)
                           

tworzDrzewo t =  Node t  $  tworzLas  t


wezNodeLas n x = map (wezNodeDrzewo n) x


wezNodeDrzewo 1 (Node a _) = Node a []
wezNodeDrzewo n (Node a b) = Node a $ wezNodeLas (n-1) b

ordDrzewo (a,_) (b,_)
             | a>b = GT
             | a<b = LT
             | otherwise = EQ
 

--minmax
maximize  (Node t []) = (ocenaMin t , t)
maximize  (Node a x) = (value, a)
                                where value = fst $ minimumBy (ordDrzewo) $ map (minimize ) x 

minimize  (Node t []) = (ocenaMax t , t)
minimize   (Node a x) = (value, a)
                               where value = fst $ maximumBy (ordDrzewo)  $ map (maximize ) x


minmax  las = maximumBy (ordDrzewo) $ map (minimize) las


ruchzOcena  tab  = ruch
                         where ruch = minmax  $ wezNodeLas glebokosc $ tworzLas  tab
znajdzRuch tab  = ruch
                         where (_,(ruch)) = minmax  $ wezNodeLas glebokosc $ tworzLas  tab







 
 -------Ocenianie
ocenaMax t = maximum(ocenTablice t t (W))
ocenaMin t = maximum(ocenTablice t t (B))
 
 
ocenTablice (T([]))  t col =[]
ocenTablice (T(p:l)) t col
                       |zwrocKolor p == E = (ocenPole t p col):ocenTablice (T(l)) t col
		       |otherwise = (0):ocenTablice (T(l)) t col

ocenPole t p col = maximum $ liczbaSasiadow p (ocenPlansze t (col)) 
 
ocenBiale (T(l)) p = maximum $ liczbaSasiadow p (ocenPlansze (T(l)) W)
ocenCzarne (T(l)) p =maximum $ liczbaSasiadow p (ocenPlansze (T(l)) B)

--zwraca liste pol w danym kolorze
ocenPlansze :: Tablica -> Color -> [Pole]
ocenPlansze (T([])) col  = []
ocenPlansze (T(p:l))  col
                       | zwrocKolor p == col = p:ocenPlansze (T(l)) col 
                       | otherwise = ocenPlansze (T(l)) col
              	 
 
qwe=T([(P(2,2,W)),(P(2,3,B)),(P(1,3,E)),(P(2,1,W))]) 
p1=P(1,1,B)   	 
pls =T( sort [P(x,y,E)| x<-[1..(rozmiar)], y<-[1..(rozmiar)]])
--pl= putStr $ unlines $ (unwords . map ) $ pls
