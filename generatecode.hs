import System.Environment
import AronModule
import System.Directory 

import Text.Regex
import Text.Regex.Posix
import Data.Bits
import System.FilePath.Posix
import System.IO



main = do 
        let hcodePath = "/Users/cat/myfile/github/haskell/text/haskell.txt"
        let jcodePath = "/Users/cat/myfile/github/haskell/text/java.txt"
        let hpath     = "/Users/cat/myfile/github/haskell/"
        let jpath     = "/Users/cat/myfile/github/java/"
        argList <- getArgs 

        print argList
        let fileType = head argList
        print ("type=" ++ fileType)
        case fileType of 
            "h" -> do 
                    list <- readFileToList hcodePath 
                    let full = hpath ++ (head $ tail argList) ++ ".hs"
                    print full
                    isThere <- doesFileExist full
                    if isThere == False then (writeToFile full list) else (print "file exists")
            "j" -> do 
                    list <- readFileToList jcodePath 
                    let full = jpath ++ (head $ tail argList) ++ ".java"
                    print full
                    isThere <- doesFileExist full

                    let r1 = mkRegex "Program"
                    let fname = head $ tail argList 
                    mapM print list
                    let newList = map(\x -> subRegex r1 x fname ) list
                    if isThere == False then (writeToFile full newList) else (print "file exists")
            _ -> putStrLn "Invalid option. [h => haskell, j => java]. [ge h myhaskell or ge j Myjava]"


