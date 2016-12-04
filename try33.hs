import Data.Char 
import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import AronModule


main = do 
        print "Hello World"
        let r1 = mkRegex "\\|"
        let r2 = mkRegex "\\|"
        let input = "{c|c|}"
        let replace1 = "[\\\\\\0]"
        putStrLn $ subRegex r2 input replace1            -- http://[google].com
