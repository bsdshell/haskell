--Factorial function
fac::Int->Int
fac 0 = 1
fac n = n * fac(n-1)

--Sum all the integer in a list
sumlist::[Int]->Int
sumlist [] = 0
sumlist (x:xs) = x+sumlist(xs) 

--Add two vectors
addVector::(Num a)=>(a, a)->(a, a)->(a, a)
addVector (a, b) (c, d) = (a + c, b + d)
