--[file=ifthen.html title=""
--if else in Haskell
mySign x = 
        if x < 0
            then -1
        else if x > 0
            then 1
        else 0

main =  do 
        print (mySign(3)) 
--]
