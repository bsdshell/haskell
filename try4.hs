import Text.Regex
import Text.Regex.Posix
import Data.Bits
import System.FilePath.Posix
import System.Environment
import System.IO
import AronModule


replaceImgTab::String->String
replaceImgTab input = subRegex(mkRegex imgPattern) filterStr  rep 
                where
                    filterStr 
                        | length l > 0 =  head l 
                        | otherwise = input 
                        where 
                            l = filter(\x-> length x > 0) $ splitRegex(mkRegex "^[[:space:]]*\\[\\[|\\]\\][[:space:]]*$") input
                            imgPattern = "(src[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++
                                         "(w[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++ 
                                         "(h[[:space:]]*=[[:space:]]*)([^[:space:]]*)"

                            rep = "<img src=\\2 width=\\4 height=\\6>"




--imgTab::String->String
--imgTab input = subRegex(mkRegex imgPattern) list  rep 
--                where
--                    list = filter (\x->(length x == 3)) $ splitRegex(mkRegex "^[[:space:]]*\\[\\[|\\]\\][[:space:]]*$") input
--
--                    imgPattern = "(src[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++
--                                 "(w[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++ 
--                                 "(h[[:space:]]*=[[:space:]]*)([^[:space:]]*)"
--
--                    rep = "<img src=\\2 width=\\4 height=\\6>"
--


--splitRegex(mkRegex "^[[:space:]]*\\[\\[|\\]\\][[:space:]]*$") input 
input = " [[ src=dog.png w=20% h=30% ]] "
codelist = splitRegex(mkRegex "^[[:space:]]*\\[\\[|\\]\\][[:space:]]*$") input 
imgPattern = "(src[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++
             "(w[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++ 
             "(h[[:space:]]*=[[:space:]]*)([^[:space:]]*)"
rep = "<img src=\\2 width=\\4 height=\\6>"
imgFile = subRegex(mkRegex imgPattern) " src=dog.png w=20% h=30%"  rep 


main = do
        [inFile, outFile] <- getArgs
        handle <- openFile inFile ReadMode
        contents <- hGetContents handle
        print "dog"


--        print "try4" 
--        print codelist
--        print $ "imgFile=" ++ (show imgFile) 
--        print imgFile 
--        print $ fst $ splitList ["a", "c"] 
--
--        let imgstr1 = "[[src=dog.png w=300% h=400%]]"
--        let img = replaceImgTab imgstr1
--        print img
--
--        let imgstr2 = ""
--        let img2 = replaceImgTab imgstr2
--        print img2


--        let imgstr3 = " src=kk kksdf "
--        let img3 = replaceImgTab imgstr3
--        print img3
        --let list = [ "[[src=dog.png w=300% h=400%]]", "  [[  src=dog1.png w=300% h=400%]]  ", "kkadsf"]
        let output = map(\x-> replaceImgTab x) line 
        print output

        writeFile outFile $  (unlines output) 

        --putStr contents
        hClose handle



















