import Data.Char 
import System.Directory
import Text.Regex.Posix
import Text.Regex
import Data.List 
import Data.List.Split 
import AronModule 

mylist = ["dog", "kkdog"]
htmlDir = "/Library/WebServer/Documents/zsurface/html"

capture::String->[[String]]
capture s = s =~ "\"([^\"]+)\"" :: [[String]]

main = do 
--        print "Hello World"
--        let mstr = mkRegex "[^\"]*"

          let reg = mkRegex ".*.html"
          let listio = getDirectoryContents htmlDir  >>= \files -> return [x | x <- files, length x > 0 && matchTest reg x]
          linelist <- listio
--          linelist <- readFileToList "getpage.php"
          let list = init $ init $ tail linelist
--          list <- readFileToList "getpage.php"
          mapM(\x -> putStr $ "[" ++ x ++ "]\n") list
          let list2 = filter(\x-> length x > 10) list
          fl
          mapM(\x -> putStr $ "list2[" ++ x ++ "]\n") list2
          let cap = map(\x -> capture x) list2
          let list4 = filter(\x -> length x > 0) cap
          let list5 = foldr(++) [] list4 
          let list6 = map(\x -> if length x > 1 then x !! 1 else []) list5 
          mapM(\x -> putStrLn $ "list6[" ++ x ++ "]") list6

          let pat = mkRegex "/"
          let list7 = map(\x -> splitRegex pat x) list6 
          let list8 = map(\x -> reverse $ take 2 $ reverse x) list7 
          ff "list8" "+++"
          print list8
          let list88 = map(\x -> "/" ++ x !! 0 ++ "/" ++ x !! 1) list8
          print list88
          fl
          print list
          fl
          print $ length list
          print $ length list88
          let mylist = zipWith(\x y -> init x ++ ", " ++ "\"" ++ y ++ "\"" ++ ")") list list88
          writeToFile "file.x" mylist
