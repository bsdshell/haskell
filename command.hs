import System.Process
import Data.Char 
import Control.Monad
import System.IO
import System.Environment
import System.Directory
import AronModule

main =  do
        getArgs >>= \arg -> case arg of 
                                [op,a1] -> case op of
                                                "zip" -> createProcess (proc "/usr/bin/zip" ["-r", (a1 ++ ".zip"), a1]){ cwd = Just "." } >>= \x  -> case x of
                                                                                                                                                    (_,Just hout,_,_) -> hGetContents hout >>= print 
                                                                                                                                                    _ -> return ()
                                                "uzip" -> createProcess (proc "/usr/bin/unzip" [a1]){ cwd = Just "." } >>= \x -> case x of
                                                                                                                                 (_,Just hout,_,_) -> hGetContents hout >>= print 
                                                                                                                                 _ -> return ()
                                                _ -> putStrLn ("Invalid Op " ++ arg) 
                                [op,a1,a2] -> case op of 
                                                   "zip" -> createProcess (proc "/usr/bin/zip" ["-r", a1, a2]){ cwd = Just "." } >>= \x  -> case x of
                                                                                                                                        (_,Just hout,_,_) -> hGetContents hout >>= print 
                                                                                                                                        _ -> return ()
                                                   _ -> print "invalid option"     

                                _ -> return () 
