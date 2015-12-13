--[file=filetype1.html title = "file type"
-- City is similar to Enum in Java/C++
-- public enum City 
-- {
--  PaloAlto, 
--  MountainView 
--  Sunnyvale
-- }
-- City city = MountainView
--
data City = PaloAlto
            | MountainView
            | Sunnyvale
    deriving(Show)
            

city::City
city = MountainView

listofCity::[City]
listofCity = [PaloAlto, Sunnyvale, MountainView]

isGoodCity::City -> Bool
isGoodCity PaloAlto     = True
isGoodCity MountainView = True
isGoodCity Sunnyvale    = False

data MyType = Failture
            | OK (Double)
    deriving Show

fa = Failture
ok = OK 3.31

safeDiv::Double->Double->MyType
safeDiv _ 0 = Failture
safeDiv x y = OK(x/y)

f::String->MyType
f   ""    = Failture
f   "cat" = OK (100)
f   "dog" = OK (200)
f   _     = OK 3.3


main = do
        print (isGoodCity PaloAlto)
        print (isGoodCity Sunnyvale)
        print (fa, ok)
        print (f "")
        print (f "cat")
        print (f "dog")
        print (safeDiv 3 0)
        print (safeDiv 3 4)
--]
