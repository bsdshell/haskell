{-# OPTIONS_GHC -Wall #-}
{-# LANGUAGE OverloadedStrings #-}
import System.Process
import System.Process.Typed
import System.IO

main =  do
        createProcess(shell "ls")

