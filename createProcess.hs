{-# OPTIONS_GHC -Wall #-}
import System.Process
import System.IO

main =  do
        test <- readProcess "/usr/bin/grep" ["-Hnis"] "String"
        print test 
        return ()

