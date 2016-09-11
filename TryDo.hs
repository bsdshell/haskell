import System.IO
import System.Directory
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Control.Monad 

--[file=moredo.html title="what is do statement in Haskell"
--main = do
--        putStr "dog"
--        putStr "cat\n"

-- alternative
--main = putStr "cat" >> putStr "dog" >> putStr "\n"

countChar::Char->String->Int
countChar c = length.filter(==c) 

countCharInFile::Char->FilePath->IO Int
countCharInFile c f = readFile f >>= \contents-> return (countChar c contents) 
                    
readFileToList::FilePath->IO [String] 
readFileToList f = readFile f >>= \contents -> return (lines contents) 

writeToFile1::FilePath->[String]->IO()
writeToFile1 f list = writeFile f $ unlines list 

--getFile::FilePath->String->IO [String]

main = do
--        let fname = "./file.txt"
--        num <- countCharInFile 'c' fname 
--        print num
--        list <- readFileToList fname
--        print list
--        mapM_ putStrLn list
        --writeToFile "./file1.txt" "side effects"
--        let ll = ["A third of food produced world wild never get eaten", "banada"]
--        writeToFile1 "./file2.txt" list 
        let path = "/Users/cat/try/"
        listFile <- listDirectory path 
        ll <- filterM(\x -> doesFileExist $ path ++ x) listFile 
        let l2 = filter(\x -> matchTest (mkRegex ".*\\.txt$") x ) ll 
        mapM print l2

-- main = putStrLn "Hello, what is your name?" >> getLine >>= \name -> putStrLn ("Hello, " ++ name ++ "!")

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
