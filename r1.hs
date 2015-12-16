import System.IO
import System.Environment
import Text.Regex.Posix
import Text.Regex

style::String->String->String->[String]->[String]
style pat l r list = map(`op` rep) list 
                        where op = subRegex $ mkRegex pat 
                              rep = l ++ match ++ r
                              match = "\\0"


--html_tab = "^[[:space:]]*(<[^<>]+>[^<>]*<[^<>]>)[[:space:]]*$"
html_tab = "^[[:space:]]*(<[^<>]+>[^<>]*<[[:space:]]*/[^<>]+>.*$)"

main = do
    let t1 = subRegex (mkRegex html_tab) "<s></s> asdkfjasd >kk" "[cat]"
    putStr $ "t1=" ++ t1  ++ "\n"

    let t2 = subRegex (mkRegex html_tab) "<s> dog </s>asdkfj asdfj sd" "[cat]"
    putStr $ "t2=" ++ t2 ++ "\n" 

    let t3 = subRegex (mkRegex html_tab) "<s> do g< /s>" "[cat]"
    putStr $ "t3=" ++ t3 ++ "\n" 

    putStr "\n" 
