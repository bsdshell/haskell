--[file = fold.html title="foldr and foldl"
-- folding examples
main = do 
        print(foldr (-) 1 [2, 3, 4]) -- output 2
        print(foldl (-) 1 [2, 3, 4]) -- output -8 

        let fr = foldr (\x y->concat["(",x,"+",y,")"]) "0" (map show [1..4]) 
        print(fr)
        --output "(1+(2+(3+(4+0))))"

        let fl = foldl (\x y->concat["(",x,"+",y,")"]) "0" (map show [1..4])
        print(fl)
        --output "((((0+1)+2)+3)+4)"
--]
