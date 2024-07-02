factorial :: Int -> Int
factorial 1 = 1
factorial n = go n 1
    where
        go 1 acc = acc
        go n acc = go (n-1) (n*acc)

main :: IO ()
main = do
    print $ factorial 5
    print $ factorial 10
    print $ factorial 20
