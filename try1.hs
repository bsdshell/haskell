import Text.Regex
import Text.Regex.Posix
import Data.Bits
import System.FilePath.Posix
import System.Environment


prime = sieve [2..]
    where sieve (p:xs) = p:sieve[ x | x <- xs, x `mod` p /= 0]

--mergeSortList::[Int]->[Int]->[Int]
--mergeSortList [] r          = r
--mergeSortList l []          = l
--mergeSortList (x:xs) (y:ys) = if x < y then x:(mergeSortList xs (y:ys)) else y:(mergeSortList (x:xs) ys)


split::[Int]->([Int], [Int])
split [] = ([], []) 
split [x] = ([x], [])
split (x:y:rest) = (x:xs, y:xy)   
                where
                    (xs, xy) = split rest

quickSort::[Int]->[Int]
quickSort [] = []
quickSort [x] = [x]
quickSort l = quickSort(left) ++ p:[] ++ quickSort right 
                    where
                        left =  [x | x <- init l, x < p]
                        right = [x | x <- init l, x >= p]
                        p = last l 

mergeSort::[Int]->[Int]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort l = merge(mergeSort left) (mergeSort right) 
                where
                    half = (length l) `div` 2
                    left = take half l
                    right = drop half l  

                    merge::[Int]->[Int]->[Int]
                    merge [] r = r
                    merge l [] = l
                    merge (x:xs) (y:ys)  = if x < y
                                            then 
                                               x:merge xs (y:ys) 
                                            else
                                               y:merge (x:xs) ys 

let (xs, ys) = aplitAt 2 [1..10] in xs ++ [100] ++ ys



main = do
        print $ quickSort [2, 1]
