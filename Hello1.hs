import Data.Char 
import System.IO
import System.Environment
import System.Directory

fileDir = "/Users/longshu/try/test1"
main = do 
        print "Hello World"
        setCurrentDirectory fileDir
        allFiles <- listDirectory fileDir
        currDir <- getCurrentDirectory
        mapM print allFiles
        print $ "currDir=" ++ currDir 
        mapM_(\x -> renameFile (currDir ++ "/" ++ x)  (fileDir ++ "/KKK_" ++ x)) allFiles 
        print "done!"

