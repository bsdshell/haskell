import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex

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


-- matches `[ xxx `] e.g replace <pre> xxx </pre>
codeHighLight::String->String->String->String
codeHighLight open close str = op str rep
                        where op = subRegex (mkRegex pat)  
                              rep = open ++ "\\1" ++ close
                              pat = codeOpen ++ "(([^`]*|\n*)*)" ++ codeClose 
                                  where 
                                        codeOpen = "^[[:space:]]*`\\["
                                        codeClose = "[[:space:]]*`\\]$"

htmlOpen      =  "<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"mycss/style.css\"/></head><body class=\"htmlbg\">"
htmlClose     =  "</body></html>"


ldiv          =  "<div class=\"tex\">"
rdiv          =  "</div>"

openSpan      =  "<span class=\"keyword\">"
closeSpan     =  "</span>"

-- e.g. //xxx, // xxx
comment       =  "//.*$"
commentOpen   =  "<span class=\"comment\">"
commentClose  =  "</span>"

-- e.g. :xxx
keyword       =  "^[[:space:]]*(:[[:graph:]]+)[[:space:]]*"

-- e.g. [ xxx ], [xxx]
titleOpen     =  "<span class=\"tit\">"
titleClose    =  "</span>"
title         =  "^[[:space:]]*\\[[a-zA-Z0-9 ]+\\]"

-- e.g. { xxx }, {xxx}
header      = "^[[:space:]]*{[a-zA-Z0-9 ]+}"
headerOpen  = "<span class = \"header\">"
headerClose = "</span>"
preOpen     = "<pre>"
preClose    = "</pre>"

-- e.g. 1. , 2.
numName     = "^[[:space:]]*[0-9]+\\.[[:space:]]+" 
spanNumOpen = "<span class=\"num\">"
spanNumCose = "</span>"

html_tab = "^[[:space:]]*(<[^<>]+>[^<>]*<[[:space:]]*/[^<>]+>.*$)"

main = do
    print("geneHtml input.txt out.txt")
    [inFile, outFile] <- getArgs
    handle <- openFile inFile ReadMode
    contents <- hGetContents handle

    let line      = lines contents

    let r_title   = mkRegex title
    let r_header  = mkRegex header
    let r_comment = mkRegex comment

    let list0     = style keyword openSpan closeSpan line
    let list1     = style title titleOpen titleClose list0 
    let list2     = style comment commentOpen commentClose list1
    let list3     = style header headerOpen headerClose list2
    let list4     = style numName spanNumOpen spanNumCose list3
    --let list5     = replace "^\\s*<.*$" "\\0<br>" list4
    let list5     = replace html_tab "\\0<br>" list4
    let list6     = codeHighLight preOpen preClose (unlines list5):[]
    writeFile outFile $ html htmlOpen htmlClose list6 

    putStr contents
    hClose handle
