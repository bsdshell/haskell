import System.Process
import Data.Char 
import Control.Monad
import System.IO
import System.Environment
import System.Directory
import AronModule

main =  do
        print "cmd zip f.x -> f.x.zip"
        print "cmd uzip f.x.zip -> f.x"
        print "zip -r dir.zip bigdir"
        print "unzip dir.zip"
        --argList <- getArgs
        arg <- getArgs
        case arg of
            [op, a1] -> do
                case op of
                    "uzip" -> do
                            (_,Just hout, _, h1) <- createProcess (proc "/usr/bin/unzip" [a1]){ cwd = Just "." }
                            fl
                    "gz"  -> do 
                            (_,Just hout, _, h1) <- createProcess (proc "/usr/bin/gzip" [a1]){ cwd = Just "." }
                            fl
                    "ugz" -> do 
                            (_,Just hout, _, h1) <- createProcess (proc "/usr/bin/gunzip" [a1]){ cwd = Just "." }
                            fl
                    _     -> do 
                    fl
            _       -> do 
            fl
        print "done!"
