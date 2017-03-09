import Data.Char 
import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import AronModule


flist = ["dog", "at"]

readMyFile::FilePath->IO[String] 
readMyFile f = readFile f >>= \contents -> return (lines contents) 

main = do 
        print "Hello World"

        let inFile_secret  = "/Users/cat/myfile/private/secret.m" 
        let outFile_secret = "/Users/cat/myfile/private/secret.vimrc" 

        let inFile  = "/Users/cat/myfile/github/snippets/snippet.m" 
        let outFile = "/Users/cat/myfile/github/snippets/snippet.vimrc" 

--        handle <- openFile inFile ReadMode
--        contents <- hGetContents handle
--        let line = lines contents

        line1 <- readMyFile inFile
        line2 <- readMyFile inFile_secret

--        handle_secret <- openFile inFile_secret ReadMode
--        contents_secret <- hGetContents handle_secret
--        let line_secret = lines contents_secret

        let bigline = line1 ++ line2 

        fl
        mapM_ (print) bigline 
        fl


