import AronModule
import Control.Monad
import Data.Char 
import System.Directory
import System.Environment
import System.IO
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import Text.Regex.Posix

import Control.Monad
import System.Directory
import System.FilePath
import System.Posix.Files


pre::FilePath -> Bool
pre f = matchTest reg f 
                where
                    reg = mkRegex "\\*" 

jpgFile::FilePath->Bool
jpgFile f = matchTest reg $ takeFileName f
                where
                    reg = mkRegex "[a-zA-Z0-9_]+\\.jpg"

-- gx http://stackoverflow.com/questions/13297896/is-there-some-directory-walker-in-haskell
-- | Traverse from 'top' directory and return all the files by
-- filtering out the 'exclude' predicate.
-- there is issue with getDirectoryContents in the orginal code
-- fix with listDirectory
traverseDir :: FilePath -> (FilePath -> Bool) -> IO [FilePath]
traverseDir top predict = do
  ds <- listDirectory top
  paths <- forM (filter (not.predict) ds) $ \d -> do
    let path = top </> d
    s <- getFileStatus path
    if isDirectory s
      then traverseDir path predict
      else return [path]
  return (concat paths)

htmlDir = "/Users/cat/try"

main = do 
        print "Hello World"
        allFiles <- traverseDir htmlDir jpgFile 
        mapM print allFiles
