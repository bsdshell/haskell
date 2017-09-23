{-# OPTIONS_GHC -Wall #-}
import System.Process
import System.IO
import System.Environment

f::[String] -> IO () 
f x = case x of 
        [op, a1] -> case op of
                         "grep"-> createProcess (proc "/bin/ls" []){ cwd = Just ".", std_out=CreatePipe } 
                                   >>= \out -> case out of 
                                                 (_,_,Just hout,_) -> hGetContents hout >>= \out -> putStrLn out 
                                                 _                 -> return () 
                         _     -> return () 
        _ -> return () 

main =  do
        argList <- getArgs
        s <- f argList
        print s
        return ()
