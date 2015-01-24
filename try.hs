doubleMe x = x*x

coolCode x = if x > 20 then x*100 else x*1000

mylength ::[a]->Integer
mylength []       = 0
mylength (x:xs)   = 1 + mylength(xs)
