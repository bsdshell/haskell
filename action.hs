import System.Random

-- do block and action IO
printPrompt::String->IO String
printPrompt prompt = do
            putStr prompt
            getLine

main::IO()
main = do
       line1 <- printPrompt "Enter a line: "
       line2 <- printPrompt "And another: "
       putStrLn ("You said: " ++ line1 ++ " and " ++ "line2")
