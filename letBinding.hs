--[file=letwhere.html title=""
-- where cause and let binding in Haskell
--
-- let binding in Haskell
-- ax^2 + bx + c = 0
-- Find the root of the quadratic equation

roots a b c =
        let discriminant= sqrt(b^2 - 4*a*c)
        in ( (-b + discriminant)/(2*a), (-b - discriminant)/(2*a))

longest []     = []
longest (x:xs) = if length x > length (longest xs) then x else (longest xs)

newlongest []     = []
newlongest (x:xs) = if length x > length max then x else max 
    where max = newlongest xs

main =  do 
        print (roots 3 9 1) 
        print (longest [[],[1],[1,2]]) 
        print (newlongest [[],[1],[1,2]]) 
--]
