module Ex2 where

import Prelude as P
import System.Environment as SE
import Text.Read (readMaybe)

readLines :: [String] -> [Int]
readLines = map $ getNumber . readMaybe

getNumber :: Maybe Int -> Int
getNumber (Just number) = number
getNumber Nothing = 0

main = do
  -- getArgs :: IO [String]
  filepath : xs <- SE.getArgs
  -- readFile :: IO String
  fileContents <- P.readFile filepath
  let allLines = lines fileContents
  print . sum . readLines $ allLines
