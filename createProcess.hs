import System.Process
import Data.Char 
import Control.Monad
import System.IO
import System.Environment
import System.Directory
import AronModule

act::String -> IO () 
act x = print x

f x = case x of 
            [op, a1, a2] -> do
                case op of
                     "zip" -> act >>= \x -> print x 
                     _ ->  print "nothing" 
            _ -> print "noting2" 
main =  do
        argList <- getArgs
        s <- f argList
        print s
        return ()
