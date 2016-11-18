import AronModule 

--[file=record.html title=""
-- /Users/cat/myfile/github/haskell/Record.hs
-- ref: http://learnyouahaskell.com/making-our-own-types-and-typeclasses 
-- -------------------------------------------------------------------------------- 
-- 1. how to create record
-- 2. how to access field from typeclass, e.g. person.lastName in java
-- 3. how to override == without doing anything with deriving(Eq)
-- -------------------------------------------------------------------------------- 
data Person = Person {firstName::String, lastName::String, age::Int} deriving (Eq)

-- Person derives from Eq, Haskell generates (==) and (/=) for us automatically,
-- the catch is String and Int also have to be part of (Eq) typeclass 
-- access field from typeclass with record
showPerson::Person->String
showPerson Person{firstName = firstName, lastName = lastName, age = age} 
                        = "[" ++ firstName ++ " " ++ lastName ++ " " ++ show(age) ++ "]"

main = do 
        let person = Person{firstName = "Jonathan", lastName = "Michell", age = 20}
        let animal = Person{firstName = "Nonhuman", lastName = "Michell", age = 20}
        print $ showPerson person
        print $ showPerson (Person "Steven" "Jobs" 30)
        print $ person == person  -- True
        print $ person == animal  -- False 
        print $ person /= animal  -- True 
        fl
        -- person.firstName in java
        print $ "firstName=" ++ firstName person  -- Jonathan
        print $ "lastName =" ++ lastName person   -- Michell 
        print $ "age      =" ++ show(age person)  -- 20 
--]
