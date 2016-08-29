--[file=suminteger.html title=""
-- Sum all the integer in a list
sumlist::[Int]->Int
sumlist [] = 0
sumlist (x:xs) = x+sumlist(xs) 
--]
