{-# LANGUAGE FlexibleInstances #-}

import Data.Char 
import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import Data.Monoid
import AronModule


instance Monoid (Int, Int) where
    mempty = (0, 0)
    mappend (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)


main = do 
        print "Hello World"

