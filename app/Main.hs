module Main where

import Config (config)
import Mattrai.CoreDataTypes
import Mattrai (runMattrai)

main :: IO ()
main = runMattrai config

