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

--myMax::[Int]->Int
--myMax [x] = x 
--myMax (x:xs) = if x > myMax(xs))  
--main = print (sumEveryTwo [1, 2, 3, 4]) 
--main = print (sumEveryTwo [1, 2, 3, 4]) 
--main = print (myMax[1, 2, 3, 4]) 

data Point a = Pt a a

--myFun::(Point Integer)=> Integer-> Integer 
--myFun Integer = Integer 


fun x | x < 0 =  "cat"
      | otherwise = "dog"


max x y | x < y = y
         | otherwise = x


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

