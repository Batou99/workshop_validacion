module Ex3 where

import Prelude as P
import System.Environment as SE
import Text.Read (readEither)
import Data.Either (lefts, rights, partitionEithers)
import Text.Printf


eitherLine :: (String, Integer) -> Either String Integer
eitherLine (line, lineNumber) =
  case readEither line of
       Left value -> Left $ printf "Wrong number '%s' at line: %i" value lineNumber
       Right value -> Right value


partition :: [String] -> ([String], [Integer])
partition lines = partitionEithers $ map eitherLine linesWithNumbers
  where
    linesWithNumbers = zip lines [1..]


main = do
  -- getArgs :: IO [String]
  filepath : xs <- SE.getArgs
  -- readFile :: IO String
  fileContents <- P.readFile filepath
  let allLines = lines fileContents
      (errors, numbers) = partition allLines
  print $ sum numbers
  mapM_ putStrLn errors
