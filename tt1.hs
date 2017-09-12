{-# OPTIONS_GHC -Wall #-}
import System.Process
import System.IO
import System.Environment

f::[String] -> IO()
f x = case x of 
        [op, a1] -> case op of
                         "zip" -> createProcess (proc "/usr/bin/zip"    ["-r", (a1 ++ ".zip"), a1]){ cwd = Just "." } >>= \_ -> return () 
                         "gz"  -> createProcess (proc "/usr/bin/gzip"   [a1]){ cwd = Just "." } >>= \_ -> return () 
                         "tar" -> createProcess (proc "/usr/bin/tar"    ["-czvf", (a1 ++ ".tar.gz"), a1]){ cwd = Just "." } >>= \_ -> return () 
                         "utar"-> createProcess (proc "/usr/bin/tar"    ["-xzvf", a1]){ cwd = Just "." } >>= \_ -> return () 
                         "uzip"-> createProcess (proc "/usr/bin/unzip"  [a1]){ cwd = Just "." } >>= \_ -> return () 
                         "ugz" -> createProcess (proc "/usr/bin/gunzip" [a1]){ cwd = Just "." } >>= \_ -> return () 
                         "grep"-> createProcess (proc "/usr/bin/grep" ["-Hnris", "--color", "--include=\"*.hs\"", a1]){ cwd = Just "." } 
                                   >>= \(_, Just hout,_,_) -> hGetContents hout 
                                   >>= \out -> print out
                         _     -> return () 
        [op, a1, a2] -> do
            case op of
                 "zip" -> createProcess (proc "/usr/bin/zip" ["-r", a1, a2]){ cwd = Just "." } >>= \_ -> return () 
                 "grep" -> do
                           (_,Just hout,_,_) <- createProcess (proc "/usr/bin/grep" ["--color", "--include=\"*.hs\"", "-Hnris", a1]){ cwd = Just "." } 
                           out <- hGetContents hout
                           print out
                           return () 
                 _     -> print "empty op"
        _ -> return ()

main =  do
        argList <- getArgs
        s <- f argList
        print s
        return ()
