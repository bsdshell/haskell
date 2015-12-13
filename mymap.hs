--[file=map.html title=""
f::Int->Int->Int
f a b = a - b

main = do 
        print(map (+ 2)     [1..3]) -- (2 + 1) (2 + 2) (2 + 3)
        print(map (2 -)     [1..3]) -- (2 - 1) (2 - 2) (2 - 2)
        print(map ((-) 2)   [1..3]) -- (2 - 1) (2 - 2) (2 - 3)
        print(map (mod 2)   [1..3]) -- (2 mod 1) (2 mod 2) (2 mod 3)
        print(map (`mod` 2) [1..3]) -- (1 mod 2) (2 mod 2) (3 mod 2)
        print(map (/ 2)     [1..3]) -- (2 / 1) (2 / 2) (2 / 3)
        print(map (* 2)     [1..3]) -- (2 * 1) (2 * 2) (2 * 3)

        print(map (f 10)    [1..3]) -- (10 - 1) (10 - 2) (10 - 3)
        print(map (`f` 10)  [1..3]) -- (1 - 10) (2 - 10) (3 - 10)
--]
