import Data.Char 
import System.IO
import System.Environment
import System.Directory

main = do 
        print "Hello World"
        let listOfFullPath = ["/home/name/oldFile.txt"]
        let dummyOutput = map(\x -> renameFile x  "/home/name/newFile1.txt") listOfFullPath
        print "done!"

