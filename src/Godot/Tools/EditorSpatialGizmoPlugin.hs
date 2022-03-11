{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorSpatialGizmoPlugin
       (Godot.Tools.EditorSpatialGizmoPlugin.add_material,
        Godot.Tools.EditorSpatialGizmoPlugin.can_be_hidden,
        Godot.Tools.EditorSpatialGizmoPlugin.commit_handle,
        Godot.Tools.EditorSpatialGizmoPlugin.create_gizmo,
        Godot.Tools.EditorSpatialGizmoPlugin.create_handle_material,
        Godot.Tools.EditorSpatialGizmoPlugin.create_icon_material,
        Godot.Tools.EditorSpatialGizmoPlugin.create_material,
        Godot.Tools.EditorSpatialGizmoPlugin.get_handle_name,
        Godot.Tools.EditorSpatialGizmoPlugin.get_handle_value,
        Godot.Tools.EditorSpatialGizmoPlugin.get_material,
        Godot.Tools.EditorSpatialGizmoPlugin.get_name,
        Godot.Tools.EditorSpatialGizmoPlugin.get_priority,
        Godot.Tools.EditorSpatialGizmoPlugin.has_gizmo,
        Godot.Tools.EditorSpatialGizmoPlugin.is_handle_highlighted,
        Godot.Tools.EditorSpatialGizmoPlugin.is_selectable_when_hidden,
        Godot.Tools.EditorSpatialGizmoPlugin.redraw,
        Godot.Tools.EditorSpatialGizmoPlugin.set_handle)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Resource()

{-# NOINLINE bindEditorSpatialGizmoPlugin_add_material #-}

-- | Adds a new material to the internal material list for the plugin. It can then be accessed with @method get_material@. Should not be overridden.
bindEditorSpatialGizmoPlugin_add_material :: MethodBind
bindEditorSpatialGizmoPlugin_add_material
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "add_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new material to the internal material list for the plugin. It can then be accessed with @method get_material@. Should not be overridden.
add_material ::
               (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
               cls -> GodotString -> SpatialMaterial -> IO ()
add_material cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmoPlugin_add_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "add_material"
           '[GodotString, SpatialMaterial]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.add_material

{-# NOINLINE bindEditorSpatialGizmoPlugin_can_be_hidden #-}

-- | Override this method to define whether the gizmo can be hidden or not. Returns @true@ if not overridden.
bindEditorSpatialGizmoPlugin_can_be_hidden :: MethodBind
bindEditorSpatialGizmoPlugin_can_be_hidden
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "can_be_hidden" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define whether the gizmo can be hidden or not. Returns @true@ if not overridden.
can_be_hidden ::
                (EditorSpatialGizmoPlugin :< cls, Object :< cls) => cls -> IO Bool
can_be_hidden cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmoPlugin_can_be_hidden
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "can_be_hidden" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.can_be_hidden

{-# NOINLINE bindEditorSpatialGizmoPlugin_commit_handle #-}

-- | Override this method to commit gizmo handles. Called for this plugin's active gizmos.
bindEditorSpatialGizmoPlugin_commit_handle :: MethodBind
bindEditorSpatialGizmoPlugin_commit_handle
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "commit_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to commit gizmo handles. Called for this plugin's active gizmos.
commit_handle ::
                (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
                cls -> EditorSpatialGizmo -> Int -> GodotVariant -> Bool -> IO ()
commit_handle cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmoPlugin_commit_handle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "commit_handle"
           '[EditorSpatialGizmo, Int, GodotVariant, Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.commit_handle

{-# NOINLINE bindEditorSpatialGizmoPlugin_create_gizmo #-}

-- | Override this method to return a custom @EditorSpatialGizmo@ for the spatial nodes of your choice, return @null@ for the rest of nodes. See also @method has_gizmo@.
bindEditorSpatialGizmoPlugin_create_gizmo :: MethodBind
bindEditorSpatialGizmoPlugin_create_gizmo
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "create_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to return a custom @EditorSpatialGizmo@ for the spatial nodes of your choice, return @null@ for the rest of nodes. See also @method has_gizmo@.
create_gizmo ::
               (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
               cls -> Spatial -> IO EditorSpatialGizmo
create_gizmo cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmoPlugin_create_gizmo
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "create_gizmo"
           '[Spatial]
           (IO EditorSpatialGizmo)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.create_gizmo

{-# NOINLINE bindEditorSpatialGizmoPlugin_create_handle_material
             #-}

-- | Creates a handle material with its variants (selected and/or editable) and adds them to the internal material list. They can then be accessed with @method get_material@ and used in @method EditorSpatialGizmo.add_handles@. Should not be overridden.
--   				You can optionally provide a texture to use instead of the default icon.
bindEditorSpatialGizmoPlugin_create_handle_material :: MethodBind
bindEditorSpatialGizmoPlugin_create_handle_material
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "create_handle_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a handle material with its variants (selected and/or editable) and adds them to the internal material list. They can then be accessed with @method get_material@ and used in @method EditorSpatialGizmo.add_handles@. Should not be overridden.
--   				You can optionally provide a texture to use instead of the default icon.
create_handle_material ::
                         (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
                         cls -> GodotString -> Maybe Bool -> IO ()
create_handle_material cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSpatialGizmoPlugin_create_handle_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin
           "create_handle_material"
           '[GodotString, Maybe Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Tools.EditorSpatialGizmoPlugin.create_handle_material

{-# NOINLINE bindEditorSpatialGizmoPlugin_create_icon_material #-}

-- | Creates an icon material with its variants (selected and/or editable) and adds them to the internal material list. They can then be accessed with @method get_material@ and used in @method EditorSpatialGizmo.add_unscaled_billboard@. Should not be overridden.
bindEditorSpatialGizmoPlugin_create_icon_material :: MethodBind
bindEditorSpatialGizmoPlugin_create_icon_material
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "create_icon_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an icon material with its variants (selected and/or editable) and adds them to the internal material list. They can then be accessed with @method get_material@ and used in @method EditorSpatialGizmo.add_unscaled_billboard@. Should not be overridden.
create_icon_material ::
                       (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
                       cls -> GodotString -> Texture -> Maybe Bool -> Maybe Color -> IO ()
create_icon_material cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSpatialGizmoPlugin_create_icon_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "create_icon_material"
           '[GodotString, Texture, Maybe Bool, Maybe Color]
           (IO ())
         where
        nodeMethod
          = Godot.Tools.EditorSpatialGizmoPlugin.create_icon_material

{-# NOINLINE bindEditorSpatialGizmoPlugin_create_material #-}

-- | Creates an unshaded material with its variants (selected and/or editable) and adds them to the internal material list. They can then be accessed with @method get_material@ and used in @method EditorSpatialGizmo.add_mesh@ and @method EditorSpatialGizmo.add_lines@. Should not be overridden.
bindEditorSpatialGizmoPlugin_create_material :: MethodBind
bindEditorSpatialGizmoPlugin_create_material
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "create_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an unshaded material with its variants (selected and/or editable) and adds them to the internal material list. They can then be accessed with @method get_material@ and used in @method EditorSpatialGizmo.add_mesh@ and @method EditorSpatialGizmo.add_lines@. Should not be overridden.
create_material ::
                  (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
                  cls ->
                    GodotString ->
                      Color -> Maybe Bool -> Maybe Bool -> Maybe Bool -> IO ()
create_material cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3,
       maybe (VariantBool False) toVariant arg4,
       maybe (VariantBool False) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmoPlugin_create_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "create_material"
           '[GodotString, Color, Maybe Bool, Maybe Bool, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.create_material

{-# NOINLINE bindEditorSpatialGizmoPlugin_get_handle_name #-}

-- | Override this method to provide gizmo's handle names. Called for this plugin's active gizmos.
bindEditorSpatialGizmoPlugin_get_handle_name :: MethodBind
bindEditorSpatialGizmoPlugin_get_handle_name
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "get_handle_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to provide gizmo's handle names. Called for this plugin's active gizmos.
get_handle_name ::
                  (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
                  cls -> EditorSpatialGizmo -> Int -> IO GodotString
get_handle_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmoPlugin_get_handle_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "get_handle_name"
           '[EditorSpatialGizmo, Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.get_handle_name

{-# NOINLINE bindEditorSpatialGizmoPlugin_get_handle_value #-}

-- | Gets actual value of a handle from gizmo. Called for this plugin's active gizmos.
bindEditorSpatialGizmoPlugin_get_handle_value :: MethodBind
bindEditorSpatialGizmoPlugin_get_handle_value
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "get_handle_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets actual value of a handle from gizmo. Called for this plugin's active gizmos.
get_handle_value ::
                   (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
                   cls -> EditorSpatialGizmo -> Int -> IO GodotVariant
get_handle_value cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSpatialGizmoPlugin_get_handle_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "get_handle_value"
           '[EditorSpatialGizmo, Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.get_handle_value

{-# NOINLINE bindEditorSpatialGizmoPlugin_get_material #-}

-- | Gets material from the internal list of materials. If an @EditorSpatialGizmo@ is provided, it will try to get the corresponding variant (selected and/or editable).
bindEditorSpatialGizmoPlugin_get_material :: MethodBind
bindEditorSpatialGizmoPlugin_get_material
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets material from the internal list of materials. If an @EditorSpatialGizmo@ is provided, it will try to get the corresponding variant (selected and/or editable).
get_material ::
               (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
               cls -> GodotString -> EditorSpatialGizmo -> IO SpatialMaterial
get_material cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmoPlugin_get_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "get_material"
           '[GodotString, EditorSpatialGizmo]
           (IO SpatialMaterial)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.get_material

{-# NOINLINE bindEditorSpatialGizmoPlugin_get_name #-}

-- | Override this method to provide the name that will appear in the gizmo visibility menu.
bindEditorSpatialGizmoPlugin_get_name :: MethodBind
bindEditorSpatialGizmoPlugin_get_name
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to provide the name that will appear in the gizmo visibility menu.
get_name ::
           (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
           cls -> IO GodotString
get_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmoPlugin_get_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "get_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.get_name

{-# NOINLINE bindEditorSpatialGizmoPlugin_get_priority #-}

-- | Override this method to set the gizmo's priority. Higher values correspond to higher priority. If a gizmo with higher priority conflicts with another gizmo, only the gizmo with higher priority will be used.
--   				All built-in editor gizmos return a priority of @-1@. If not overridden, this method will return @0@, which means custom gizmos will automatically override built-in gizmos.
bindEditorSpatialGizmoPlugin_get_priority :: MethodBind
bindEditorSpatialGizmoPlugin_get_priority
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "get_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to set the gizmo's priority. Higher values correspond to higher priority. If a gizmo with higher priority conflicts with another gizmo, only the gizmo with higher priority will be used.
--   				All built-in editor gizmos return a priority of @-1@. If not overridden, this method will return @0@, which means custom gizmos will automatically override built-in gizmos.
get_priority ::
               (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
               cls -> IO GodotString
get_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmoPlugin_get_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "get_priority" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.get_priority

{-# NOINLINE bindEditorSpatialGizmoPlugin_has_gizmo #-}

-- | Override this method to define which Spatial nodes have a gizmo from this plugin. Whenever a @Spatial@ node is added to a scene this method is called, if it returns @true@ the node gets a generic @EditorSpatialGizmo@ assigned and is added to this plugin's list of active gizmos.
bindEditorSpatialGizmoPlugin_has_gizmo :: MethodBind
bindEditorSpatialGizmoPlugin_has_gizmo
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "has_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define which Spatial nodes have a gizmo from this plugin. Whenever a @Spatial@ node is added to a scene this method is called, if it returns @true@ the node gets a generic @EditorSpatialGizmo@ assigned and is added to this plugin's list of active gizmos.
has_gizmo ::
            (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
            cls -> Spatial -> IO Bool
has_gizmo cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmoPlugin_has_gizmo
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "has_gizmo" '[Spatial]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.has_gizmo

{-# NOINLINE bindEditorSpatialGizmoPlugin_is_handle_highlighted #-}

-- | Gets whether a handle is highlighted or not. Called for this plugin's active gizmos.
bindEditorSpatialGizmoPlugin_is_handle_highlighted :: MethodBind
bindEditorSpatialGizmoPlugin_is_handle_highlighted
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "is_handle_highlighted" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets whether a handle is highlighted or not. Called for this plugin's active gizmos.
is_handle_highlighted ::
                        (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
                        cls -> EditorSpatialGizmo -> Int -> IO Bool
is_handle_highlighted cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSpatialGizmoPlugin_is_handle_highlighted
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin
           "is_handle_highlighted"
           '[EditorSpatialGizmo, Int]
           (IO Bool)
         where
        nodeMethod
          = Godot.Tools.EditorSpatialGizmoPlugin.is_handle_highlighted

{-# NOINLINE bindEditorSpatialGizmoPlugin_is_selectable_when_hidden
             #-}

-- | Override this method to define whether a Spatial with this gizmo should be selectable even when the gizmo is hidden.
bindEditorSpatialGizmoPlugin_is_selectable_when_hidden ::
                                                       MethodBind
bindEditorSpatialGizmoPlugin_is_selectable_when_hidden
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "is_selectable_when_hidden" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define whether a Spatial with this gizmo should be selectable even when the gizmo is hidden.
is_selectable_when_hidden ::
                            (EditorSpatialGizmoPlugin :< cls, Object :< cls) => cls -> IO Bool
is_selectable_when_hidden cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSpatialGizmoPlugin_is_selectable_when_hidden
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin
           "is_selectable_when_hidden"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Tools.EditorSpatialGizmoPlugin.is_selectable_when_hidden

{-# NOINLINE bindEditorSpatialGizmoPlugin_redraw #-}

-- | Callback to redraw the provided gizmo. Called for this plugin's active gizmos.
bindEditorSpatialGizmoPlugin_redraw :: MethodBind
bindEditorSpatialGizmoPlugin_redraw
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "redraw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Callback to redraw the provided gizmo. Called for this plugin's active gizmos.
redraw ::
         (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
         cls -> EditorSpatialGizmo -> IO ()
redraw cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmoPlugin_redraw
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "redraw"
           '[EditorSpatialGizmo]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.redraw

{-# NOINLINE bindEditorSpatialGizmoPlugin_set_handle #-}

-- | Update the value of a handle after it has been updated. Called for this plugin's active gizmos.
bindEditorSpatialGizmoPlugin_set_handle :: MethodBind
bindEditorSpatialGizmoPlugin_set_handle
  = unsafePerformIO $
      withCString "EditorSpatialGizmoPlugin" $
        \ clsNamePtr ->
          withCString "set_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Update the value of a handle after it has been updated. Called for this plugin's active gizmos.
set_handle ::
             (EditorSpatialGizmoPlugin :< cls, Object :< cls) =>
             cls -> EditorSpatialGizmo -> Int -> Camera -> Vector2 -> IO ()
set_handle cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmoPlugin_set_handle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmoPlugin "set_handle"
           '[EditorSpatialGizmo, Int, Camera, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmoPlugin.set_handle