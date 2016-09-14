import qualified Data.Set as Set

--set = Set.fromList "erik salaj"
set = Set.fromList ["dog", "cat", "dog"] 

main = do
    print set
    print $ Set.null set
    print $ Set.size set
    print $ Set.insert "y" set
    print $ Set.member "a" set
    print $ Set.member "k" set
