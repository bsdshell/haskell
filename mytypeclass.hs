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


--call constructor
circleShape::Shape
circleShape = Circle 1 2 3
rectangleShape = Rectangle 1 2 3 4 

--list of typeclasses
listShape::[Shape]
listShape = [Circle 1 2 3, Rectangle 1 2 3 4]

main = do 
        print("Typeclass in Haskell")
        print(area $ Circle 3 4 5)
        print(area $ Rectangle 3 4 5 8)
        print(newarea $ NewCircle (Point 1 4) 3)
        print(newarea $ NewRectangle (Point 1 4) (Point 2 7))
        print(circleShape)
        print(rectangleShape)
        print(listShape)
