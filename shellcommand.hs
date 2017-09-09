module Main where

import System.Process

main::IO()
-- run shell command, process, processor, processing
main = system "ls -la" >>= \exitCode -> print exitCode
     

