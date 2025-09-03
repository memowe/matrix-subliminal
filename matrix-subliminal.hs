module Main where

import System.Environment

main :: IO ()
main = mapM_ putStrLn =<< getArgs
