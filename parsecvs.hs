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

trimQ::String->String
trimQ s = tail $ drop 1 s 

maxlen::[String]->Int
maxlen [] = 0
maxlen s  = maximum $ map(\x -> length x) s 

capture::String->[[String]]
capture s = s =~ "(\"[^\"]+\")|([0-9.]+)" :: [[String]]

sub = \x -> subRegex (mkRegex "\\\\r\\\\n") x " "

main = do
        list <- readFileToList fname
        let llist= map(\x -> map(\y -> if isStr $ head y then sub $ head y else head y) (capture x) ) list
        let padlist   = map(\l -> map(\x -> if isStr x then (trimQ x ++ pad (maxlen(l) - length(trimQ x) )) else pad (maxlen(l) - length x) ++ x ) l) llist 
        let splist  = map(\l -> map(\x -> x ++ " ") l) padlist 
        let flist = map(\l -> foldr(++) [] l) splist 
        writeToFile outname flist 
