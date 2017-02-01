import Data.Char 
import System.IO
import System.Environment
import System.Directory
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import AronModule


htmlDir = "/Library/WebServer/Documents/zsurface/html"
mylist = ["dog.html", "dog.html", "0123456789012345678901234567890123456789.html"]
main = do 
        print "Hello World"
        let reg = mkRegex ".*.html"
        let list = getDirectoryContents htmlDir  >>= \files -> return [x | x <- files, length x > 0 && matchTest reg x]
        list1 <- list
--        let list = filter(\x -> length x > 0 && matchTest reg x) content 
--        let list1 = filter(\x -> matchTest reg x) list 
        mapM(print) list1
--        print "dog"
