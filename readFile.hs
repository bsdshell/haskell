import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex

htmlOpen = "<html><body style=\"background:#000000;color:#FFFFFF;\">"
htmlClose = "</body></html>"
ldiv = "<div style=\"margin:auto;width:80%;padding:3px;\">"
rdiv = "</div>"

openSpan = "<span style=\"color:red;\">"
closeSpan = "</span>"

comment = "//.*"
open_comment = "<span style=\"color:green;\">"
close_comment = "</span>"

keyword = "^[[:space:]]+([[:alnum:]]+)[[:space:]]+|" ++ "[[:space:]](:[[:alnum:]]+)[[:space:]]|" ++ comment

open_title = "<span style=\"color:#FFEB3B;\">"
close_title = "</span>"
title = "\\[[a-zA-Z0-9 ]+\\]"

main = do
    print("readFile input.txt out.txt")
    [inFile, outFile] <- getArgs
    handle <- openFile inFile ReadMode
    contents <- hGetContents handle
    let line = lines contents

    let r = mkRegex keyword  
    let r_title = mkRegex title 
    let r_comment = mkRegex comment

    
    let op = subRegex r
    let pat = openSpan ++ "\\0" ++ closeSpan
    let list = map (`op` pat) line 

    let op2 = subRegex r_title
    let pat2 = open_title ++ "\\0" ++ close_title 
    let list1 = map (`op2` pat2) list 

    let list2 = map(++ rdiv) list1 
    let list3 = map(ldiv ++) list2 

    let op3 = subRegex r_comment
    let pat3 = open_comment ++ "\\0" ++ close_comment
    let list4 = map(`op3` pat3) list3


    writeFile outFile $  htmlOpen ++ (unlines list4) ++ htmlClose 
    putStr contents
    hClose handle
     
    
