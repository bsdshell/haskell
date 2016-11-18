import Data.Char 

data MyMaybe a = MNothing | MyJust Int a deriving(Show)

instance Functor MyMaybe where
    fmap f MNothing = MNothing
    fmap f (MyJust counter a) = MyJust (counter + 1)  (f a) 


data MyFoo = MyFoo{int::Integer, str::String}
instance Eq MyFoo where 
    (MyFoo int1 str1) == (MyFoo int2 str2) = (int1 == int2) && (str1 == str2)

main = do 
        print "Hello World"
        print $ fmap (+1) MNothing
        print $ fmap (+1) (MyJust 0 2) 
        print $ fmap (+1) $ fmap (+1) (MyJust 0 2) 
        print $ fmap id (MyJust 0 2)
        print $ id (MyJust 0 2)
        let foo1 = MyFoo 3 "3"
        let foo2 = MyFoo 3 "3"
        print $ foo1 == foo2

        -- fmap id (MyJust 0 2) != id (MyJust 0 2)
        -- MyMaybe is not a Functor
