--Check whether an integer is a prime or not
--Least Divisor 
leastDivisor::Integer->Integer->Integer
leastDivisor x y | mod y x == 0 = x 
                 | x^2 > y = y
                 | otherwise = leastDivisor (x+1) y  

--Check prime number
isPrime::Integer->Bool
isPrime y = leastDivisor 2 y == y

main = do 
        print(isPrime 101)
