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
addVector a b = (fst a + fst b, snd a + snd b)

--myMax::[Int]->Int
--myMax [x] = x 
--myMax (x:xs) = if x > myMax(xs))  
--main = print (sumEveryTwo [1, 2, 3, 4]) 
--main = print (sumEveryTwo [1, 2, 3, 4]) 
--main = print (myMax[1, 2, 3, 4]) 

main =  do 
        print (addVector (1, 2) (3, 4)) 
        print (sumEveryTwo [1, 2, 3, 4]) 
