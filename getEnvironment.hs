import Data.Char 
import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import AronModule

main = do 
        print "Hello World"
        home <- getEnv "HOME"
        path <- getEnv "PATH"
        print $ "home=[" ++ home  ++ "]"
        print $ "path=[" ++ path ++ "]" 
