import System.Process
import Data.Char 
import Control.Monad
import System.IO
import System.Environment
import System.Directory
import AronModule

main =  do
        argList <- getArgs
        let len = length argList
        case len of 
            1 -> do
                (_,Just hout, _, h1) <- createProcess (proc "ls" []){ std_out = CreatePipe }
                out <- hGetContents hout
                print $ lines out 
            _ -> print "nothing" 
