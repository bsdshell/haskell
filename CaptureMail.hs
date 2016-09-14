import System.IO
import System.Directory
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Control.Monad 
import qualified Data.Set as Set
                  
readFileToList::FilePath->IO [String] 
readFileToList f = readFile f >>= \contents -> return (lines contents) 

writeToFile1::FilePath->[String]->IO()
writeToFile1 f list = writeFile f $ unlines list 

-- open file and capture all the emails, and write to a new file 
main = do
        let path = "/Users/cat/try/mail/m.txt"
        contents<- readFileToList path 
        let listMail = map(\x -> x =~ "([[:alnum:]\\._]+@[[:alnum:]]+\\.[[:alnum:]]+)"::String) contents 
        let ll = map(\x -> x ++ "\n") listMail
        print ll
        let wpath = "/Users/cat/try/mail/mail.txt"
        let set = Set.fromList ll 
        print set
        let mylist = Set.toList set
        print mylist
        writeToFile1 wpath mylist 
        
