import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import AronModule
import System.Directory
import Data.List 
import Data.List.Split 

fname = "/Users/cat/myfile/github/java/text/big.txt" 
outname = "./text/acl_out1.txt"

isStr::String->Bool
isStr s = if s !! 0 == '"' && s !! (length s -1) == '"' then True else False

pad::Int->String
pad n = foldr (++) "" $ replicate n "-"

trim::String->String
trim s = tail . init $ s 

maxlen::[String]->Int
maxlen [] = 0
maxlen s  = maximum $ map(\x -> length x) s 

capture::String->[[String]]
capture s = s =~ "(\"[^\"]+\")|([0-9.]+)" :: [[String]]

sub = \x -> subRegex (mkRegex "\\\\r\\\\n") x " "

main = do
        list <- readFileToList fname
        let llist = map(\l -> map(\x -> if isStr $ head x then sub $ head x else head x) (capture l) ) list
        let plist = map(\l -> map(\x -> if isStr x then (trim x ++ pad(maxlen(l) - length (trim x) )) else pad(maxlen(l) - length x) ++ x ) l) llist
        let slist = map(\l -> map(\x -> x ++ " ") l) plist
        let flist = map(\l -> foldr(++) [] l) slist
        writeToFile outname flist 
