isPalindrome:: Eq a=>[a]->Bool
isPalindrome [a] = True
isPalindrome [x,y] = x == y
isPalindrome (x:xs) = x == (last xs) && isPalindrome(init(xs))

main = do
        print ("a="++ show(isPalindrome("a")))
        print ("aa="++ show(isPalindrome("aa")))
        print ("ab="++ show(isPalindrome("ab")))
        print ("aba="++ show(isPalindrome("aba")))
        print ("aba="++ show(isPalindrome("aaa")))
