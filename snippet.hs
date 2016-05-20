import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import AronModule
import Data.List.Split
import qualified Data.Text as Text


printLn::String->String
printLn "" = "\n"
printLn s  = s ++ "\n"

mystrip::String->String
mystrip s  = Text.unpack(Text.strip (Text.pack s ))

main = do
    --[inFile, outFile] <- getArgs
    let inFile  = "/Users/cat/myfile/github/snippets/snippet.m" 
    let outFile = "/Users/cat/myfile/github/snippets/snippet.vimrc" 
    handle <- openFile inFile ReadMode
    contents <- hGetContents handle
    let line = lines contents
    -- mapM putStr line 
    let list = filter(\x -> length x > 0) line
    -- mapM putStr list 
    let list2 = splitWhen(\x -> (length $ trimWS x) == 0) line
    putStrLn "list2 ============================"
    mapM_ (print) list2
    putStrLn "listHead ============================"
--    let listHead = map(\x-> Text.unpack(Text.strip (Text.pack $ head x))) $ init list2
    let listHead = map(\x-> " " ++ mystrip ( (head x)) ++ " ") $ list2
    mapM(print) listHead
    let listTail =  map(\x -> tail x) $ list2 

    putStrLn "splitList ============================"
    let splitList = map(map(mystrip)) $ map(splitRegex(mkRegex ":")) listHead
    mapM(print) splitList 
    putStrLn "===================================="

    putStrLn "listTail ==========================="
    mapM(print) listTail 
    putStrLn "listCR===================================="
    let listCR =  map(map(\x -> "\\<CR>"++ mystrip x)) $ map(\x-> tail x) $ list2
    mapM(mapM(print)) listCR 
    putStrLn "===================================="
    let listLeft =  map(\x-> "" ++ (head x) ) listCR 
    let listRight =  map(\x-> (last x) ++""  ) listCR 

    putStrLn "listLeft===================================="
    mapM(print) listLeft 
    putStrLn "===================================="
    putStrLn "listRight===================================="
    mapM(print) listRight 
    putStrLn "===================================="

    -- let newfull = map(map(++"\n")) full
    let newfull = map(map(++"\n")) listCR 
    mapM(print) newfull 
    putStrLn "===================================="

    let auto  = "autocmd BufEnter *.vimrc,*.tex,*.java,*.h,*.m iabbr <buffer> "
    --let comList = map(\x -> "autocmd BufEnter " ++ tail x ++ " iabbr <buffer> " ++ head x ++ " \n") splitList
    let comList = map(\x -> "autocmd BufEnter " ++ last(x) ++ " iabbr <buffer> " ++ head(x) ++ " \n" ) splitList
    mapM(print) comList 
    --let comList = map(\x -> auto++ x ++ "\n") listHead 
    putStrLn "comList ================================="

    mapM(print) comList 
    putStrLn "comList2 ===================================="
    let comList2 = map(\x -> x:[]) comList
    mapM(print) comList2
    putStrLn "===================================="
    --mapM putStr list2 

    -- let l = map length lines 
    let codeList = map(foldr(\x y -> x ++ y) "\n") newfull 
    putStrLn "codeList ================================="
    mapM(print)codeList 
    putStrLn "=========================================="
    let autoCode = zipWith(\x y -> x ++ y) comList codeList
    putStrLn "autoCode================================="
    mapM(print) autoCode
    putStrLn "=========================================="

    let str = foldl (\x y -> x ++ y) "" $  autoCode 
    writeFile outFile $ str  


        --putStr contents
    hClose handle
