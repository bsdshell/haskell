--let binding in Haskell
-- ax^2 + bx + c = 0
-- Find the root of the quadratic equation
--

roots a b c =
        let discriminant= sqrt(b^2 - 4*a*c)
        in ( (-b + discriminant)/(2*a), (-b - discriminant)/(2*a))

main =  do 
        print (roots 3 9 1) 
