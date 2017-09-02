import Data.Char 
import System.IO
import System.Environment
import System.Directory

oldDir = "/Users/longshu/try/test1"
newDir = "/Users/longshu/try/test1"
prefix = "KKK_"
main = do 
        print "Hello World"
        allFiles <- listDirectory oldDir
        mapM print allFiles
        mapM_(\x -> renameFile (oldDir ++ "/" ++ x)  (oldDir ++ "/" ++ prefix ++ x)) allFiles 
        print "done!"

