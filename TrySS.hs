import Data.Char 
import AronModule 

search x [] = False
search x (y:ys) = 
        if x == y 
            then True
            else search x ys 


main = do 
        print "Hello World"
        print $ search 3 [1, 3, 4]
        print $ search 0 [1, 3, 4]
