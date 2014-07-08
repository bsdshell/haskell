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

--myMax::[Int]->Int
--myMax [x] = x 
--myMax (x:xs) = if x > myMax(xs))  
--main = print (sumEveryTwo [1, 2, 3, 4]) 
--main = print (sumEveryTwo [1, 2, 3, 4]) 
--main = print (myMax[1, 2, 3, 4]) 

data Point a = Pt a a
--Pt 3 4 ::Point Integer 

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
