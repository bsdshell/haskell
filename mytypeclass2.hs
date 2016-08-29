--[file=typeclass2.html title=""
--Typeclass 2 in Haskell
data Point = Point Float Float deriving(Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

area::Shape->Float
area(Circle _ r) = pi*r^2 
area(Rectangle (Point topx topy) (Point bottomx bottomy)) = abs(bottomy - topy)*abs(bottomx - topx)

main = do 
        print(area $ Circle (Point 1 4) 3)
        print(area $ Rectangle (Point 1 4) (Point 2 7))
--]
