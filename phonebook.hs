import qualified Data.Map as Map

phoneBook = Map.fromList [(1234, "Erik"), (5678, "Patrik")]

preList::[String]->[[String]]
preList [] = [[]]
preList x = f x :[] 
        where
            f = take (n + 1) 
            d = drop n
            n = 2 
main = do
    print phoneBook
    print $ Map.lookup 1234 phoneBook
    print $ (Map.empty :: Map.Map Int Int)
    print $ Map.singleton 3 5
    print $ Map.insert 1 "abc" Map.empty
    print $ Map.null phoneBook
    print $ Map.size phoneBook
    print $ Map.toList phoneBook
    print $ Map.keys phoneBook
    print $ Map.elems phoneBook
    print $ preList ["a", "b", "c"]
