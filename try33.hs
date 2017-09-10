import System.Process
import Data.Char 
import Control.Monad
import System.IO
import System.Environment
import System.Directory
import AronModule

main =  do
        argList <- getArgs
        (_,_,_,_) <- createProcess (proc "/usr/bin/gzip" [head argList]){ cwd = Just "." }
        print "done!"
