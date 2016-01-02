import Data.List(inits, tails)
mess::IO ()
mess = getLine >>= putStrLn 

mess2::IO ()
mess2 = putStrLn "Input Name" 
                    >> getLine 
                    >>= \x-> putStrLn (reverse x) 

data MyMaybe a = MyJust a | MyNothing deriving (Show)

instance Functor MyMaybe where
    fmap f MyNothing  = MyNothing
    fmap f (MyJust a) = MyJust (f a)

half x = if even x 
            then Just (x `div` 2)
            else Nothing 


checkSum::[Int]->Int->Bool
checkSum []  _ = True
checkSum [x] _ = x == 0
checkSum l inx | sum(take inx l) == sum(drop inx l) = True
               | inx <= length l = checkSum l (inx+1)
               | otherwise       = False

splits::[a]->[([a], [a])]
splits xs   = zip (inits xs) (tails xs) 

-- import Data.List(inits, tails)
checkSum2::[Int]->Bool
checkSum2 xs | len > 0 = True 
            | otherwise = False
            where
                len = length $ filter(\x-> sum (fst x) == sum (snd x)) $ splits xs
                splits::[a] -> [([a], [a])]
                splits xs = zip (inits xs) (tails xs) 

checkSum4::[Int] -> Bool
checkSum4 a = go a 0 (sum a)
   where go [] left right = left==right
         go (x:xs) left right | left==right = True
                              | otherwise = go xs (left+x) (right-x)


-- [ [1,2,3], [2, 3,4], [3, 4,5]]
-- [ [1, 2, 3], [2, 3, 4], [3, 4, 5]]
--
transpose::[[Int]]->[[Int]]
transpose ([]:_) = [] 
transpose l = (map head l) : transpose (map tail l) 


z = zipWith(\x y-> x*y) [1..2] [2..3] 
m1 = [[1..2], [4..5]]
m2 = [[2..3], [5..6]]
zz =  zipWith(\a b->( zipWith(\x y ->x*y) a b ))  (transpose m1) m2 

f::[Int]->[Int]->[Int]
f [] l = [] 
f l [] = [] 
f (x:xs) l = map(+x) l ++ (f xs l)

main = do
    let x = [1..10]
    print "dog"
    print $ checkSum [1,2, 3] 1
    print $ checkSum [0] 1
    print $ checkSum [2] 1
    print $ splits [1..2]
    print "=========================="
    print $ checkSum2 [1..2]
    print $ checkSum2 [1..3]
    print "=========================="
    print $ checkSum4 [1..2]
    print $ checkSum4 [1..3]
    print z
    print m1
    print m2
    print zz
    print $ f [1..2] [2..3]
