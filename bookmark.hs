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

-- list = [(Int, String)] = [(3, "")]
-- -------------------------------------------------------------------------------- 
-- (input=1, url=["pdf", "html"]) => "html"
-- -------------------------------------------------------------------------------- 
select input url = case list of 
                    [] ->show("Input must be a integer.") 
                    _  ->show(url !! getNum) 
                    where
                        list   = reads input::[(Int, String)]
                        getNum = fst $ list !! 0    -- [(3, "")] => 3

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
        putStrLn "-- urllist --"
        mapM print urllist

        let itemList = zipWith(\x y -> show(x) ++ " " ++ y) nlist urllist
        mapM print itemList
        fl

        putStrLn "Please select item to open"
        input<- getLine
        let url = select input urllist 
        print $ "url="++url
        let cmd = "open " ++ url

        -- assume the file name does't contain ["] character
        let fName = filter(/= '"') $ takeFileName  url
        print ("dog" == "dog")
        let trim = trimWS fName
        print (fName == trim)
        print $ "fName=[" ++ fName ++ "]"
        print $ "trim=[" ++ trim ++ "]"
        print ((trimWS $ fName) == "asymptote_tutorial.pdf")
        let fDir   = takeDirectory url
        print $ "dir=[" ++ fDir ++ "] fName=[" ++ fName ++ "]"

        print $ "cmd =" ++ cmd

        -- /Users/cat/GoogleDrive/Books/asymptote_tutorial.pdf
        -- let arr = "asymptote_tutorial.pdf":[] 
        let arr = fName:[] 
        (_,_,_,_) <- createProcess(proc "open" arr){ cwd = Just "/Users/cat/GoogleDrive/Books/" }
        print "dog"
        
