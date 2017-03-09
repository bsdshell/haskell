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

-- replace | => \| => '|' is special char in Vimrc file
sub = \x -> subRegex (mkRegex "\\|") x "\\\\\\0"

main = do
    let inFile_snippet  = "/Users/cat/myfile/github/snippets/snippet.m" 
    let inFile_secret  = "/Users/cat/myfile/private/secret.m" 
    let outFile = "/Users/cat/myfile/private/secret.vimrc" 

    line_snippet <- readFileToList inFile_snippet
    line_secret <- readFileToList inFile_secret

--    let line = lines contents
    let line = line_snippet ++ line_secret 
    fl
    mapM_ (print) line 
    fl
    let list = filter(\x -> length x > 0) line

    let list2 = filter(\x-> length x > 0) $ splitWhen(\x -> (length $ trimWS x) == 0) line
    fl
    mapM_ (print) list2
    fl
    let listHead = map(\x-> " " ++ trim( (head x)) ++ " ") $ list2
--    let listHead = map(\x-> " " ++ trimWS( (head x)) ++ " ") $ list2
    mapM(print) listHead

    fl
    let splitListThree = map(map(trim)) $ map(splitRegex(mkRegex ":")) listHead
    mapM(print) splitListThree

    let splitList = map(\x -> take 2 x) splitListThree 
    mapM(print) splitList 
    fl

--    let listCR =  map(map(\x -> "\\<CR>"++ trim x)) $ map(\x-> tail x) $ list2
    let listCR =  map(map(\x -> "\\<CR>"++ (sub $ trim x))) $ map(\x-> tail x) $ list2
    mapM(mapM(print)) listCR 
    fl
    let listLeft =  map(\x-> "" ++ (head x) ) listCR 
    let listRight =  map(\x-> (last x) ++""  ) listCR 
    fl
    mapM(print) listLeft 
    fl
    mapM(print) listRight 
    fl

    let newfull = map(map(++"\n")) listCR 
    mapM(print) newfull 
    fl

    let auto  = "autocmd BufEnter *.vimrc,*.tex,*.java,*.h,*.m iabbr <buffer> "
    let comList = map(\x -> "autocmd BufEnter " ++ last(x) ++ " iabbr <buffer> " ++ head(x) ++ " \n" ) splitList
    mapM(print) comList 
    fl

    mapM(print) comList 
    fl
    let comList2 = map(\x -> x:[]) comList
    mapM(print) comList2
    fl

    let codeList = map(foldr(\x y -> x ++ y) "\n") newfull 
    fl
    mapM(print)codeList 
    fl
    let autoCode = zipWith(\x y -> x ++ y) comList codeList
    fl
    mapM(print) autoCode
    fl
    let str = foldl (\x y -> x ++ y) "" $  autoCode 
    writeFile outFile $ str  
