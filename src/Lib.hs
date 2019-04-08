module Lib where

import Prelude

import qualified Data.Yaml as Yaml
import Language.Haskell.TH (Exp, Q, runIO)
import Language.Haskell.TH.Syntax (addDependentFile)

migrations :: ()
migrations = $(do
  _ <- runIO (Yaml.decodeFileEither "file.txt" :: IO (Either Yaml.ParseException Yaml.Value))
  [|()|])
