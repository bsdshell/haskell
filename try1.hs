import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import AronModule
import Data.List.Split
import qualified Data.Text as Text



main = do
    let list2 = [["a", "b", "c"], ["1", "2"], []]
    let list3 = init list2
    mapM(print) list3 
    let list4 = map(\x -> tail x) $ list3
    putStrLn("list4-----------------------")
    mapM(print) list4 
    putStrLn("------------------------")
    let listTail =  map(\x-> tail x) $ init list2
    mapM_(mapM_(\x -> print $ "[" ++ x ++ "]")) listTail

    putStrLn("listTail-----------------------")
    mapM(print) listTail 
    putStrLn("listTail-----------------------")
