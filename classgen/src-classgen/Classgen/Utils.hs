module Classgen.Utils where

import Control.Lens
import Language.Haskell.TH

fixedTypeFields :: LensRules
fixedTypeFields = defaultFieldRules & lensField .~ (\tyn fs f -> map fixDefName $ abbreviatedNamer tyn fs f)
    where
      fixDefName (TopName n) = TopName (fixName n)
      fixDefName (MethodName c n) = MethodName c (fixName n)
  
      fixName n = mkName $ case nameBase n of
        "type" -> "type'"
        "id" -> "id'"
        "class" -> "class'"
        s -> s
