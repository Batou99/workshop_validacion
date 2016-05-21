module Ex1 where

import Prelude as P
import System.Environment as SE
import Control.Monad (liftM)

readLines :: [String] -> [Int]
readLines = map P.read

main = do
  -- getArgs :: IO [String]
  filepath : xs <- SE.getArgs
  -- readFile :: IO String
  fileContents <- P.readFile filepath
  let allLines = lines fileContents
  print . sum $ readLines allLines
