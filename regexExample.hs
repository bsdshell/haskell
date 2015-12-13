import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base

re1 = "my food"         =~ "foo"::Bool
re2 = "my food foo"     =~ "foo"::String
re3 = "my foolish fool" =~ "foo."::[[String]]
re4 = "my foolish fool" =~ "foo."::(String, String, String)

main = do
        let r1 = mkRegex "a{1,3}(git)"
        putStrLn $ subRegex r1 "aagit  kgit"  "[\\0]{\\1} " 

        let r2 = mkRegex "(git)"
        putStrLn $ subRegex r2 "this is git"  "[\\0] {\\1} " 

        let r3 = mkRegex "a*(git)"
        putStrLn $ subRegex r3 "aaaagit"  "[\\0] {\\1} " 

        let r4 = mkRegex "a+(git)"
        putStrLn $ subRegex r4 "git   aagit"  "[\\0] {\\1} " 

        let r5 = mkRegex "a{2,3}(git)"
        putStrLn $ subRegex r5 "agit   aagit  aaagit"  "[\\0] {\\1} " 

        let r6 = mkRegex "[a-z]+(git)"
        putStrLn $ subRegex r6 "1git   agit"  "[\\0] {\\1}" 



        print re1 
        print re2 
        print re3 
        print re4 

--        [aagit]{git}   kgit
--        this is [git] {git} 
--        [aaaagit] {git} 
--        git   [aagit] {git} 
--        agit   [aagit] {git}   [aaagit] {git} 
--        1git   [agit] {git}
--        True
--        "foo"
--        [["fool"],["fool"]]
--        ("my ","fool","ish fool")
