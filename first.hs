import System.Random
import Data.Ix

--union two sorted disjoin lists 
union::Ord a => ([a], [a])->[a]
union (xs, []) = xs
union ([], ys) = ys 
union (x:xs, y:ys) | x < y = x:union(xs, y:ys)
                   | otherwise = y:union(x:xs, ys)

fac::Int->Int
fac 0 = 1
fac n = n * fac(n-1)

mysum::Int->Int
mysum 0 = 0
mysum n = n + mysum(n-1)

f 0 = "cat"
f 1 = "dog"
f 2 = "cow"

add n = n + 1
mul a b = a  * b 

sumlist::[Int]->Int
sumlist [] = 0
sumlist (x:xs) = x+sumlist(xs) 

productlist::[Integer]->Integer
productlist [] = 1 
productlist (x:xs) = x*productlist(xs) 

rev::[a]->[a]
rev [] = [] 
rev list = last(list):rev(init(list))

sumEveryTwo::[Integer]->[Integer]
sumEveryTwo [] = []
sumEveryTwo (x:[]) = [x]
sumEveryTwo (x:y:xs) = (x+y):sumEveryTwo(xs)

addVector::(Num a)=>(a, a)->(a, a)->(a, a)
addVector (a, b) (c, d) = (a + c, b + d)
--addVector a b = (fst a + fst b, snd a + snd b)

addVector2::(Int, Int)->(Int, Int)
addVector2 (a, b) = (a+b, a-b)

addVector3::(Num a)=>(a, a)->(a, a)->(a, a)
addVector3 (a, b) (c, d) = (a+c, d+b)

vectorNorm::(Num a)=>(a, a)->(a, a)->(a)
vectorNorm (a, b) (c, d) = a*c + b*d


--quick sort
quickSort::[Int]->[Int]
quickSort   [] = []
quickSort (x:xs) = quickSort ([y | y <- xs, y <= x]) ++ [x] ++ quickSort([z|z <- xs, z > x]) 


--merge sort
mergeSort::(Ord a)=>[a]->[a]
mergeSort xs     | (length xs) <= 1 = xs 
                 | otherwise = union(mergeSort(take (div (length xs) 2) xs), mergeSort(drop (div (length xs) 2) xs))

myHead::[a]->a
myHead (x:xs) = x

myTail::[a]->a
myTail (x:[]) = x 
myTail (x:xs) = myTail(xs) 

myMap::(a->b)->[a]->[b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs

myAdd::Integer->Integer->Integer
myAdd a b = a + b

myQuickSort::[Float]->[Float]
myQuickSort [] = []
myQuickSort (x:xs) = myQuickSort[y | y <- xs, y < x] ++ [x] ++ myQuickSort[y | y<-xs, y>=x] 

myTake::Integer->[Integer]->[Integer]
myTake 0 _ = []
myTake _ [] = []
myTake n (x:xs) = x:myTake (n-1) xs

myIndex::Integer->[Integer]->Integer
myIndex _ [] = 9 
myIndex 0 (x:xs) = x
myIndex n (x:xs) = myIndex (n-1) xs

--Return a minimum integer from a list
minlist::[Integer] ->Integer
minlist [] = error "list is empty" 
minlist [x] = x 
minlist (x:xs) = min x (minlist xs) 


--deleteIndex::Integer->[Integer]->[Integer]
--deleteIndex inx xs      | fromIntegral inx >= length xs = error "inx >= length xs" 
--deleteIndex inx (x:xs)  | = deleteIndex inx xs 

--Remove all the occurrence of Char from an list Char
removeAllChar::Eq a => a->[a]->[a]
removeAllChar a xs = [ x | x <- xs, a /= x]

--Simple sorting algorithm
--removeFst remove the first occurrence of an integer m from an list integers  
removeFst::Integer->[Integer]->[Integer]
removeFst y [] = []
removeFst y (x:xs) | y == x    = xs
                   | otherwise = x:removeFst y xs

--Sort list
mySort::[Integer]->[Integer]
mySort [] = []
mySort xs  = x:mySort(removeFst x xs) where x = minlist xs

myprint::String->IO()
myprint x = putStrLn ("print[" ++ x ++ "]")

myputStr ::String->IO()
myputStr [] = return ()
myputStr (x:xs) = do putChar x
                     myputStr xs


substrings::[Char]->[[Char]]
substrings []     = []
substrings (x:xs) = substrings' (x:xs) ++ substrings xs where
  substrings' []     = []
  substrings' (y:ys) = [y] : [ (y:s) | s <- substrings' ys ]

