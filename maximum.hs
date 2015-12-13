--[file = maximum.html title ="find the maximum of a list"
--find the maximum of a list
maximum1'::(Ord a) =>[a]->a
maximum1' []  = error "empty list" 
maximum1' [x] = x
maximum1' (x:xs) 
        | x > maxTail = x 
        | otherwise = maxTail
        where maxTail = maximum1' xs
--find the maximum of a list without where
maximum2'::(Ord a) =>[a]->a
maximum2' [] = error "empty list"
maximum2' [x] = x
maximum2' (x:xs) = max x (maximum2' xs) 
--]

main = do 
        print("Find the maximum of a list")
        let list1 = [1, 4, 3]
        let list2 = [1, 3, 7, 9, 0]
        print list1
        print(maximum1' list1)
        print list2
        print(maximum2' list2)
