import System.IO
import System.Directory
import Data.List
import Text.Regex.Posix
import Text.Regex
import System.Random

True ? x = const x
False ? _ = id

f::Int->Int
f x = x + 1

f1::Int->Int
f1 x  | x < 10 = 0
      | otherwise = 1
    
data Point a = Pt a a
norm::(Point Int)->(Point Int)->Int
norm(Pt a1 b1) (Pt a2 b2)  = a1*a2 + b1*b2 

dist::(Point Int)->(Point Int)->Int
dist (Pt a1 b1) (Pt a2 b2) = norm (Pt a1 b1) (Pt a2 b2) 

data Tree a = Empty 
            | Node a (Tree a) (Tree a) deriving (Show)

myTree = Empty 
myTree1 = Node('R') (Node 'L' Empty Empty) (Node 'R' Empty Empty)

inorder::Tree a->[a]
inorder Empty = []
inorder (Node a l r) = (inorder l) ++ [a] ++ (inorder r) 



-- ['a', 'b', 'c', 'd']
subList::[Char]->Int->Int->[Char]
subList [] _ _ = [] 
subList _  m n | m >= n = []
subList (x:xs) m n 
                 | m > 0 = subList xs (m-1) (n-1) 
                 | m == 0 = take (n) (x:xs) 

myTry::[Int]->[Int]
myTry [] = []
myTry (x:xs) = h:[1..10]
                where
                    h = head xs
                    h1 = tail xs 
                    h2 = h:h1 
           


buildTree::[Char]->[Char]->Tree Char 
buildTree _ [] = Empty
buildTree [] _ = Empty
buildTree preorder inorder = Node h  (buildTree leftPre leftIn) (buildTree rightPre  rightIn) 
                            where
                                h = head preorder
                                leftIn  = filter(\x->x < h) inorder
                                rightIn = filter(\x->x > h) inorder
                                leftPre = take (length rightIn) $ tail preorder 
                                rightPre = subList preorder (length leftIn) $ length preorder

--buildTree preorder inorder = Node (head preorder) buildTree( 
        
        

--class (Monoid a, Monoid b) => Monoid (a, b) where
--    mempty = (mempty, mempty)
--    (a1, b1) `mappend` (a2, b2) = (a1 `mappend` a2, b1 `mappend` b2)

main = do
    print $ f 3
    print $ f1 4
    print $ ( True ? 1 $ 2) 
    print $ norm(Pt 1 2) (Pt 3 4)
    print $ subList ['a'..'e'] 2 1
    print $ subList ['a'..'e'] 1 1 
    print $ subList ['a'..'e'] 0 1  
    print $ subList ['a', 'b', 'c'] 0 3   
    print $ myTry [1..10] 
    print $ inorder $ buildTree ['b', 'a', 'c'] ['a', 'b', 'c']
