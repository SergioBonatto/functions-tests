// a calculator that can add, subtract and multiply
data Expr = (Add Expr Expr)
          | (Sub Expr Expr)
          | (Mul Expr Expr)
          | (Num Int)
          deriving (Show)




