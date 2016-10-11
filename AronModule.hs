module AronModule where
import Text.Regex.Posix
import Text.Regex


cat::[String]->String
cat  [] = [] 
cat (x:xs) = x ++ cat xs

-- check if string is empty
isEmpty::String->Bool
isEmpty "" = True 
isEmpty _  = False 

trimWS::String->String
trimWS ""  = ""
trimWS str = filter(/= ' ') str

splitList::[String]->([String], [String])
splitList [] = ([], [])
splitList [x] = ([x], [])
splitList (x:y:xs) = (x:xp, y:yp) where (xp, yp) = splitList xs


-- length of two lists has to be same 
-- [["a"], ["b"]] [["1"], ["2"]] -> [["a", "1"], ["b", "2"], []]
mergeListList::[[String]]->[[String]]->[[String]]
mergeListList [[]] [[y]] = [["", y]] 
mergeListList [[x]] [[]] = [[x, ""]] 
mergeListList [[]] (y:ys) = ([]:y):ys 
mergeListList (x:xs) [[]] = ([]:x):xs
mergeListList (x:xs) (y:ys) = (zipWith(\ex ey -> [ex, ey]) x y) ++ (mergeListList xs ys) 


mergeList::[String]->[String]->[String]
mergeList [] [] = []
mergeList  l  [] = l 
mergeList []  r = r 
mergeList (x:xs) (y:ys) = x:y:mergeList xs ys 

mergeList2::[a]->[a]->Maybe [a]
mergeList2 [] [] = Just [] 
mergeList2 (x:xs) (y:ys) = 
            case mergeList2 xs ys of
            Just merged -> Just (x:y:merged)
            Nothing  -> Nothing
mergeList2 _ _  = Nothing


unwrap::Maybe a -> a
unwrap Nothing = error "this is nothing from unwrap" 
unwrap (Just x) = x

codeCapture::String->String
codeCapture str = subRegex(mkRegex pat) str rep 
                    where rep = "<cool>\\1</cool>" 
                          pat = "(([^`]|`[^[]]*|\n*)*)"

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


prime = sieve [2..]
    where sieve (p:xs) = p:sieve[ x | x <- xs, x `mod` p /= 0]


readFileToList::FilePath->IO [String] 
readFileToList f = readFile f >>= \contents -> return (lines contents) 

writeToFile::FilePath->[String]->IO()
writeToFile f list = writeFile f $ unlines list 


fl::IO()
fl = print $ foldr (++) "" $ replicate 80 "-" 

ff::(Show var)=>String->var->IO()
ff msg var = putStr (left ++ msg ++ right ++ "\n" ++ show(var) ++ "\n")
                where
                    line = foldr(++) "" $ replicate 80 "-"
                    diff   = 80 - (length msg)
                    half   = div diff 2
                    isEven = mod diff 2
                    left   = foldr(++) "" $ replicate (half + isEven)  "-"
                    right  = foldr(++) "" $ replicate half  "-"

