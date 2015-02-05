--import System.IO

countLine::String->String
countLine str=(show(length(lines str)))

main = do
    theInput<-readFile "first.hs"
    putStrLn(length(lines(theInput)))
