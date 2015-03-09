import System.Random

drawInt::Int->Int->IO Int
drawInt x y = getStdRandom(randomR(x, y))
main = do
        a <- drawInt 1 99
        print a
        let li = x <-drawInt 1 99
