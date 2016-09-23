
qsort::[Int]->[Int]
qsort [] = []
qsort (x:xs) = qsort [ l | l <- xs, l < x] ++ [x] ++ qsort [ r | r <- xs, r >= x]

main = do
        print "dog"
        print $ qsort [3, 4, 3, 1, 0]
