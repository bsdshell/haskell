import System.IO
import System.Directory
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Data.List 
import Data.List.Split 
import AronModule

-- display image syntax
-- [[ src=image/img.png w=50% h=30% ]]
replaceImgTab::String->String
replaceImgTab input = subRegex(mkRegex imgPattern) filterStr  rep 
                where
                    imgPattern = "(src[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++
                                 "(w[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++ 
                                 "(h[[:space:]]*=[[:space:]]*)([^[:space:]]*)"
                    rep = "<div class=\"cen\"><img src=\\2 width=\"\\4\" height=\"\\6\"></div>"

                    filterStr 
                        | length l > 0 =  head l 
                        | otherwise = input 
                        where 
                            l = filter(\x-> length x > 0) $ splitRegex(mkRegex "^[[:space:]]*{{|}}[[:space:]]*") input
 
style::String->String->String->[String]->[String]
style pat l r list = map(`op` rep) list 
                        where op = subRegex $ mkRegex pat 
                              rep = l ++ match ++ r
                              match = "\\0"

replace::String->String->[String]->[String]
replace pat rep list = map (`op` rep) list
                        where op = subRegex $ mkRegex pat

htmlTab::String->String->[String]->[String]
htmlTab _ _ [] = []
htmlTab left right list = map(left ++) $ map (++ right) list

html::String->String->[String]->String
html open close list = open ++ (unlines list) ++ close

codeHighLight::String->[String]->[String]
codeHighLight pat list = map(`op` rep) list 
                where rep = "<span class=\"bracket\">\\1</span>"
                      op = subRegex $ mkRegex pat

displayPath::String->String->String->String
displayPath path inFile outFile = if inFile == "mytext.txt" 
                            then "file://" ++path ++ "/" ++ outFile 
                            else ""


lt                      =  "(<)"
gt                      =  "(>)"

html_lt                 =  "&lt;"
html_gt                 =  "&gt;"

htmlOpen                =  "<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"mycss/style.css\"/></head><body class=\"htmlbg\">"
htmlClose               =  "</body></html>"

openSpan                =  "<span class=\"keyword\">"
closeSpan               =  "</span>"

-- //xxx, // xxx
comment                 =  " //.*$"
commentOpen             =  "<span class=\"comment\">"
commentClose            =  "</span>"

-- :xxx
keyword                 =  "^[[:space:]]*(:[[:graph:]]+)[[:space:]]*"

-- [ xxx ], [xxx]
titleOpen               =  "<span class=\"tit\">"
titleClose              =  "</span>"
title                   =  "^[[:space:]]*\\[[a-zA-Z0-9_:, ]+\\]"

-- { xxx }, {xxx}
header                  =  "^[[:space:]]*{[a-zA-Z0-9 ]+}"                                                                       
headerOpen              =  "<span class =\"header\">"
headerClose             =  "</span>"
preOpen                 =  "<pre>"
preClose                =  "</pre>"

-- 1. , 2.
numName                 =  "^[[:space:]]*[0-9]+\\.[[:space:]]+"
spanNumOpen             =  "<span class=\"num\">"
spanNumCose             =  "</span>"

html_tag                =  "^[[:space:]]*(<[^<>]+>[^<>]*<[[:space:]]*/[^<>]+>.*$)"

pattern                 = "(\\[|\\]|\\(|\\)|{|}|git|maybe |-&gt;)"
pattern1                = "([[:graph:]]+::)"
--pattern                 = "(git)"

main = do
    print("geneHtml input.txt out.txt")
    [inFile, outFile] <- getArgs
    handle <- openFile inFile ReadMode
    contents <- hGetContents handle

    currDir <- getCurrentDirectory
    print currDir

    let line      = lines contents

    let splitcode  = splitRegex(mkRegex "([[:blank:]]+`\\[[[:blank:]]*\n)|([[:blank:]]+`\\][[:blank:]]*\n)") (unlines line)

    -- [[--------------------------------------------------------------------------
    let oddList    = fst $ splitList splitcode
    let evenListCode   = snd $ splitList splitcode
    let evenListCode1  = replace lt html_lt evenListCode 
    let evenListCode2  = replace gt html_gt evenListCode1 

    print oddList
    print "----------------------------------"
    let oddListList = map(\x->splitRegex(mkRegex "\n") x) oddList 
    print oddListList

    
    let list00 = map(\x -> replace lt html_lt x) oddListList
    let list11 = map(\x -> replace gt html_gt x) list00 

    let listxx = map(\x -> if length x > 0 then init x else x) list11
    let listxx11 = map(\x-> map(\y -> if length y == 0 then "<br>" else y) x) listxx 
    print "================================="
    print listxx11
    print "================================="


    --let list22 = map(\x -> style keyword openSpan closeSpan x) list11 
    let list22 = map(\x -> style keyword openSpan closeSpan x) listxx11 
    print $ "list22<" ++ list22 ++ ">list22"
    let list33 = map(\x -> style title titleOpen titleClose x) list22
    let list44 = map(\x -> style comment commentOpen commentClose x) list33
    let list55 = map(\y -> map(\x -> replaceImgTab x) y) list44 

    let list66 = map(\x -> style header headerOpen headerClose x) list55
    let list77 = map(\x -> style numName spanNumOpen spanNumCose x) list66
    let list88 = map(\x -> replace html_tag "\\0<br>" x) list77
    let fold   = map(\x -> foldr (++) "" x)list88
    -- ]]--------------------------------------------------------------------------


    --let pat        = "(\\[|\\]|\\(|\\)|{|})"
    let styleCode1         = codeHighLight pattern evenListCode2 
    let styleCode2         = codeHighLight pattern1 styleCode1 
    let finalStyleCode     = map(preOpen ++) $ map(++ preClose) styleCode2 

    --let mergeAllList = mergeList oddList finalStyleCode 
    let mergeAllList = mergeList fold finalStyleCode 

    writeFile outFile $ html htmlOpen htmlClose mergeAllList 

    --putStr contents
    hClose handle

    currDir <- getCurrentDirectory
    let fullPath = displayPath currDir inFile outFile 
    putStrLn ""
    putStrLn "Html Path: copy following path to your browser"
    putStrLn fullPath

