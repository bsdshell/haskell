import Data.Char 
import Text.Regex.Posix
import Text.Regex
import Data.List 
import Data.List.Split 
import AronModule 

left = "copy(\"http://localhost/zsurface/html/"
right = "/html/"
p = "/Library/WebServer/Documents/zsurface/htmls/"

main = do 
          list <- readFileToList "hhhh.x"
          let list2 = map(\x -> left ++ x ++ "\"," ++ "\"" ++ p ++ x ++ "\"" ++ ");") list
          mapM(\x -> putStr $ x ++ "\n") list2
          
