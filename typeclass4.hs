--[file=typeclass4.html title=""
--Library/WebServer/Documents/zsurface/github/haskell/typeclass4.hs
--Deconstructing type in Haskell

data Point = Point Float Float deriving(Show)
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)


showShape::Shape->String
showShape(Circle x y radial) = show(x) ++ "  "++show(y)++ "  " ++ show(radial) 
showShape(Rectangle x1 y1 x2 y2 ) = show(x1) ++ "  "++show(y1)++ "  " ++ show(x2)++" "++show(y2) 

main = do 
        print(showShape(Circle 3 4 5))
        print(showShape(Rectangle 1 2 3 4))
--]
