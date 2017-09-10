import System.Process
import Data.Char 
import Control.Monad
import System.IO
import System.Environment
import System.Directory
import AronModule

main =  do
        argList <- getArgs
        case argList of 
            [op] -> do{
                print "one arg"
            }
            [op, a1, a2] -> do{
                case op of
                    "zip" -> do {
                            (_,Just hout, _, h1) <- createProcess (proc "/usr/bin/zip" ["-r", a1, a2]){ cwd = Just "." };
                            out <- hGetContents hout;
                            print out
                    }
                    _ -> return ()
            }
            [op, a1] -> do{
                print "cat"
--                    case op of
--                        "zip" -> createProcess(proc "/usr/bin/zip" ["-r", a1]) >>= \(_, Just hout, _, h1) -> print hout
--                        "gz" -> createProcess(proc "/usr/bin/gzip" [a1]) >>= \(_, Just hout, _, h1) -> print hout
--                        _ -> return ()
            }
            _ -> print "move existing file to different directory" 
        print "find out which module a function belongs to"
