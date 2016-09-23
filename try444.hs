import Data.Char 

data MyMaybe a = MNothing | MyJust Int a deriving(Show)

instance Functor MyMaybe where
    fmap f MNothing = MNothing
    fmap f (MyJust counter a) = MyJust (counter + 1)  (f a) 

main = do 
        print "Hello World"
        print $ fmap (+1) MNothing
        print $ fmap (+1) (MyJust 0 2) 
        print $ fmap (+1) $ fmap (+1) (MyJust 0 2) 
        print $ fmap id (MyJust 0 2)
        print $ id (MyJust 0 2)
        -- fmap id (MyJust 0 2) != id (MyJust 0 2)
        -- MyMaybe is not a Functor
