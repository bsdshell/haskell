import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex

isEmpty::String->Bool
isEmpty "" = False 
isEmpty _  = True 

htmlOpen = "<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"mycss/style.css\"/></head><body class=\"htmlbg\">"
htmlClose = "</body></html>"
ldiv = "<div class=\"tex\">"
rdiv = "</div>"

openSpan = "<span class=\"keyword\">"
closeSpan = "</span>"

comment = "//.*"
open_comment = "<span class=\"comment\">"
close_comment = "</span>"

keyword = "^[[:space:]]+([[:alnum:]]+)[[:space:]]+|" ++ "[[:space:]](:[[:graph:]]+)[[:space:]]|" ++ comment

open_title = "<span class=\"tit\">"
close_title = "</span>"
title = "\\[[a-zA-Z0-9 ]+\\]"

open_header = "<span class=\"header\">"
close_header = "</span>"
header = "{[a-zA-Z0-9 ]+}"

main = do
    print("readFile input.txt out.txt")
    [inFile, outFile] <- getArgs
    handle <- openFile inFile ReadMode
    contents <- hGetContents handle
    let line = lines contents
    
    let r = mkRegex keyword  
    let r_title = mkRegex title 
    let r_header = mkRegex header 
    let r_comment = mkRegex comment

    let op    = subRegex r
    let pat   = openSpan ++ "\\0" ++ closeSpan
    let list  = map (`op` pat) line

    let op2   = subRegex r_title
    let pat2  = open_title ++ "\\0" ++ close_title
    let list1 = map (`op2` pat2) list

    let list2 = map(++ rdiv) list1
    let list3 = map(ldiv ++) list2

    let op3   = subRegex r_comment
    let pat3  = open_comment ++ "\\0" ++ close_comment
    let list4 = map(`op3` pat3) list3

    let op4   = subRegex r_header
    let pat4  = open_header ++ "\\0" ++ close_header
    let list5 = map (`op4` pat4) list4

    --let list5 = (filter(\a->length(a) > 0) list4) 

    writeFile outFile $  htmlOpen ++ (unlines list5) ++ htmlClose 
    putStr contents
    hClose handle
    print $ isEmpty ""
    print $ isEmpty "kk"
    print $ filter isEmpty ["dog", "", "cat"]
