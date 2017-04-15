import Data.Char 
import Control.Monad
import System.IO
import System.Directory
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import AronModule



--htmlDir = "/Library/WebServer/Documents/zsurface/html/"
htmlDir = "/Users/cat/try/"

main = do 
        print "Hello World"
--        allFiles <- listDirectory htmlDir >>= \listName -> filterM(\n -> doesFileExist n) listName 
        allFiles <- listDirectory htmlDir >>= \listName -> filterM(\x -> doesFileExist $ htmlDir ++ x) listName 
        allDirs  <- listDirectory htmlDir >>= \listName -> filterM(\x -> doesDirectoryExist $ htmlDir ++ x) listName 
        mapM print allFiles 
        fl
        mapM print allDirs
        print "dog"
