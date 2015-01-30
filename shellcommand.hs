module Main where

import System.Process

main::IO()
main = system "ls -la" >>= \exitCode -> print exitCode
     