longest []     = []
longest (x:xs) = if length x > length (longest xs) then x else (longest xs)

newlongest []     = []
newlongest (x:xs) = if length x > length max then x else max 
    where max = newlongest xs


myp [] = []
myp (x:xs) = xs 

--substring::[Char]->[[Char]]
--substring [] = []
--substring (x:xs) = [x]:[ (x:s) | s <- substring xs] 


data Person = Person String Integer String deriving Show
        
getAge::Person->Integer
getAge(Person _ n _) = n

getName::Person->String
getName(Person name _ _) = name

getInfo::Person->String
getInfo p@(Person _ _ _) = "(" ++ show(p) ++ ")"


clamp1::Floating a=>a->a->a->a
clamp1 lo hi val = (lo-val)/(hi-val)

clamp::Floating a=>a->a->[a]->[a]
clamp lo hi = map(clamp1 lo hi)

--myMax::[Int]->Int
--myMax [x] = x 
--myMax (x:xs) = if x > myMax(xs))  


--myFun::(Point Integer)=> Integer-> Integer 
--myFun Integer = Integer 


fun x | x < 0 =  "cat"
      | otherwise = "dog"


max x y | x < y = y
        | otherwise = x

divids d n = rem n d == 0

ldf k n | divids k n = k
        | k^2 > n = n
        | otherwise = ldf (k+1) n

prime n = ldf 2 n == n


data Foo = Bar | Baz Int
myfun::Foo->Int
myfun   Bar = 1
myfun   (Baz x) = x - 1

myconcat::[[a]]->[a]
myconcat [] = []
myconcat (x:xs) = x ++ myconcat(xs)

findAfterStar::String->Maybe Char
findAfterStar (a:b:r) =
    if a == '*' then Just b 
              else findAfterStar (b:r)
findAfterStar _ = Nothing

--Define a tree
data Tree a = Empty 
            | Node a (Tree a) (Tree a) deriving Show

--Create a tree
mytree = Node 'R' 
            (Node 'S' 
                (Node 'T' Empty Empty)
                (Node 'U' Empty Empty)
            ) 
            (Node 'T' 
                (Node 'V' Empty Empty)
                (Node 'W' Empty Empty)
            ) 

--Create a tree
mytreeNum = Node 1 
            (Node 2 
                (Node 3 Empty Empty)
                (Node 4 Empty Empty)
            ) 
            (Node 5 
                (Node 6 Empty Empty)
                (Node 7 Empty Empty)
            ) 


preorderTraversal::Tree a ->[a]
preorderTraversal Empty = [] 
preorderTraversal (Node a l r) = a:(preorderTraversal l) ++ (preorderTraversal r)
 
inorderTraversal::Tree a ->[a]
inorderTraversal Empty = [] 
inorderTraversal (Node a l r) = (inorderTraversal l) ++[a]++(inorderTraversal r)
 
postorderTraversal::Tree a ->[a]
postorderTraversal Empty = [] 
postorderTraversal(Node a l r) = (postorderTraversal l) ++ (postorderTraversal r) ++ [a]
 
--[file=composite.html title=""
-- function composition foldable
f1::Int->Int
f1 a = a * 10 

f2::Int->Int
f2 a = a - 10 
compose = (f1.f2) 10 
--] 

