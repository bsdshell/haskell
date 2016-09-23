--[file=typeclass7.html title=""
data Point a = Pt a a deriving(Show)

dist::Point Int-> Point Int -> Int
dist (Pt x0 y0) (Pt x1 y1) = (x0-x1)*(x0-x1) + (y0-y1)*(y0-y1)

main = do
        print (Pt 1 3 :: Point Int) 
        print $ dist(Pt 1 4) (Pt 3 4) 
--]
