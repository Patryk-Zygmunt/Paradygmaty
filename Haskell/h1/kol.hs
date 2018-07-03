import System.Directory (doesDirectoryExist, getDirectoryContents)
import Control.Monad.Writer
import Data.List

data Student = Student {id :: Int, name :: String, dateOfBirth :: String} deriving Show
data Score = Score {studentId :: Int, course1Score :: Int,
course2Score :: Int, course3Score :: Int} deriving Show
data Sc = Sc {i :: Student, o:: Score} deriving Show






pr [] s n = s ++ n ++ s
pr l s n = l ++ n ++ s

mem l s = do
          print l
          n <- getLine
          if (n /= "e") then
                   mem (pr l s n) s
          else
                return ()

mss p  = do
       g<-doesDirectoryExist p
       print p
       print g
       if g then
           do
          return []
        else
            do
            return p

lss  = do
               dirs <- getDirectoryContents "D:/Paradygmaty/"
               sd <- mapM  getDirectoryContents  $ map  ("D:/Paradygmaty/"++)  $ filter (\x-> x /="." && x /=".." ) dirs
               sw <- mapM (mapM mss)  $ zipWith (\x y->map (\t->"D:/Paradygmaty/"++x++"/"++t) y) dirs sd
               let r = zipWith (\x y->(x,length ( filter (""/=) y))) dirs   sw
               print   sw
               print   r




cou =    do
         sl <- mapM readFile ["D:/Paradygmaty/a.txt","D:/Paradygmaty/b.txt"]
         let pw = words $ foldl (++) "" sl
         let dis = nub pw
         let cw = map (\x -> (x,length (filter (x==) pw))) dis
         print cw

















