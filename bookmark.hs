import Data.Char 
import Data.List.Split
import AronModule 
import Text.Regex.Base.RegexLike
import Text.Regex
import System.Environment 
import System.Console.GetOpt

bmfile = "/Users/cat/myfile/github/bookmark/bookmark.txt"

select input url = case list of 
                    [] ->show("Invalid input") 
                    _  ->case fst $ list !! 0 of 
                                    0 ->show(url !! 0) 
                                    1 ->show(url !! 1) 
                    where
                        list = reads input::[(Int, String)]

readData::String->IO [[String]]
readData fname = do 
                list <- readFileToList bmfile
                mapM (\x -> putStr $ "[" ++ x ++ "]") list 
                fl
                let ll = filter(\x -> length x > 0) list
                print ll
                fl
                let la = splitWhen(\x -> length x == 0) list 
                return la 

main = do 
        args <- getArgs
        print args
        let str = args !! 0 
        let index = args !! 1 
        print $ "str =" ++ str

        strList <- readData bmfile 

        let regex = mkRegex str 
        let wordURL =  filter(\x -> matchTest regex $ head x) strList
        mapM print wordURL
        fl
        let mlist = filter(\x -> length x > 0) wordURL 
        putStrLn "-- mlist --"
        mapM print mlist 
        fl

        let urllist = map(\x -> x !! 1) mlist
        let nlist = [0..(length mlist - 1)] 
        print nlist
        mapM print urllist

        let itemList = zipWith(\x y -> show(x) ++ " " ++ y) nlist urllist
        mapM print itemList
        fl

        putStrLn "Please select item to open"
        input<- getLine
        print $ select input itemList 
