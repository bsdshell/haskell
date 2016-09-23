import Data.Char 
import AronModule 

-- kth smallest element from an array

qsort::[Int]->Int->Int
qsort  _   0 = 0 
qsort [x]  1 = x 
qsort  x  k    | k > length x = 0 
qsort (x:xs) k | k < ln =  qsort left k 
               | k > ln =  qsort right (k - ln) 
               | otherwise = x
               where 
                   left  = [l | l <- xs, l < x]
                   right = [r | r <- xs, r > x]
                   ln    = (length left) + 1

-- kth smallest element from an array
qsort'::[Int]->Int->Maybe Int
qsort' [x]  1   = Just x 
qsort'  x   k   | k <= 0 || k > length x = Nothing 
qsort' (x:xs) k | k < ln =  qsort' left k 
                | k > ln =  qsort' right (k - ln) 
                | otherwise = Just x
               where 
                   left  = [l | l <- xs, l < x]
                   right = [r | r <- xs, r > x]
                   ln    = (length left) + 1

main = do 
        print "Hello World"
        let n = qsort [3, 1, 4, 5] 4 
        print $ "n=" ++ show(n)

        let n1 = qsort [3]  1
        print $ "n1=" ++ show(n1)

        let n2 = qsort [3, 1]  1
        print $ "n2=" ++ show(n2)

        let n3 = qsort [3, 1] 2 
        print $ "n3=" ++ show(n3)

        let n3 = qsort [3, 1] 3 
        print $ "n3=" ++ show(n3)

        let m = qsort' [3, 1] 3 
        print m 

        let m1 = qsort' [3, 1] 2 
        print m1


