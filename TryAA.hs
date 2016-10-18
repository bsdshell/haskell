import Data.Char 
import System.IO
import Data.Char 
import Data.List.Split
import Text.Regex.Base.RegexLike
import Text.Regex
import System.Environment 
import System.Console.GetOpt
import System.Process
import System.FilePath
import System.Environment 

import AronModule 

main = do 
        print "Hello World"
        (_,_,_,_) <- createProcess(proc "open"  ["/Users/cat/GoogleDrive/Books/povray_tutorial.pdf"] ){ cwd = Just "." }
        print "dog"
