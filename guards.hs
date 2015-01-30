--Guards in Haskell
myGuards x 
        | x < 0 = -1
        | x > 0 = 1
        | otherwise = 0

main =  do 
        print (myGuards(3)) 
