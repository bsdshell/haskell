instance Functor Maybe where
fmap f (Maybe a) = Maybe (f a)
fmap f Nothing     = Nothing 
