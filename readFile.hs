import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex

data ID = GPG 
        | String

openSpan = "<span>"
closeSpan = "</span>"

main = do
    print("readFile input.txt out.txt")
    [inFile, outFile] <- getArgs
    handle <- openFile inFile ReadMode
    contents <- hGetContents handle
    let line = lines contents

    let op = matchRegex
    let r = mkRegex "git"  

    --let list = map (++ closeSpan) line
    let kk = subRegex r
    let list = map (kk "===\0") line
    let list2 = map (openSpan ++) list
    appendFile outFile $ unlines list2 
    putStr contents
    hClose handle
     
    
