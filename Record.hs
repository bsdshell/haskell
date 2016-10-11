import Data.Char 
import AronModule 

--[file=record.html title=""
-- /Users/cat/myfile/github/haskell/Record.hs
-- ref: http://learnyouahaskell.com/making-our-own-types-and-typeclasses 
-- create record
-- -------------------------------------------------------------------------------- 
data Person = Person {first::String, lastName::String, age::Int, email::String} deriving (Eq)

-- Person derives from Eq, Haskell generates (==) and (/=) for us automatically,
-- the catch is String and Int also have to be part of (Eq) typeclass 
showPerson::Person->String
showPerson Person{first = first, lastName = lastName, age = age, email = email} 
                        = "[" ++ first ++ " " ++ lastName ++ " " ++ show(age) ++ " " ++ email ++ "]"

main = do 
        let person = Person{first = "Jonathan", lastName = "Michell", age = 20, email="michell@gmail.com"}
        let animal = Person{first = "Nonhuman", lastName = "Michell", age = 20, email="michell@gmail.com"}
        print $ showPerson person
        print $ showPerson (Person "Steven" "Jobs" 30 "jobs@apple.com")
        print $ person == person  -- True
        print $ person == animal  -- False 
        print $ person /= animal  -- True 
--]
