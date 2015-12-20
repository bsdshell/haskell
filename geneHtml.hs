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
                              pat = codeOpen ++ "(([^`]|`[^[]]*|\n*)*)" ++ codeClose --fix it
                                  where 
                                        codeOpen = "^[[:space:]]*`\\[[[:space:]]*$"
                                        codeClose = "[[:space:]]*`\\][[:space:]]*$"

lt   = "(<)"
gt   = "(>)"

html_lt = "&lt;"
html_gt = "&gt;"

htmlOpen      =  "<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"mycss/style.css\"/></head><body class=\"htmlbg\">"
htmlClose     =  "</body></html>"

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

    let list0     = replace lt html_lt line
    let list1     = replace gt html_gt list0 
    let list2     = style keyword openSpan closeSpan list1 
    let list3     = style title titleOpen titleClose list2 
    let list4     = style comment commentOpen commentClose list3
    let list5     = style header headerOpen headerClose list4
    let list6     = style numName spanNumOpen spanNumCose list5
    let list7     = replace html_tab "\\0<br>" list6
    let list8     = codeHighLight preOpen preClose (unlines list7):[]
    writeFile outFile $ html htmlOpen htmlClose list8 

    putStr contents
    hClose handle
