import System.Environment 
import System.Console.GetOpt

fileName = "output.txt" 
inputFile = "input.txt"
main = do
    args <- getArgs
    case args of
        [file] -> do
            x <- readFile file
            putStr file1
            putStr x
        _ -> putStrLn "Wrong number of arguments"

    --handle <- openFile inputFile ReadMode
    --contents <- hGetContents handle
    --let list1 = map(++ closeSpan) contents
    --let list2 = map(openSpan ++) list1
    --case args of
        --[file] -> do
            --x <- readFile file
            --putStr x
        --_ -> putStrLn "Wrong number of arguments"
