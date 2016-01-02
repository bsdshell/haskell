import Text.Regex
import Text.Regex.Posix
import Data.Bits
import System.FilePath.Posix
import System.Environment
import Data.Maybe

string = "this is cool stuff"
list = ["this is cool stuff apple", "Apple cool", "apples not"]
--["this is cool stuff","cool"]
--
text = "/cat/man3/dog.txt"
fun x = case x `mod` 2 of
            0 -> "even"
            _ -> "odd"

fun' x = answer 
            where answer 
                    | x < 10 = "less then 10"
                    | x == 10 = "equal 10"
                    | otherwise = case x `mod` 2 of 
                                        0 -> "greater than 10 even" 
                                        _ -> "greater than 10 and odd"

open::Maybe a -> a
open Nothing = error "error Nothing"
open (Just a) = a

nthElement::[a]->Int->Maybe a
nthElement [] n = Nothing 
nthElement (x:xs) n | n == 0 = Just x 
                    | n >  0 = nthElement xs (n-1)
                    | otherwise = Nothing

myPrint::Show a => Maybe a ->IO()
myPrint (Just x) = print x 
myPrint Nothing  = print "nothing" 

--li = ["cat", "dog", "cow", "Except", "Except For"]
li = [] 

mymatch regex f s = 
        case matchRegexAll regex s of 
            Nothing->s
            Just(before, matched, after, l)->before ++ f l ++ after

--positive x = if x > 0 then (Just "Positive") else Nothing

data Myclass = Myclass{
                int::Integer,
                str::String
                }

instance Eq Myclass where
        (Myclass int1 str1) == (Myclass int2 str2) = (int1 == int2) && (str1 == str2)

half x = if x > 0 then (Just "Positive") else Nothing

main = do
       print("Hello World")
       let t1 = filter (=~ "is") ["this is it"] 
       print t1
       let ignoreCase = makeRegexOpts(defaultCompOpt .|. compIgnoreCase) defaultExecOpt
       let t3 = filter (matchTest $ ignoreCase "apple") ["My Apple"] 
       print t3
       let t4 = subRegex(mkRegex "p+") "apple sucks" "PP" 
       print t4
       let t5 = mymatch(mkRegex "man([0-9])") (\[n]->"woman" ++ n) "/cat/man3/dog.txt"
       print t5
       myPrint (Just 3)
       print $ (Myclass 3 "dog") == (Myclass 4 "dog")
       print $ (Myclass 3 "dog") == (Myclass 3 "dog")

       print $ (Just 3) >>= half
       print $ Nothing >>= half
       --myPrint Nothing 
       --myPrint $ nthElement li 1 
--       print $ open  $ nthElement li 1 
--       print $ open  $ nthElement li 3 
--       print $ open (Just 3) 
--       open  $ nthElement [] 3 
