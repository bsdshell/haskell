import System.Process
import Data.Char 
import Control.Monad
import System.IO
import System.Environment
import System.Directory
import AronModule

comp      x = case x of
                "zip" -> "/usr/bin/zip"
                "uzip" -> "/usr/bin/unzip"
                "gz" -> "/usr/bin/gz"
                "ugz" -> "/usr/bin/gungz"
                _ -> ""

main =  do
        arg <- getArgs
        case arg of
            [op, a1] -> do {
                case op of
                    "zip" -> do {
                            (_,Just hout, _, h1) <- createProcess (proc (comp "zip") [a1]){ cwd = Just "." };
                            out <- hGetContents hout;
                            print out
                    }
                    _ -> return ()
            }
            [op, a1, a2] -> do {
                case op of
                    "zip" -> do {
                            (_,Just hout, _, h1) <- createProcess (proc (comp "zip") ["-r", a1, a2]){ cwd = Just "." };
                            out <- hGetContents hout;
                            print out
                    }
                    "uzip" -> do {
                            (_,Just hout, _, h1) <- createProcess (proc (comp "uzip")[a1]){ cwd = Just "." };
                            out <- hGetContents hout;
                            print out
                    }
                    "gz"  -> do {
                            (_,Just hout, _, h1) <- createProcess (proc (comp "gz") [a1]){ cwd = Just "." };
                            out <- hGetContents hout;
                            print out
                    }
                    "ugz" -> do {
                            (_,Just hout, _, h1) <- createProcess (proc (comp "ugz") [a1]){ cwd = Just "." };
                            out <- hGetContents hout;
                            print out
                    }
                    _ -> return () 
            }
            _ -> return () 
        print "end!"
