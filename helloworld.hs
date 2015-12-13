removeFst::[Int]->[Int]
removeFst [] = [] 
removeFst [x] = []
removeFst (x:xs) = xs

main = do
       print("Hello World")
       print(removeFst [1, 3, 4])
       
