module Godot
  ( module M
  )
where

import           Godot.Api                     as M hiding (NativeScript) -- Has all Godot classes
import           Godot.Nativescript            as M
import           Godot.Internal.Dispatch       as M
                                                          ( (:<) -- For generic functions
                                                          -- Required for creating Godot classes
                                                          , HasBaseClass(..)
                                                          -- Needed for up-casting objects
                                                          , upcast
                                                          )

-- Better to export these now than to inevitably have the user dig through the
-- whole library in search of them.
import           Godot.Gdnative.Internal.Gdnative
                                               as M
                                                          ( Object
                                                          , Aabb
                                                          , Array
                                                          , Basis
                                                          , GodotBool
                                                          , CharString
                                                          , CharType
                                                          , Color
                                                          , Dictionary
                                                          , Error(..)
                                                          , GodotInt
                                                          , MethodBind
                                                          , NodePath
                                                          , Plane
                                                          , PoolArrayReadAccess
                                                          , PoolArrayWriteAccess
                                                          , PoolByteArray
                                                          , PoolColorArray
                                                          , PoolIntArray
                                                          , PoolRealArray
                                                          , PoolStringArray
                                                          , PoolVector2Array
                                                          , PoolVector3Array
                                                          , Quat
                                                          , GodotReal
                                                          , Rect2
                                                          , Rid
                                                          , GodotString
                                                          , StringName
                                                          , Transform
                                                          , Transform2d
                                                          , GodotVariant
                                                          , VariantCallErrorError(..)
                                                          , VariantOperator(..)
                                                          , VariantType(..)
                                                          , Vector2
                                                          , Vector3
                                                          , Vector3Axis(..)
                                                          )


-- These will always be needed when writing Godot class methods
import           Godot.Gdnative.Internal.Types          as M
                                                          ( fromGodotVariant
                                                          , fromLowLevel
                                                          , toLowLevel
                                                          , toVariant
                                                          )

-- These are needed in order to keep data between callbacks since we don't pass
-- state back and forth between Haskell and Godot.
import           Control.Concurrent.MVar       as M

-- We use Text as the Haskell equivalent of GodotString
import           Data.Text                     as M ( Text )
