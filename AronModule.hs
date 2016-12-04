module AronModule where
import Text.Regex.Posix
import Text.Regex
import System.Process
import System.Environment
import qualified Data.Text as Text

-------------------------------------------------------------------------------- 
-- load shell environments inside GHC
-- use the SAME NAME as in shell environments
-------------------------------------------------------------------------------- 


cat::[String]->String
cat  [] = [] 
cat (x:xs) = x ++ cat xs


-- cat maybe list
catMaybe::Maybe [Int]-> Maybe [Int] -> Maybe [Int]
catMaybe Nothing Nothing           = Nothing
catMaybe Nothing (Just list)       = Just list
catMaybe (Just list) Nothing       = Just list
catMaybe (Just list1) (Just list2) = Just (list1 ++ list2)

-- check if string is empty
isEmpty::String->Bool
isEmpty "" = True 
isEmpty _  = False 

trimWS::String->String
trimWS ""  = ""
trimWS str = filter(/= ' ') str

trim::String->String
trim s  = Text.unpack $ Text.strip $ Text.pack s

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
quickSort l = quickSort(left) ++ [p] ++ quickSort right 
                    where
                        left =  [x | x <- init l, x < p]
                        right = [x | x <- init l, x >= p]
                        p = last l 

quickSort'::[Int]->[Int]
quickSort' [] = []
quickSort' (x:xs) = quickSort' ([ l | l <- xs, l < x]) ++ [x] ++ quickSort' ([ r | r <- xs, r >= x]) 

-- note: quickSort1 [] -- get error
-- print quickSort1 ([]::Int)  -- it works
quickSort1::(Ord a)=>[a]->[a]
quickSort1 [] = [] 
quickSort1 (x:xs) = quickSort1 ([ l | l <- xs, l < x ]) ++ [x] ++ quickSort1 ([ r | r <- xs, r >= x])

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


pp::(Show var)=>var->IO()
pp var = print var 

ls::IO()
ls = createProcess(proc "ls"  [] ) >> return () 

pwd::IO()
pwd = createProcess(proc "pwd"  [] ) >> return ()

cd::String->IO()
cd p = createProcess(proc "cd"  [p] ) >> return ()

en::String->IO String
en s = getEnv s 

cc::String->IO ()
cc cmd = callCommand cmd

run::String->IO () 
run s = createProcess(proc s  [] ) >> return () 

g::IO()
g = getEnv "g" >>= \x -> print x >> return ()


