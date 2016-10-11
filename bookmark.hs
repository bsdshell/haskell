import System.IO
import Data.Char 
import Data.List.Split
import AronModule 
import Text.Regex.Base.RegexLike
import Text.Regex
import System.Environment 
import System.Console.GetOpt
import System.Process
import System.FilePath
import System.Environment 


bmfile = "/Users/cat/myfile/github/bookmark/bookmark.txt"

select input url = case list of 
                    [] ->[] 
                    _  ->[fName, fDir]
                    where
                        list     = reads input::[(Int, String)]
                        getNum   = fst $ list !! 0    -- [(3, "")] = > 3
                        fullPath = url !! getNum
                        fName    = filter(/= '"') $ takeFileName fullPath 
                        fDir     = takeDirectory fullPath
                        fun s 
                            | 2 > 3 = "dog"
                            | otherwise = "cat"

readData::String->IO [[String]]
readData fname = do 
                list <- readFileToList bmfile
                mapM (\x -> putStr $ "[" ++ x ++ "]") list 
                let ll = filter(\x -> length x > 0) list
                let la = splitWhen(\x -> length x == 0) list 
                return la 

main = do 
        args <- getArgs
        print args
        let str = args !! 0 
        let index = args !! 1 
        strList <- readData bmfile 
        let lineList = filter(\x -> length x > 0)strList
        
        ff "lineList" lineList 
        let regex = mkRegex str 
        let wordURL =  filter(\x -> matchTest regex $ head x) lineList 
        putStrLn("")
        ff "wordURL" wordURL
        let mlist = filter(\x -> length x > 0) wordURL 

        ff "mlist" mlist 

        let urllist = map(\x -> x !! 1) mlist
        let nlist = [0..(length mlist - 1)] 
        print nlist
        ff "urllist" urllist

        let itemList = zipWith(\x y -> show(x) ++ " " ++ y) nlist urllist
        ff "itemList" itemList

        putStrLn "Please select item to open"
        input<- getLine

        let flist = select input urllist 
        ff "flist" flist 
        (_,_,_,_) <- createProcess(proc "open"  $ take 1 flist ){ cwd = Just $ last flist }
        fl
