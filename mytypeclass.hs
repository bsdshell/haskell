--Typeclass in Haskell
--Shape is similar to interface in Java
--Circle and Rectangle are similar class in Java
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

area::Shape->Float
area(Circle _ _ r) = pi*r^2
area(Rectangle topx topy bottomx bottomy) = abs(bottomy - topy)*abs(bottomx - topx)

main = do 
        print("Typeclass in Haskell")
        print(area $ Circle 3 4 5)
        print(area $ Rectangle 3 4 5 8)