--[file=foldable.html   title="" 
-- identity = [] 
concat2::[[Int]]->[Int]
concat2 vals = foldr (\val acc->val ++ acc) [] vals

-- identity = 0
sum1::[Int]->Int
sum1 vals = foldl (\x y-> x + y) 0 vals 

-- identity = 1 
product1::[Int]->Int
product1 vals = foldl (\x y-> x * y) 1 vals 

-- identity = [] 
concat1::[[Char]]->String
concat1 vals = foldl (\x y->concat[x, y]) [] vals 
--]

-- simple sorted algorithm 
mysort::[Int]->[Int]
mysort [] = []
mysort [x] = [x]
mysort (x:xs) | x <= head (mysort xs) = x:mysort xs   
              | otherwise = mysort(xs ++ [x])
-- average of a list
myAverage::[Int]->Float
myAverage [] = 0 
myAverage xs = fromIntegral(sum xs)/fromIntegral(length xs) 

prefix::String->String->Bool
prefix [] ys = True
prefix xs [] = False
prefix (x:xs) (y:ys) = x == y && prefix xs ys

--[file=instance.html title=""
--class  Eq a  where
   --(==), (/=) :: a -> a -> Bool
   --x /= y     =  not (x == y)
   --x == y     =  not (x /= y)

-- instance class
data Myfoo = Myfoo{int::Integer, str::String}
instance Eq Myfoo where 
    (Myfoo int1 str1) == (Myfoo int2 str2) = (int1 == int2) && str1 == str2
--]


-- functionn in Haskell 
--{In GHCi, we have to use let to define a function
-- let myfun x = x + 1
-- But in *.hs file, we define function as following
--myfun x = x + 1
--}

myfun1 x = x + 1

values::[[Int]]
values = [[1, 2], [3, 4]]

mymax::Int->Int->Int
mymax a b = if a > b then a else b 
ff1 = mymax 1
ff2 = ff1 4

fInt::Integer->()
fInt x = ()

--[file=functor.html   title="" 
data MyMaybe a = MyJust a | MyNothing deriving (Show)
 
instance Functor MyMaybe where
    fmap f MyNothing = MyNothing
    fmap f (MyJust a) = MyJust (f a)
--] 


main =  do 
        print (getName(Person "person's name" 3 "dog"))
        print (getInfo(Person "person's name" 3 "dog"))

        print(preorderTraversal mytree)
        print(inorderTraversal mytree)
        print(postorderTraversal mytree)
        print(removeFst 3 [1, 2, 3])
        print(removeFst 3 [3])
        print(removeFst 3 [])
        print(removeFst 3 [1, 2])
        print(mySort [])
        print(mySort [3])
        print(mySort [3, 1, 2])
        print(clamp 2 9 [1, 3, 4])
        print(removeAllChar 'a' ['b', 'a', 'e', 'a'])
        print(removeAllChar 'a' [])
        print(findAfterStar "*b*")
        g <- getStdGen
        --print $ take 10 (randomRs('a', 'z') g)

        num <- randomIO::IO Int 
        print $ num
        print (([x| x <- [1..10], mod x 2 == 0], [y| y <- [4..15], mod y 2 == 1]))
        print (union([x| x <- [1..10], mod x 2 == 0], [y| y <- [4..15], mod y 2 == 1]))
        print (mergeSort [2, 1, 4])
        print (fac 3)
        print (rev [1, 2]) 
        print ((f1 . f2) 1) 
        print (values) 
        print (sum1 [1, 2, 3])
        print (product1 [1, 2, 3])
        print (concat1 ["a", "b", "c"])
        print (foldr (+) 0 (preorderTraversal mytreeNum)) 
        print (mysort [2, 1, 3, 0, 9, 20, 3, 1, 4]) 
        print (myAverage [1, 2])
        print (Myfoo 3 "dog" == Myfoo 3 "dog")
        print (Myfoo 3 "cat" == Myfoo 3 "dog")
        print ff2 
        print compose 
        print (concat2 values) 
        print (fInt 3)
        myprint "dog"

