{-# LANGUAGE CPP               #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}
module Settings where
import Data.FileEmbed
import qualified Data.ByteString.Char8 as BS8

configSettingsYmlBS :: BS8.ByteString
configSettingsYmlBS = $(embedFile "settings.yml")

