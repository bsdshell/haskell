import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Data.List 
import Data.List.Split 

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
                            l = filter(\x-> length x > 0) $ splitRegex(mkRegex "^[[:space:]]*\\[\\[|\\]\\][[:space:]]*") input
                            
                            



-- split into two lists: odd index list and even index list
splitList::[String]->([String], [String])
splitList [] = ([], [])
splitList [x] = ([x], [])
splitList (x:y:xs) = (x:xp, y:yp) where (xp, yp) = splitList xs

unwrap::Maybe a -> a
unwrap Nothing = error "this is nothing from unwrap" 
unwrap (Just x) = x

codelist = splitRegex(mkRegex "\\[|\\]") "what[code1][code2]"



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

codeCapture::String->String
codeCapture str = subRegex(mkRegex pat) str rep 
                    where rep = "<cool>\\1</cool>" 
                          pat = "(([^`]|`[^[]]*|\n*)*)"

codeBlock::String->String->String->String
codeBlock open close str = op str rep
                        where op = subRegex (mkRegex pat)  
                              rep = open ++ "\\1" ++ close
                              pat = codeOpen ++ "(([^`]|`[^[]]*|\n*)*)" ++ codeClose --fix it
                                  where 
                                        codeOpen = "^[[:space:]]*`\\[[[:space:]]*$"
                                        codeClose = "[[:space:]]*`\\][[:space:]]*$"

mergeList::[String]->[String]->[String]
mergeList [] [] = []
mergeList  l  [] = l 
mergeList []  r = r 
mergeList (x:xs) (y:ys) = x:y:mergeList xs ys 

mergeList2::[a]->[a]->Maybe [a]
mergeList2 [] [] = Just [] 
mergeList2 (x:xs) (y:ys) = 
            case mergeList2 xs ys of
            Just merged -> Just (x:y:merged)
            Nothing  -> Nothing
mergeList2 _ _  = Nothing


-- [[ src=file.png w=50% h=30% ]]
imgTab::String->String
imgTab input = subRegex(mkRegex imgPattern) (list !! 1)  rep 
                where
                    list = splitRegex(mkRegex "^[[:space:]]*\\[\\[|\\]\\][[:space:]]*$") input

                    imgPattern = "(src[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++
                                 "(w[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++ 
                                 "(h[[:space:]]*=[[:space:]]*)([^[:space:]]*)"

                    rep = "<img src=\\2 width=\\4 height=\\6>"


lt                      =  "(<)"
gt                      =  "(>)"

html_lt                 =  "&lt;"
html_gt                 =  "&gt;"

htmlOpen                =  "<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"mycss/style.css\"/></head><body class=\"htmlbg\">"
htmlClose               =  "</body></html>"

openSpan                =  "<span class=\"keyword\">"
closeSpan               =  "</span>"

-- //xxx, // xxx
comment                 =  "//.*$"
commentOpen             =  "<span class=\"comment\">"
commentClose            =  "</span>"

-- :xxx
keyword                 =  "^[[:space:]]*(:[[:graph:]]+)[[:space:]]*"

-- [ xxx ], [xxx]
titleOpen               =  "<span class=\"tit\">"
titleClose              =  "</span>"
title                   =  "^[[:space:]]*\\[[a-zA-Z0-9 ]+\\]"

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

html_tab                =  "^[[:space:]]*(<[^<>]+>[^<>]*<[[:space:]]*/[^<>]+>.*$)"

pattern                 = "(\\[|\\]|\\(|\\)|{|}|git|maybe |-&gt;)"
pattern1                = "([[:graph:]]+::)"
--pattern                 = "(git)"

main = do
    print("geneHtml input.txt out.txt")
    [inFile, outFile] <- getArgs
    handle <- openFile inFile ReadMode
    contents <- hGetContents handle

    let line      = lines contents

    let r_title   = mkRegex title
    let r_header  = mkRegex header
    let r_comment = mkRegex comment

    let list0     = replace lt html_lt line
    let list1     = replace gt html_gt list0 
    let list2     = style keyword openSpan closeSpan list1 
    let list3     = style title titleOpen titleClose list2 
    let list4     = style comment commentOpen commentClose list3

    print "[list4----------------------------------"
    print list4
    print "list4]----------------------------------"
    let list5     = map(\x->  replaceImgTab x) list4 

    print "[list5----------------------------------"
    print list5
    print "list5]----------------------------------"
    let list6     = style header headerOpen headerClose list5
    print list6
    let list7     = style numName spanNumOpen spanNumCose list6
    
    print list7
    --let list8     = map(\x->  replaceImgTab x) list7 

    let list8     = replace html_tab "\\0<br>" list7

    --let list9     = codeBlock preOpen preClose (unlines list8):[]
    let splitcode  = splitRegex(mkRegex "([[:blank:]]+`\\[[[:blank:]]*\n)|([[:blank:]]+`\\][[:blank:]]*\n)") (unlines list8)

    let oddList    = fst $ splitList splitcode
    let evenList   = snd $ splitList splitcode
    print evenList



    let styleCode1         = codeHighLight pattern evenList 
    let styleCode2         = codeHighLight pattern1 styleCode1 
     
    let finalStyleCode     = map(preOpen ++) $ map(++ preClose) styleCode2 
    print finalStyleCode
    
    print finalStyleCode
    print "----------------------------------------"
    print $ length oddList

    let mergeAllList = mergeList oddList finalStyleCode 
    print "[================================================="
    print mergeAllList 
    print "]================================================="
    writeFile outFile $ html htmlOpen htmlClose mergeAllList 

    --putStr contents
    hClose handle
