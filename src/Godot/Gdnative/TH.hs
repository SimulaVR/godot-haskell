{-#LANGUAGE TemplateHaskell#-}
module Godot.Gdnative.TH where

import Godot.Gdnative.Gdnative
import Language.Haskell.TH
import Language.Haskell.TH.Syntax
import Foreign

-- |generates a FunPtr $(name)_wrapper
mkNativeCallCallback :: Name -> Q [Dec]
mkNativeCallCallback fn = do
  ty <- [t|Ptr () -> GodotArray -> IO GodotVariant|]
  resTy <- [t|FunPtr (Ptr () -> GodotArray -> IO (Ptr ())) |]
  let wrapperName = nameBase fn ++ "_wrapper"
  Module _ modn <- thisModule
  qAddForeignFile LangC $ unlines
    [ "#include \"" ++ headerName (modString modn) ++ "\""
    , "#include <gdnative/gdnative.h>"
    , "godot_variant " ++ wrapperName ++ "(void* ptr, godot_array* arr) {"
    , "  return *((godot_variant*)" ++ nameBase fn ++ "(ptr, arr));"
    , "}" ]
  return [ ForeignD $ ExportF CCall (nameBase fn) fn ty
         , ForeignD $ ImportF CCall Safe ("&" ++ wrapperName) (mkName wrapperName) resTy]

  where
    headerName mn = map (\c -> if c == '.' then '/' else c) mn ++ "_stub.h"
