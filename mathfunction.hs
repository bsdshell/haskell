--Factorial function
factorial::Int->Int
factorial 0 = 1
factorial n = n * factorial(n-1)

--Sum all the integer in a list
sumlist::[Int]->Int
sumlist [] = 0
sumlist (x:xs) = x+sumlist(xs) 

--Add two vectors
addvector::(Num a)=>(a, a)->(a, a)->(a, a)
addvector (a, b) (c, d) = (a + c, b + d)

main = do
        print (factorial(5))
        print (addvector (1,2) (2,3))
        print (sumlist [1, 2, 3])
