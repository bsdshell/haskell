--Typeclass in Haskell
--Shape is similar to interface in Java
--Circle and Rectangle are similar to class in Java
data Point = Point Float Float deriving(Show)
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

data NewShape = NewCircle Point Float | NewRectangle Point Point deriving (Show)


area::Shape->Float
area(Circle _ _ r) = pi*r^2
area(Rectangle topx topy bottomx bottomy) = abs(bottomy - topy)*abs(bottomx - topx)

newarea::NewShape->Float
newarea(NewCircle _ r) = pi*r^2 
newarea(NewRectangle (Point topx topy) (Point bottomx bottomy)) = abs(bottomy - topy)*abs(bottomx - topx)

main = do 
        print("Typeclass in Haskell")
        print(area $ Circle 3 4 5)
        print(area $ Rectangle 3 4 5 8)
        print(newarea $ NewCircle (Point 1 4) 3)
        print(newarea $ NewRectangle (Point 1 4) (Point 2 7))
