module Ex1 where

import Prelude as P
import System.Environment as SE

main = do
  args <- SE.getArgs
  mapM_ P.putStrLn args
