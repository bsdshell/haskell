import System.IO
import System.Directory
import Data.List
import Text.Regex.Posix
import Text.Regex

f::Int->Int
f x = x + 1

main = do
    print $ f 3
    map (f) [1..4]
    print "end"
