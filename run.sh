#!/bin/bash
echo "runhaskell geneHtml.hs /Library/WebServer/Documents/tiny3/currindex.html /Library/WebServer/Documents/tiny3/index.html"
cd $g/haskell
runhaskell geneHtml.hs /Library/WebServer/Documents/tiny3/currindex.html /Library/WebServer/Documents/tiny3/index.html
echo "----------------------------------------"
echo "generate html from currindex.html to index.html in [$w/tiny3]"
echo "run.sh is in [$g/haskell/run.sh]"
echo "Haskell code is [$g/haskell/geneHtml.hs]"
echo "[$w/tiny3/currindex.html] -> [$w/tiny3/index.html]"
echo "----------------------------------------"
echo "$g/haskell"
