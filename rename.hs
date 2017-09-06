import System.Random
import Data.Ix
import System.IO
import System.Directory
import Data.Char 
import Control.Monad
import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import Data.Time.Clock.POSIX
import Data.Time
import Data.Time.Clock.POSIX


import AronModule


dir = "/Users/cat/try/ff"

main =  do 
--        path <- getCurrentDirectory
--        setCurrentDirectory path
--        print path
--        allFiles <- listDirectory dir 
--        let fullPaths = map(\x -> dir ++ "/" ++ x) allFiles
--        let tuple = zip (take (length allFiles) $ repeat dir) allFiles
--        mapM print tuple
--        mapM print allFiles
--        fl
--        mapM print fullPaths 
--        fl
--        
--        allList <- filterM(\x -> doesFileExist x) fullPaths 
--        let newName = map(\x -> renameFile (fst x ++ "/" ++ snd x)  (fst x ++ "/" ++ "kkk_" ++ snd x)) tuple 
--        fl
--        fl
        let ll = [("/Users/cat/try/ff/" , "file3.txt")]
        --renameFile (dir ++ "/" ++ "file3.txt")   (dir ++ "/" ++ "kkk_file3.txt")
        let emptyList = map(\x -> renameFile ((fst x)++(snd x))  ((fst x) ++ "kkfile.xxx") >> return ()) ll
        print ("rename")

