rev::[Char]->[Char]
rev [] = [] 
rev list = last(list):rev(init(list))

main = print (rev "The cat is black") 
