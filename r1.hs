import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Data.List

style::String->String->String->[String]->[String]
style pat l r list = map(`op` rep) list 
                        where op = subRegex $ mkRegex pat 
                              rep = l ++ match ++ r
                              match = "\\0"

--[file=string.html title=""
--unwrap Maybe
open::Maybe a->a
open Nothing = error "error"
open (Just a) = a

-- find the index of Char
findChar::Char->String->Int
findChar _ [] = -1
findChar a (x:xs) = if a /= x then ((findChar a xs) + 1) else 0

-- substring from l to r
range::Int->Int->String->String
range l r str = if l >= length str || r >= length str then [] else (if l <= r then str !! l :[] ++ range (l+1) r str else [])
--]


--html_tab = "^[[:space:]]*(<[^<>]+>[^<>]*<[^<>]>)[[:space:]]*$"
html_tab = "^[[:space:]]*(<[^<>]+>[^<>]*<[[:space:]]*/[^<>]+>.*$)"

-- not _`[_
notword = "(^[[:graph:]]|[[:space:]][^`]|[[:space:]]`[^\\[]|[[:space:]]`\\[[[:graph:]])"

main = do
    let t1 = subRegex (mkRegex html_tab) "<s></s> asdkfjasd >kk" "[cat]"
    putStr $ "t1=" ++ t1  ++ "\n"

    let t2 = subRegex (mkRegex html_tab) "<s> dog </s>asdkfj asdfj sd" "[cat]"
    putStr $ "t2=" ++ t2 ++ "\n" 

    let t3 = subRegex (mkRegex html_tab) "<s> do g< /s>" "[cat]"
    putStr $ "t3=" ++ t3 ++ "\n" 

    let t4 = subRegex (mkRegex notword) "ad`[sk `[ " "{\0}"
    putStr $ "t4=" ++ t4 ++ "\n" 

    let t5 = subRegex (mkRegex notword) " `[k" "{\0}"
    putStr $ "t5=" ++ t5 ++ "\n" 

    print $ findChar 'a' "ceaba"
    print $ findChar 'a' "a"
    print $ findChar 'a' "k33a"
    print $ findChar 'a' ""

    print (open (Just 3))
    print $ range 1 4 "abcdefg"
    print $ range 1 100 "abcdefg"
    putStr "\n" 
