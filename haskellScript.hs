import System.Process
import Data.Char 
import Control.Monad
import System.IO
import System.Environment
import System.Directory
import AronModule

main =  do
        arg <- getArgs
        case arg of
            [op, a1] -> do {
                case op of
                    "zip" -> do {
                            (_,Just hout, _, h1) <- createProcess (proc "/usr/bin/unzip" [a1]){ cwd = Just "." };
                            out <- hGetContents hout;
                            print out
                    }
                    _ -> return ()
            }
            [op, a1, a2] -> do {
                case op of
                    "zip" -> do {
                            (_,Just hout, _, h1) <- createProcess (proc "/usr/bin/unzip" [a1]){ cwd = Just "." };
                            out <- hGetContents hout;
                            print out
                    }
                    "uzip" -> do {
                            (_,Just hout, _, h1) <- createProcess (proc "/usr/bin/unzip" [a1]){ cwd = Just "." };
                            out <- hGetContents hout;
                            print out
                    }
                    "gz"  -> do {
                            (_,Just hout, _, h1) <- createProcess (proc "/usr/bin/gzip" [a1]){ cwd = Just "." };
                            out <- hGetContents hout;
                            print out
                    }
                    "ugz" -> do {
                            (_,Just hout, _, h1) <- createProcess (proc "/usr/bin/gunzip" [a1]){ cwd = Just "." };
                            out <- hGetContents hout;
                            print out
                    }
                    _ -> return () 
            }
            _ -> return () 
        print "end!"
