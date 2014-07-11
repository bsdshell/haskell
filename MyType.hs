data MyType = Dog | Cat | Cow 

data Point = Point Double Double

xval :: Point->Double
xval (Point x y) = x

yval :: Point->Double
yval (Point x y) = y 

let a = Point 3.01 4.02
    xval(a)
