data Tree a = Empty 
            | Node a (Tree a) (Tree a) deriving Show

freeTree::Tree Char
freeTree = 
        Node 'R' 
            (Node 'L' Empty Empty)  
            (Node 'R' Empty Empty)  

main = print freeTree 
