import System.Process
import Data.Char 
import Control.Monad
import System.IO
import System.Environment
import System.Directory
import AronModule

main =  do
        arg <- getArgs
        (_,Just hout, _, h1) <- createProcess (proc "ls" []){ std_out = CreatePipe }
        out <- hGetContents hout
        let ll = lines out
        print ll 
