import Data.List
import Data.Tree

data Color = B|W|E
newtype Pole = P (Int,Int,Color)

--newtype Tablica t = T([Pole]) deriving Show


instance Show Color where
   			 show  B ="B"
   			 show  W ="W"
   			 show  E ="-"
			 
--instance Show Tablica where  
             --  show (T([p])) = [show p]		
		
instance Ord Pole where
   		          compare (P(x1,y1,_)) (P(x2,y2,_))
   									               |y1 < y2 = LT
   									               |y1 > y2 = GT
   									               |x1 < x2 = LT
   									               |x1 > x2 = GT
   						 
instance Eq Pole where
   		   (==) (P(x1,y1,_)) (P(x2,y2,_)) =(x1==x2 && y1==y2)
   		   (/=) (P(x1,y1,_)) (P(x2,y2,_)) = y1/=y2 || x1/=x2  
		   
instance Show Pole where
   	 show (P(x,y,c))
   	         |(x==1 &&y==1)= " ["++ show c ++ "]"
   			 |x<19 = "["++ show c ++ "]"
   			 |x==19 = "["++ show c ++ "]"++ "\n"
   					 
findPole x y (l) = (l !!((x-1)+((y-1)*19)))

changeState  p []  = []
changeState  p  (pp:l)
   	  	| pp/=p =pp: changeState p l  
   	  	| pp==p = p:changeState p l   
		
capb [] lst =[[]]
capb (pp:l) lst = (lst:(changeState pp l))

   					 
 			 
p1 =(1,1,B)   	 
pls = sort [P(x,y,E)| x<-[1..19], y<-[1..19]]
--pl= putStr $ unlines $ (unwords . map ) $ 