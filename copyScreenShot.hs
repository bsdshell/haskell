import System.IO
import System.Directory
import Data.List
import Text.Regex.Posix
import Text.Regex

desktopdir = "/Users/cat/Desktop/"
screendir = "/Users/cat/myfile/screenshots/"
--desktopdir = "/tmp/t1/"
--screendir = "/tmp/t2/"

doit::String->Bool
doit str = if str == "y" then True else False

main = do
    print $ "Copy png files[" ++ desktopdir ++ "] to [" ++ screendir ++ "]" 
    _file <- getDirectoryContents desktopdir 
    print _file
    let pngfile = filter (=~ "[[:graph:] ]*\\.png") _file 
    let fullDesk = map(desktopdir ++) pngfile
    let fullScreen = map(screendir ++) pngfile
    let tuple = zip fullDesk fullScreen
    print tuple

    -- mapM_::Monad m => (a -> m b) -> [a]-> m()
    -- uncurry::(a->b->c) -> (a, b) -> c
    -- removeFile::filePath -> IO()
    -- copyFile::filePath -> IO()
    mapM_(uncurry copyFile) $ zip fullDesk fullScreen 
    print $ "Remove all png files from: " ++ desktopdir
    mapM_(removeFile) fullDesk 
