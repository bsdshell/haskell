import AronModule

data Person = Person{firstName::String, lastName::String, age::Integer} deriving(Show) 

instance Eq Person where
    Person fn1 ln1 a1 == Person fn2 ln2 a2 = fn1 == fn2 && ln1 == ln2 && a1 == a2 

personShow::Person -> String
personShow Person{firstName = firstName, lastName = lastName, age = age}
           = "[" ++ firstName ++ " " ++ lastName ++ " " ++ show(age) ++ "]"                 

gt::Person->Person->Bool
gt (Person fn1 ln1 a1) (Person fn2 ln2 a2) = fn1 > fn2 

lt::Person->Person->Bool
lt (Person fn1 ln1 a1) (Person fn2 ln2 a2) = fn1 < fn2 


quickSort1::(Ord a)=>[a]->[a]
quickSort1 [] = [] 
quickSort1 (x:xs)  = quickSort1 ([ l | l <- xs, l < x]) ++ [x] ++ quickSort1 ([ r | r <- xs, r >= x])

quickSort2::[Int]->[Int]
quickSort2 [] = []
quickSort2 (x:xs) = [l | l <- xs, l < x] ++ [x] ++ [ r | r <- xs, r >= x]


main = do
    let person1 = Person "Leslis" "Lamport" 40
    let person2 = Person "David" "Lamport" 30
    print $ firstName person1 
    print $ lastName person1 
    print $ age person1 
    fl
    print $ personShow person1 
    print $ person1 == person2
    print $ "dog" > "cat"
    print $ gt person1 person2 
    print $ lt person1 person2
    print $ person1 `lt` person2

    let ss2 = quickSort' []
    pp ss2
    let ss3 = quickSort' [1]
    pp ss3
    let ss4 = quickSort' [1, 2]
    pp ss4
    let ss5 = quickSort' [2, 1]
    pp ss5
    let ss6 = quickSort' [2, 1, 4, 1, 4, 1]
    pp ss6

    fl
    let qlist = quickSort1 [2, 3, 1, 0, 1, 4]
    ff "quickSort1" qlist 
    
