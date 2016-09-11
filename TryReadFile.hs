import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex


--[file=whatisdo.html title="what is do statement in Haskell"
nameDo::IO String
nameDo = do putStr "What is your first name: "
            first <- getLine
            putStr "What is your last name: "
            last  <- getLine
            let full = first ++ " " ++ last
            putStrLn("full name " ++ full ++ " ")
            return full

main = nameDo >>= \name -> print name

-- alternative
main = do
    name <- nameDo
    print name

--]

--main = getArgs >= \[inFile, outFile] ->hGetContents handle >= \contents

--    [inFile, outFile] <- getArgs
--    handle <- openFile inFile ReadMode
--    contents <- hGetContents handle
--    let line = lines contents
--    print line
--
--    writeFile outFile contents 
--    putStr contents
--    hClose handle
