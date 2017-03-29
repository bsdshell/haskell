import Text.Regex
import Text.Regex.Posix
import Data.Bits
import System.FilePath.Posix
import System.Environment
import System.IO
import AronModule


--replaceImgTab::String->String
--replaceImgTab input = subRegex(mkRegex imgPattern) filterStr  "<img src=\\2 width=\\4 height=\\6>" 
--                where
--                    filterStr 
--                        | length l > 0 =  head l 
--                        | otherwise = input 
--                        where 
--                            l = filter(\x-> length x > 0) $ splitRegex(mkRegex "^[[:space:]]*\\[\\[|\\]\\][[:space:]]*$") input
--                            imgPattern = "(src[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++
--                                         "(w[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++ 
--                                         "(h[[:space:]]*=[[:space:]]*)([^[:space:]]*)"

--			<!-- Column 2 start -->
--            <ul>

main = do 
        print "Hello World"
        let p1 = mkRegex "<!-- Column 2 start -->" 
        putStrLn $ subRegex p1 "this is cool <!-- Column 2 start -->"  "[\\0]"    -- [416-123-4483]
