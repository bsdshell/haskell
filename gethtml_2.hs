import Data.Char 
import System.Directory
import System.Process
import Text.Regex.Posix
import Text.Regex
import Data.List 
import Data.List.Split 
import AronModule 

mylist = ["dog", "kkdog"]
htmlDir = "/Library/WebServer/Documents/zsurface/html"
htmlPHP = "/Library/WebServer/Documents/zsurface/php/getpage.php"
htmlIndex = "/Library/WebServer/Documents/zsurface/php/myindex.php"
left = "copy(\"http://localhost/zsurface/html/"
right = ");"

-- copy("http://localhost/zsurface/html/indexAddImageResourcetoXcode.html")

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
          let mylist = map(\x -> left ++ x ++ "\" , " ++ "\"" ++ htmlDir ++ "/" ++ x ++ "\"" ++ right) list2 

          let mylist2 = ["<?php"] ++ mylist ++ ["?>"]
          mapM(print) mylist2
          writeToFile htmlPHP mylist2
          let cmd = "php -f " ++ htmlPHP
          callCommand cmd
          let indexCmd = "php -f " ++ htmlIndex
          callCommand indexCmd 
          print "dog"
