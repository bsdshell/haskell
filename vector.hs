import Data.Char 
import System.IO
import System.Environment
import System.Directory
import Data.List 
import qualified Data.Vector as Vec 
import AronModule

-- vector example, dot product 
main = do 
        print "Hello World"
--        let v1 = Vec.fromList[1..2]
--        let v2 = Vec.fromList[2..3]
--        let d = dot v1 v2 
        let vv = dot [1..2] [1, 4.0004]
        print vv 


