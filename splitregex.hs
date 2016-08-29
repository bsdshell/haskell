import Data.List(inits, tails)
import Text.Regex

main = do
    pint $ splitRegex(mkRegex ":") "PaloAlto:MountainView" 
    -- ["PaloAlto","MountainView"]
