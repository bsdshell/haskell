--[file = fold.html title="foldr and foldl"
-- folding examples
main = do 
        print(foldr (-) 1 [2, 3, 4]) -- output 2
        print(foldl (-) 1 [2, 3, 4]) -- output -8 

        let fr = foldr (\x y->concat["(",x,"-",y,")"]) "1" (map show [2, 3, 4]) 
        print(fr)
        --output "(2-(3-(4-1)))"

        let fl = foldl (\x y->concat["(",x,"-",y,")"]) "1" (map show [2, 3, 4])
        print(fl)
        --output "(((1-2)-3)-4)"
--]
