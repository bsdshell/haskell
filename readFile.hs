module Main where

import System.IO

main = do
    theInput<-readFile "first.hs"
    putStrLn(countLine theInput)

countLine::String->String
countLine str=(show(length(lines str)))
