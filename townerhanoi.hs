import Data.Char 
import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import AronModule

hanoi::Integer->a->a->a->[(a, a)]
hanoi 0 _ _ _ = []
hanoi n a b c = hanoi (n - 1) a c b ++ [(a, c)] ++ hanoi (n-1) b a c 

hanoiM::Integer->IO ()
hanoiM n = hanoiM' n 1 2 3 where
        hanoiM' 0 _ _ _ = return ()
        hanoiM' n a b c = do  
            hanoiM' (n-1) a c b
            putStrLn $ show a ++ "->" ++ show c 
            hanoiM' (n-1) b a c
            
main = do 
        print "Towner Hanoi"
        let l = hanoi 3 1 2 3
        print  l 
        let l2 = hanoi 4 1 2 3
        print  l2 
        hanoiM 3
        fl
        hanoiM 4 
