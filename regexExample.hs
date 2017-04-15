import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import AronModule

--[file=regexExample.html title=""

re1 = "my food"         =~ "foo"::Bool                      -- True
re2 = "my food foo"     =~ "foo"::String                    -- "foo"
re3 = "my foolish fool" =~ "foo."::[[String]]               -- [["fool"],["fool"]]
re4 = "my foolish fool" =~ "foo."::(String, String, String) -- ("my ","fool","ish fool")

main = do
        -- /Users/cat/myfile/github/haskell/regexExample.hs 
        -- 
        -- replace pattern 
        --
        -- pattern = mkRegex "pattern"
        --
        -- subRegex pattern inputString replaceString => output text 
        --
        -- 
        -- gx http://hackage.haskell.org/package/regex-compat-0.95.1/docs/Text-Regex.html#t:Regex
        -- 
        let r1 = mkRegex "google"
        let input = "http://google.com"
        let replacement = "[yahoo]"
        putStrLn $ subRegex r1 input replacement            -- http://[google].com

        let r3 = mkRegex "(na)*"
        putStrLn $ subRegex r3 "banana" "[\\0] {\\1}"    -- [] {}b5. [] {}a5. [nana] {na}

        let r4 = mkRegex "(void)+"
        putStrLn $ subRegex r4 "voidvoid" "[\\0] {\\1}"  -- [voidvoid] {void}

                                                         -- use POSIX regex  "/pat/i" ignore case
        let r5 = mkRegex ".*\\.pdf"
        putStrLn $ subRegex r5 "http://file.pdf" "[\\0]" -- [http://file.PDF]

        -- capture group, capture email address
        let r6 = mkRegex "([A-Za-z._-]+)+@(([a-z])+\\.([a-z]{2,4}))"
        putStrLn $ subRegex r6 "root_admin.last-name@gmail.com"   "7. [\\0] {\\1}{\\2}"

        -- capture phone number
        let p1 = mkRegex "[0-9]{3}[ -]?[0-9]{3}[ -]?[0-9]{4}" 

        -- gx https://hackage.haskell.org/package/regex-compat-0.95.1/docs/Text-Regex.html
        let r7 = mkRegexWithOpts "(\\.pdf)" True False
        let input = "/home/user/file/mybook.PDF"
        let callMeMaybe = matchRegex r7 input
        print $ show(callMeMaybe)

        -- replace string
        putStrLn $ subRegex p1 "416-123-4483"  "[\\0]"    -- [416-123-4483]

        putStrLn $ subRegex p1 "4161234483"    "[\\0]"    -- [4161234483]

        putStrLn $ subRegex p1 "416 123 4483"  "[\\0]"    -- [416 123 4483]
        
        print $ splitRegex(mkRegex ":") "PaloAlto:MountainView" -- ["PaloAlto","MountainView"]

        -- capture function in ObjectiveC
        let me = mkRegex "(-|\\+)[[:space:]]*\\([[:space:]]*[[:print:]]+[[:space:]]*\\)[[:space:]]*[[:graph:]]+\
        \[[:space:]]*:?[[:space:]]*([[:space:]]*[[:graph:]]+[[:space:]]*:[[:space:]]*[[:graph:]]+[[:space:]]*)*"

        putStrLn $ subRegex me "- (NSstring*) swap :" "[\\0]" -- [- (NSstring*) swap :]

        putStrLn $ subRegex me "- (NSstring*) method:(Integer)num width:(Integer)width\ 
        \ height:(NSString*)str" "12. [\\0]"
        -- [- (NSstring*) method:(Integer)num width:(Integer)width  height:(NSString*)str]

        -- https://hackage.haskell.org/package/regex-base-0.93.2/docs/Text-Regex-Base-RegexLike.html#t:RegexLike
        let r7 = mkRegex "([A-Za-z]+)" 
        let count = matchCount r7 "haskell java C++ ObejctiveC aa#" 
        putStrLn $ "count = " ++ show count

        -- https://hackage.haskell.org/package/regex-base-0.93.2/docs/Text-Regex-Base-RegexLike.html#t:RegexLike
        let r8 = mkRegex "[a-z]+"
        let bo = matchTest r8 "22323"
        putStrLn $ "Is matched = " ++ show bo -- return True
        
        let bo = matchTest r8 "Sunnyvale"
        putStrLn $ "Is matched = " ++ show bo -- return False

--        let cvs1 = matchTest cvspat "\"with white space\""
--        putStrLn $ "match cvs=[" ++ show cvs1 ++ "]" 

        let cvspat = mkRegex "\\(\"[a-z]+\\)|\\([0-9]+\"\\)"
        putStrLn $ "cvs=[" ++ subRegex cvspat "\"with white space\",123"   "[\\0]-[\\1]-[\\2]"

        let (_, _, _, [year, month, day]) ="2013/01/06" =~ "([0-9]+)/([0-9]*)/([0-9]*)" :: (String,String,String,[String])
        putStrLn year
        putStrLn month 
        putStrLn day 

        fl
        let ll = "\"dogcat\" 123 \"essential\" \"about me\"" =~ "(\"[^\"]+\")|([0-9]+)" :: [[String]]
        print ll
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
