module Godot
  ( module M
  )
where

import           Godot.Api                     as M -- Has all Godot classes
import           Godot.Methods                 as M -- Has all Godot methods
import           Godot.Nativescript            as M
import           Godot.Internal.Dispatch       as M
                                                          ( (:<) -- For generic functions
                                                          -- Required for creating Godot classes
                                                          , HasBaseClass(..)
                                                          -- Needed for down-casting objects
                                                          , safeCast
                                                          )

-- Better to export these now than to inevitably have the user dig through the
-- whole library in search of them.
import           Godot.Gdnative.Internal.Gdnative
                                               as M
                                                          ( GodotObject
                                                          , GodotAabb
                                                          , GodotArray
                                                          , GodotBasis
                                                          , GodotBool
                                                          , GodotCharString
                                                          , GodotCharType
                                                          , GodotColor
                                                          , GodotDictionary
                                                          , GodotError(..)
                                                          , GodotInt
                                                          , GodotMethodBind
                                                          , GodotNodePath
                                                          , GodotPlane
                                                          , GodotPoolArrayReadAccess
                                                          , GodotPoolArrayWriteAccess
                                                          , GodotPoolByteArray
                                                          , GodotPoolColorArray
                                                          , GodotPoolIntArray
                                                          , GodotPoolRealArray
                                                          , GodotPoolStringArray
                                                          , GodotPoolVector2Array
                                                          , GodotPoolVector3Array
                                                          , GodotQuat
                                                          , GodotReal
                                                          , GodotRect2
                                                          , GodotRid
                                                          , GodotString
                                                          , GodotStringName
                                                          , GodotTransform
                                                          , GodotTransform2d
                                                          , GodotVariant
                                                          , GodotVariantCallErrorError(..)
                                                          , GodotVariantOperator(..)
                                                          , GodotVariantType(..)
                                                          , GodotVector2
                                                          , GodotVector3
                                                          , GodotVector3Axis(..)
                                                          )


-- These will always be needed when writing Godot class methods
import           Godot.Gdnative.Types          as M
                                                          ( fromGodotVariant
                                                          , toVariant
                                                          , toLowLevel
                                                          )

-- These are needed in order to keep data between callbacks since we don't pass
-- state back and forth between Haskell and Godot.
import           Control.Concurrent.STM.TVar   as M
import           Control.Monad.STM             as M

-- We use Text as the Haskell equivalent of GodotString
import           Data.Text                     as M
                                                          ( Text )
