import qualified Data.Set as Set

--set = Set.fromList "erik salaj"
set = Set.fromList ["dog", "cat", "dog"] 

repeat'::Int -> IO() -> IO()
repeat' 0  a = return () 
repeat' n  a = a >> repeat'(n-1) a

-- create for loop
for::[a]->(a->IO())->IO()
for []  f = return () 
for (x:xs) f = f x >> for xs f

getTwoChars::IO (Char, Char) 
getTwoChars   = getChar >>= \c1-> 
                getChar >>= \c2 -> 
                return (c1, c2) 

getTwoCharsDo::IO(Char, Char)
getTwoCharsDo = do {
                    c1 <- getChar;
                    c2 <- getChar;
                    return (c1, c2) }

getMyLine::IO [Char]
getMyLine = do {
                x <- getChar;
                if x == '\n' then
                    return []
                else do{
                    xs <- getMyLine;
                    return (x:xs)
                }
            }

--prefix::[Int]->Int->[Int]
--prefix [] _ = [] 
--prefix l 0 = [] 
--prefix x n | n > 0 = take n x : prefix x n-1  
--
--
-- [1]
-- [1, 2, 3] = [1], [1, 2], [1, 2, 3]


qsort::[Int]->[Int]
qsort [] = []
qsort (x:xs) = qsort(left) ++ [x] ++ qsort(right)
                where (left, right) = (filter(<=x) xs, filter(>x) xs) 

main = do
--    print set
--    print $ Set.null set
--    print $ Set.size set
--    print $ Set.insert "y" set
--    print $ Set.member "a" set
--    print $ Set.member "k" set
--    repeat' 80 $ putChar 'X' 
--    for [1..10] (\x -> putStr(show x ++ " ")) 
--    for [1..10] (\x -> print ("x=" ++ show x)) 
--    tub <- getTwoCharsDo
--    putStr $ (show $ fst tub) ++ (show $ snd tub)
--    line <- getMyLine
--    print line
--    (putStr "cow" >> putStr "dog")  >> putStr "cat"
--    putStr "cow" >> (putStr "dog"  >> putStr "cat")
--    n1 <- print "dog"
--    n2 <- print "cat" 
--    n3 <- print "cow"
--    d <- print "dog" >>= \x -> print x >>= \x -> return x 
--    print d
    let t = take 1 ll
            where ll = [1..10]
    print t
    print $ qsort [2, 1, 4, 0, 5]

