--[file=factorial.html title=""
--Factorial function
factorial::Int->Int
factorial 0 = 1
factorial n = n * factorial(n-1)
--]
