
f::[Int]->[Int]->[Int]
f [] l = [] 
f l [] = [] 
f (x:xs) l = map(+x) l ++ (f xs l)

f3::[Int]->[Int]->[[Int]]
f3 [] l = [] 
f3 l [] = [] 
f3 (x:xs) l = map (\a -> a*x:[]) l ++ (f3 xs l)

mulVect::[Int]->[Int]->[[Int]]
mulVect [] l = [] 
mulVect l [] = [] 
mulVect (x:xs) l = (map (\a -> x*a) l):(mulVect xs l)

transpose::[[Int]]->[[Int]]
transpose ([]:_) = [] 
transpose l = (map head l) : transpose (map tail l) 

mul::[[Int]]->[[Int]]->[[[Int]]]
mul ([]:_) _ = []
mul _ ([]:_) = []
mul _  []    = []
mul [] _     = []
mul (x:xs) (y:ys) =  (mulVect x y):(mul xs ys)
                where
                    mulVect::[Int]->[Int]->[[Int]]
                    mulVect [] l = [] 
                    mulVect l [] = [] 
                    mulVect (x:xs) l = (map (\a -> x*a) l):(mulVect xs l)

mulMat::[[Int]]->[[Int]]->[[[Int]]]
mulMat ([]:_) _ = []
mulMat _ ([]:_) = []
mulMat [] _ = []
mulMat _ [] = []
mulMat xs ys =  addMat (m !! 0)  (m !! 1) :[]
                where
                    m = mul xs (transpose ys)

addMat::[[Int]]->[[Int]]->[[Int]]
addMat ([]:_) _ = []
addMat _ ([]:_) = []
addMat [] _ = []
addMat _ [] = []
addMat (x:xs) (y:ys) = (zipWith(\x1 y1 ->x1+y1) x y) : (addMat xs ys)

v1 = [1..2]
v2 = [2..3]

m1 = [[1, 2], 
      [3, 4]
     ]

m2 = [[5, 7], 
      [8, 9]
     ]

m3 = [[1, 2, 3],
      [0, (-2), 1],
      [1, 1, 0]
      ]

multiMat::[[Int]]->[[Int]]->[[Int]]
multiMat a b = [ [sum $ zipWith (*) ar bc | bc <- (transpose b)]  | ar <- a]

--toMatID::[[Int]]->[[Int]]

mmult::[[Int]] -> [[Int]] -> [[Int]] 
mmult a b = [ [ sum $ zipWith (*) ar bc | bc <- (transpose b) ] | ar <- a ]
 
main = do
    print "Hello World"
    mapM_ print m3
    print "-------------"
    mapM_ print $ mmult m3 m3
    print "-------------"
    mapM_ print $ mmult (mmult m3 m3) m3
    print "-------------"
    mapM_ print $ addMat m3 m3
