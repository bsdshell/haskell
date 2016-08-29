--[file=typeclass3.html title=""
-- Library/WebServer/Documents/zsurface/github/haskell/typeclass3.hs
-- Typeclass in Haskell
-- Shape is similar to interface in Java
-- Circle and Rectangle are similar to class in Java

data Point = Point Float Float deriving(Show)
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

--call constructor
circleShape::Shape
circleShape = Circle 1 2 3
rectangleShape = Rectangle 1 2 3 4 

--list of typeclasses
listShape::[Shape]
listShape = [Circle 1 2 3, Rectangle 1 2 3 4]

main = do 
        print(circleShape)
        print(rectangleShape)
        print(listShape)
--]
