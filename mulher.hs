-- Definindo um tipo de dados para representar uma Pessoa
data Thing = Thing {
    nome   :: String,
    idade  :: Int,
    altura :: Float,
    peso   :: Float,
    beleza :: Int
} deriving (Show)

-- Função que retorna os atributos de uma pessoa encapsulados em Maybe
mulher :: Maybe (String, Int, Float, Float, Int)
mulher = Just ("Julia", 21, 1.56, 53, 8)

-- Função principal para imprimir os atributos da pessoa
main :: IO ()
main = case mulher of
    Just (n, i, a, p, b) -> putStrLn $ "Nome: " ++ n ++ ", Idade: " ++ show i ++ ", Altura: " ++ show a ++ ", Peso: " ++ show p ++ ", Beleza: " ++ show b
    Nothing -> putStrLn "Erro ao criar pessoa"

