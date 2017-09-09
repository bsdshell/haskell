import Data.Char 
import Control.Monad
import System.IO
import System.Environment
import System.Directory



oldDir = "/Users/cat/try"
newDir = "/Users/cat/try"
main = do 
        print "rename file_prefix     -> Rename all in current directory"
        print "rename dir file_prefix -> Create dir in current directory"
        print "---------------------------------------------------------"
        argList <- getArgs 
        print argList

        let firstArg = head argList
        currDir <- getCurrentDirectory
        print ("currDir=" ++ currDir)
        print ("firstArg=" ++ firstArg)

        contents <- listDirectory currDir 
        fileList <- filterM(\x -> doesFileExist $ currDir ++ "/" ++ x) contents 
        let len = length argList

        case len of
            1 -> do
                mapM print fileList 
                mapM_(\x -> copyFile (currDir ++ "/" ++ x)  (currDir ++ "/" ++ firstArg ++ x)) fileList 
            2 -> do
                print "two Args"
                print argList
                let dir = argList !! 0 
                let prefix = argList !! 1 
                doesExist <- doesDirectoryExist (currDir ++ "/" ++ dir)
                if doesExist == False then createDirectory (currDir ++ "/" ++ dir) else print "dir exist" 
                mapM_(\x -> copyFile (currDir ++ "/" ++ x)  (currDir ++ "/" ++ dir ++ "/" ++ prefix ++ x)) fileList 
            3 -> do
                print "do nothing"
            _ -> putStrLn "len = "
        
