module Main where

import System.IO

fileName = "output.txt" 

main = do
    putStrLn "overwrite/append output.txt"
    writeFile  fileName ['a'..'z']
    appendFile fileName "Append stuff\n"
