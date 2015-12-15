import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex

style::String->String->String->[String]->[String]
style pat l r list = map(`op` rep) list 
                        where op = subRegex $ mkRegex pat 
                              rep = l ++ all ++ r
                              all = "\\0"

replace::String->String->[String]->[String]
replace pat rep list = map (`op` rep) list
                        where op = subRegex $ mkRegex pat

htmlTab::String->String->[String]->[String]
htmlTab _ _ [] = []
htmlTab left right list = map(left ++) $ map (++ right) list

html::String->String->[String]->String
html open close list = open ++ (unlines list) ++ close

htmlOpen      =  "<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"mycss/style.css\"/></head><body class=\"htmlbg\">"
htmlClose     =  "</body></html>"

ldiv          =  "<div class=\"tex\">"
rdiv          =  "</div>"

openSpan      =  "<span class=\"keyword\">"
closeSpan     =  "</span>"

comment       =  "//.*$"
commentOpen   =  "<span class=\"comment\">"
commentClose  =  "</span>"

keyword       =  "^[[:space:]]*(:[[:graph:]]+)[[:space:]]*"

titleOpen     =  "<span class=\"tit\">"
titleClose    =  "</span>"
title         =  "^[[:space:]]*\\[[a-zA-Z0-9 ]+\\]"

header        =  "^[[:space:]]*{[a-zA-Z0-9 ]+}"
headerOpen    =  "<span class=\"header\">"
headerClose   =  "</span>"

myfun::String->String->String->String
myfun open close str = op str rep
                        where op = subRegex (mkRegex pat)  
                              rep = open ++ "\\1" ++ close
                              pat = codeOpen ++ "(([^`]*|\n*)*)" ++ codeClose 
                                  where 
                                        codeOpen = "^[[:space:]]*`\\["
                                        codeClose = "[[:space:]]*`\\]$"


myfun2::String->String->[String]->[String]
myfun2 open close list = map(`op` rep) list 
                        where op = subRegex (mkRegex pat)  
                              rep = open ++ "\\1" ++ close
                              pat = codeOpen ++ "(((.*)|\n*)*)" ++ codeClose 
                                  where 
                                        codeOpen = "^[[:space:]]*`\\["
                                        codeClose = "[[:space:]]*`\\]$"


main = do
    print("geneHtml input.txt out.txt")
    [inFile, outFile] <- getArgs
    handle <- openFile inFile ReadMode
    contents <- hGetContents handle

    let line      = lines contents
    
    

    --let r         = mkRegex keyword
    let r_title   = mkRegex title
    let r_header  = mkRegex header
    let r_comment = mkRegex comment

    let list0      = style keyword openSpan closeSpan line
    let list1     = style title titleOpen titleClose list0 
    let list2     = style comment commentOpen commentClose list1
    let list3     = style header headerOpen headerClose list2

    let list4     = replace "^\\s*<.*$" "\\0<br>" list3

    let list5     = myfun "<pre>" "</pre>" (unlines list4):[]
--    let list4     = htmlTab "" "<br>" list3
--    let list5     = replace codeOpen "<pre>" list4
--    let list6     = replace codeClose "</pre>" list5

    writeFile outFile $ html htmlOpen htmlClose list5 
    putStr contents
    hClose handle
    print $ myfun "<pre>" "</pre>"  " `[ String\nkkk `]"

    let myUnlines = unlines line
    print $ myfun "<pre>" "</pre>" myUnlines
