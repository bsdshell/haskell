isPalindrome:: Eq a=>[a]->Bool
isPalindrome [a] = True
isPalindrome [x,y] = x == y
isPalindrome (x:xs) = x == (last xs) && isPalindrome(init(xs))

main = do
        print ("aba="++ show(isPalindrome("aaa")))
