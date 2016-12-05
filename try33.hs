import Data.Char 
import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import AronModule

fname = "/Users/cat/myfile/github/haskell/text/ll.tex"

sub = \x -> subRegex (mkRegex "\\|") x "\\\\\\0"

main = do 
        print "Hello World"
        list <- readFileToList fname 
        print list
        fl
--        let r0 = mkRegex "\\\\\\|"
--        let r0 = mkRegex "([^\\\\]|)"
--        let replace0 = "[\\0]"
--        let ll = map(\x -> subRegex r0 x replace0 ) list
--        print ll

        putStrLn $ sub "a|b|" 
        putStrLn $ sub "a" 
