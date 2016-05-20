import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike

re1 = "my food"         =~ "foo"::Bool
re2 = "my food foo"     =~ "foo"::String
re3 = "my foolish fool" =~ "foo."::[[String]]
re4 = "my foolish fool" =~ "foo."::(String, String, String)

main = do
        --[file=regexExample.html title=""
        let r1 = mkRegex "(dog){1,2}(cat)"
        putStrLn $ subRegex r1 "dogcat"        "1. [\\0]{\\1} "--1. [dogcat]{dog} 

        putStrLn $ subRegex r1 "dogdogcat"     "2. [\\0]{\\1} "--2. [dogdogcat]{dog} 

        putStrLn $ subRegex r1 "dogdogdogcat"  "3. [\\0]{\\1} "--3. [dogdogcat]{dog}

        let r3 = mkRegex "a*(git)"

        putStrLn $ subRegex r3 "aaaagit"       "5. [\\0] {\\1}"--5. [aaaagit] {git} 

        let r4 = mkRegex "(void)+"

        putStrLn $ subRegex r4 "voidvoid"      "6. [\\0] {\\1}"--6. [voidvoid] {void} 

        -- capture group
        let r6 = mkRegex "[a-z]+(git)"

        putStrLn $ subRegex r6 "1git   agit"   "7. [\\0] {\\1}"--7. [agit] {git}

        -- capture phone number
        let p1 = mkRegex "[0-9]{3}[ -]?[0-9]{3}[ -]?[0-9]{4}" 

        putStrLn $ subRegex p1 "416-123-4483"  "8. [\\0]      "--8. [416-123-4483]

        putStrLn $ subRegex p1 "4161234483"    "9. [\\0]      "--9. [4161234483] 

        putStrLn $ subRegex p1 "416 123 4483"  "10. [\\0]     "--10. [416 123 4483]

        -- capture function in ObjectiveC
        let me = mkRegex "(-|\\+)[[:space:]]*\\([[:space:]]*[[:print:]]+[[:space:]]*\\)[[:space:]]*[[:graph:]]+\
        \[[:space:]]*:?[[:space:]]*([[:space:]]*[[:graph:]]+[[:space:]]*:[[:space:]]*[[:graph:]]+[[:space:]]*)*"

        putStrLn $ subRegex me "- (NSstring*) swap :" "11. [\\0]"--11. [- (NSstring*) swap :]

        putStrLn $ subRegex me "- (NSstring*) method:(Integer)num width:(Integer)width\ 
        \ height:(NSString*)str" "12. [\\0]"
        --12. [- (NSstring*) method:(Integer)num width:(Integer)width  height:(NSString*)str]

        -- https://hackage.haskell.org/package/regex-base-0.93.2/docs/Text-Regex-Base-RegexLike.html#t:RegexLike
        let r7 = mkRegex "([A-Za-z]+)" 
        let count = matchCount r7 "haskell java C++ ObejctiveC aa#" 
        putStrLn $ "count = " ++ show count

        -- https://hackage.haskell.org/package/regex-base-0.93.2/docs/Text-Regex-Base-RegexLike.html#t:RegexLike
        let r8 = mkRegex "[a-z]+"
        let bo = matchTest r8 "22323"
        putStrLn $ "Is matched = " ++ show bo   -- return True
        
        let bo = matchTest r8 "Sunnyvale"       
        putStrLn $ "Is matched = " ++ show bo   -- return False

        --]

        putStrLn $ subRegex me "- (void)" "[\\0]"
        putStrLn $ subRegex me "- ( void )" "[\\0]"
        putStrLn $ subRegex me "- ( void *)" "[\\0]"
        putStrLn $ subRegex me "- (Integer)" "[\\0]"
        putStrLn $ subRegex me "- (NSstring*)" "[\\0]"
        putStrLn $ subRegex me "- (NSstring*)  " "[\\0]"
        putStrLn $ subRegex me "- (NSstring*)swap:" "[\\0]"
        putStrLn $ subRegex me "- (NSstring*) swap :" "[\\0]"
        putStrLn $ subRegex me "+ (NSstring*) swap :" "[\\0]"
        putStrLn $ subRegex me "- (NSstring*)swap_do:" "[\\0]"
        putStrLn $ subRegex me "- (NSstring*)swap_d###o :" "[\\0]"
        putStrLn $ subRegex me "- (NSstring*)swap_d###o " "[\\0]"



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
