{-# LANGUAGE TemplateHaskell #-}

module Main where
import Settings
import Data.FileEmbed
import qualified Data.ByteString.Char8 as BS8

main :: IO ()
main = do
  BS8.putStrLn $(embedFile "settings.yml")
  BS8.putStrLn $(embedFile "foo.txt")
