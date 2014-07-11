gregorySeries::Int->Double
gregorySeries n = sum(map f [1..n])


data Gender = Male | Female deriving(Show, Eq)

let people = [(Male, "mal"), (Female, "zoe"),
              (Male, "Wash"), (Female, "Inara"),
              (Male, "dog"), (Female, "cat"),
              (Male, "man"), (Female, "cow")]
            

main = show(filter (\(a, b)-> a==Female))
