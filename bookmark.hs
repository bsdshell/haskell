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

applist = [["open", ".pdf$"], ["open", "^http"]]

select input url = case list of 
                    [] ->[] 
                    _  ->[fName, fDir]
                    where
                        list     = reads input::[(Int, String)]
                        getNum   = fst $ list !! 0    -- [(3, "")] = > 3
                        fullPath = url !! getNum
                        fName    = filter(/= '"') $ takeFileName fullPath 
                        fDir     = takeDirectory fullPath


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
        let wordURL =  filter(\x -> matchTest regex $ map(\y -> toLower y ) $ head x) lineList 
        putStrLn("")
        ff "wordURL" wordURL
        let mlist = filter(\x -> length x > 0) wordURL 

        ff "mlist" mlist 

        let appAndList = [(head x, trimWS $ y !! 1) | x <- applist, y <- wordURL, matchTest (mkRegex  (x !! 1)) (y !! 1) ]


        let urllist = map(\x -> x !! 1) mlist
        ff "urllist" urllist

        putStrLn "Please select item to open"
        input<- getLine

        let strNum = reads  input::[(Int, String)]
        let selectNum = fst $ head strNum 
        print $ show(selectNum) 
        let flist =  appAndList !! selectNum 
        let nlist = [0..length appAndList -1]
        ff "flist" flist
        ff "nlist" nlist
        let tupleList = zip nlist appAndList 
        ff "tupleList" tupleList
        ff "appAndList" appAndList
        (_,_,_,_) <- createProcess(proc (fst flist)  [snd flist] ){ cwd = Nothing }
        fl
