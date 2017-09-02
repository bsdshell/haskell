import Data.Char 
import Control.Monad
import System.IO
import System.Environment
import System.Directory

-- rename -o dir  KK_
oldDir = "/Users/longshu/try/test1"
newDir = "/Users/longshu/try/test1"
main = do 
        print "rename -o dir file_prefix"
        print "rename -o /dir file_prefix"
        argList <- getArgs 
        print argList

        let option = head argList
        let currDir = getCurrentDirectory
        contents <- listDirectory oldDir
        fileList <- filterM(\x -> doesFileExist $ oldDir ++ "/" ++ x) contents 
        mapM print fileList 
        print ("Option=" ++ option)


        let len = length argList
        case len of
            1 -> do
                let argList = 
                mapM_(\x -> renameFile (oldDir ++ "/" ++ x)  (newDir ++ "/" ++ dir ++ "/" ++ prefix ++ x)) fileList 
            3 -> do
                case option of
                        "-o" -> do
                            let dir = argList !! 1
                            let prefix = argList !! 2
                            doesExist <- doesDirectoryExist (newDir ++ "/" ++ dir)
                            if doesExist == False then createDirectory (newDir ++ "/" ++ dir) else print "dir exist" 
                            mapM_(\x -> renameFile (oldDir ++ "/" ++ x)  (newDir ++ "/" ++ dir ++ "/" ++ prefix ++ x)) fileList 
                        _  -> putStrLn "done!"
            _ -> putStrLn "len = "
