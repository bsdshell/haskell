import AronModule

-- cat maybe list
quickSort1::(Ord a)=>[a]->[a]
quickSort1 [] = [] 
quickSort1 (x:xs) = quickSort1 ([ l | l <- xs, l < x ]) ++ [x] ++ quickSort1 ([ r | r <- xs, r > x])

f x = a*x^2 + b*x + c
    where 
        a = 1
        b = 2
        c = 3

main =  do 
        pp "dog"
        let m   = catMaybe (Just [1]) (Just [3])
        let mm  = catMaybe Nothing Nothing
        let mm2 = catMaybe (Just [1..10]) Nothing
        pp mm
        pp mm2
        let mm3 = catMaybe (Just []) Nothing
        pp mm3

        let mm4 = catMaybe (Just []) (Just [])
        pp mm4
        fl

        let list = [2, 4, 3]
        let ql = quickSort1 list 
        pp ql

        let q2 = quickSort1 ([]::[Int]) 
        pp q2

        let q2 = quickSort1 ([]::[Int]) 
        pp q2

        let q3 = quickSort1 ([]::[Int]) 
        pp q3
        
        let q4 = quickSort1 ["Lamport", "Leslie", "essential", "essentiality", "essentially", "b", "c"]
        pp q4
        let q5 = quickSort3 ["b", "a", "e", "c"]
        pp q5
        pp $ f 3

        let q6 = quickSort [2, 1, 0, 1, 3, 9]
        pp q6

        fl

