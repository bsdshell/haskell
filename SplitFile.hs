import Data.Char 
import System.IO
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import System.Directory
import System.Environment
import System.FilePath.Posix
import Text.Regex.Posix
import Text.Regex
import Control.Monad 
import AronModule

main = do 
        let oldDir = "/Users/cat/myfile/github/java/text/ht/" 
        let newDir = "/Users/cat/myfile/github/java/text/new/" 
        files <- listDirectory oldDir 
        pList <- filterM(\x -> doesFileExist $ oldDir ++ x) files 
        let fullList= map(\x -> oldDir ++ x) pList 
        let newList = map(\x -> newDir ++ x) files 
        print newList
        mapM print pList 
        fl
        mapM print fullList 

        ffList <- mapM(\fn -> readFile fn >>=(\contents -> return(splitRegex(mkRegex "<!-- Column 2 start -->|<!-- Column 2 end -->") contents))) fullList
        fl
        print "ffList"
        print ffList
        let menuHtml = ["<!-- Column 2 start -->\n<ul>"] ++ ["content"] ++ ["</ul>\n<!-- Column 2 end -->"]
        fl
        let contents = map(\l -> [head l] ++ menuHtml ++ [last l]) ffList
        fl
        print $ contents 
        fl
        zipWithM(\fn list -> writeToFile fn list) newList contents 
