import Data.Char 
import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import AronModule


urlReplace::[String]->String->String->[String]
urlReplace [] _ _ = [] 
urlReplace (x:xs) p r = subRegex (mkRegex p) x r : urlReplace xs p r 

main = do 
        print "Hello World"
        let list = ["dog", "cat"]
        let nl = urlReplace list "o" "K"
        print nl

        let list = []
        let nl = urlReplace list "o" "K"
        print nl

        let list = ["dog", "cat"]
        let nl = urlReplace list "dog" "cow"
        print nl
