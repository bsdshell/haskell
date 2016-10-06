import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base

re     = "my food"         =~ "foo"::Bool
refoo  = "my food foo"     =~ "foo"::String
relist = "my foolish fool" =~ "foo."::[[String]]
reseq  = "my foolish fool" =~ "foo."::(String, String, String)


-- 100+
---------------
-- 100
-- 100-
-- [1..100][101...]

suffixed n = show n ++ suffix
    where 
        suffix
            | n `mod` 100 `div` 10 == 1 = "th"
            | otherwise = case n `mod` 10 of 
                1 -> "st"
                2 -> "nd"
                3 -> "rd"
                _ -> "th"

result = map suffixed [1..40]

f::()->()
f _ = () 

f1::Bool->Bool
f1 _ = () == () 

f2::Bool->Bool
f2 x = (1 == 2) == True 

f3::Bool->Bool
f3 _ = False 

f4::Bool->Bool
f4 undefined = False 

f5::Bool->Bool
f5 undefined = undefined 

f6::Bool->Bool
f6 _ = undefined 

f7::Bool->Bool
f7 = undefined 

f8::Bool->Bool
f8 = \x -> undefined

f9::Int->Int
f9 = \x -> x + 1 

f10::Int->Int
f10 = \x -> f9 x 

f11::Int->Int
f11 x = x + 1 + (f9 1) 

f12::Int->Int
f12 = \x -> (x + 1) 


main = do
        let r = mkRegex "(git|god)"
        putStrLn $ subRegex r "this is my git  god"  "[\\1] {\\0}" 
        print re 
        print refoo 
        print relist
        print reseq
        print $ map suffixed [1..301]; 
        print (f9 1) 
        print (f10 1) 
        print (f11 1) 
        

