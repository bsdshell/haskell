import Data.Char 
import AronModule 

repeat'::Int->a->[a]
repeat' n a = map(const a)[1..n] 


main = do 
        print "Hello World"
        print $ repeat' 3 "a"
