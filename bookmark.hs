import Data.Char 
import AronModule 


bmfile = "/Users/cat/myfile/github/bookmark/bookmark.txt"
main = do 
        print "Hello World"
        list <- readFileToList bmfile
        mapM putStr list
