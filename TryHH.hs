import Data.Char 
import AronModule 

ff::String->String->IO()
ff msg var = putStr (left ++ msg ++ right ++ "\n" ++ var ++ "\n")
                where
                    line = foldr(++) "" $ replicate 80 "-"
                    diff   = 80 - (length msg)
                    half   = div diff 2
                    isEven = mod diff 2
                    left   = foldr(++) "" $ replicate (half + isEven)  "-"
                    right  = foldr(++) "" $ replicate half  "-"
main = do 
        print "Hello World"
        ff "1234" "my variable"
        ff "123" "my variable"
        ff "" "my variable"
