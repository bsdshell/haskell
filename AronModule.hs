module AronModule where

splitList::[String]->([String], [String])
splitList [] = ([], [])
splitList [x] = ([x], [])
splitList (x:y:xs) = (x:xp, y:yp) where (xp, yp) = splitList xs

