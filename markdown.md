*regulare expression in Haskell*
+ load regexp library
    :mod +Text.Regex.Posix
+ =~ can be use to match pattern     
** Example ** 
+ "bar" =~ "(bar|foo)"::Bool
+ True
