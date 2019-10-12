import Prelude     (IO, print)
import Settings
import qualified Data.ByteString.Char8 as BS8
import Settings.StaticFiles
main :: IO ()
main = do
  BS8.putStrLn configSettingsYmlBS 
