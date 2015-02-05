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

rev::[Char]->[Char]
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


deleteIndex::Integer->[Integer]->[Integer]
deleteIndex inx xs      | fromIntegral inx >= length xs = error "inx >= length xs" 
deleteIndex inx (x:xs)  |         fromIntegral inx == 0 = xs 
--deleteIndex inx (x:xs)  | otherwise                     = x:(deleteIndex (fromIntegral inx)-1 xs)

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

myputStr ::String->IO()
myputStr [] = return ()
myputStr (x:xs) = do putChar x
                     myputStr xs

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

nat = 0:map(+1) nat
natpairs = [(x, z-x) | z <-[0..y], x <-[0..z], z < 10 && y < 10]

y = 
    let (x:_) = map (*2)[1, 2, 3]
    in x + 5

z = x + 5
    where (x:_) = map(*100)[1, 2, 3]

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

--myFun::(Int->Int)->Int
--myFun f x = (+) 2 x 

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

preorderTraversal::Tree a ->[a]
preorderTraversal Empty = [] 
preorderTraversal (Node a l r) = a:(preorderTraversal l) ++ (preorderTraversal r)
 
inorderTraversal::Tree a ->[a]
inorderTraversal Empty = [] 
inorderTraversal (Node a l r) = (inorderTraversal l) ++[a]++(inorderTraversal r)
 
postorderTraversal::Tree a ->[a]
postorderTraversal Empty = [] 
postorderTraversal(Node a l r) = (postorderTraversal l) ++ (postorderTraversal r) ++ [a]
 
main =  do 
        print (addVector (1, 2) (3, 4)) 
        print (sumEveryTwo [1, 2, 3, 4]) 
        print (fun 4) 
        print (Main.max 1 2) 
        print (addVector2(1, 2)) 
        print (vectorNorm (1, 2)(4, 5))
        print (myHead [1, 2, 3])
        print (myQuickSort[1, 3, 2])
        print (myMap (myAdd 1) [1, 3, 2])
        print (divids 3 10)
        print (ldf 2 100)
        print (prime 999999999999331111111199911)
        print (myfun (Baz 3))
        print (y)
        print (z)
        myputStr "dog"
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
        print(natpairs)
        print(removeAllChar 'a' ['b', 'a', 'e', 'a'])
        print(removeAllChar 'a' [])
        print(findAfterStar "*b*")
        g <- getStdGen
        --print $ take 10 (randomRs('a', 'z') g)

        num <- randomIO::IO Int 
        print $ num
        print y
        print (([x| x <- [1..10], mod x 2 == 0], [y| y <- [4..15], mod y 2 == 1]))
        print (union([x| x <- [1..10], mod x 2 == 0], [y| y <- [4..15], mod y 2 == 1]))
        print (mergeSort [2, 1, 4])
        

