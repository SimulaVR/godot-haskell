{-# LANGUAGE LambdaCase, FunctionalDependencies, DeriveGeneric, UndecidableInstances, ConstraintKinds #-}
module Game.RSSReader where
import Control.Lens
import Control.Monad
import Foreign.Ptr
import Godot
import Godot.Core.HTTPClient as HTTPClient
import Godot.Core.OS as OS
import Godot.Core.ItemList as ItemList
import Godot.Core.HTTPRequest as HTTPRequest
import Godot.Core.TextEdit as TextEdit
import Godot.Core.LineEdit as LineEdit
import Godot.Core.LinkButton as LinkButton
import Godot.Core.Popup as Popup
import Godot.Gdnative
import Project.Scenes.Rss_reader()
import Project.Support
import qualified Xeno.DOM.Robust as X
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import Data.List
import Data.Maybe
import Data.Typeable
import GHC.Generics
import qualified Data.Aeson as A
import System.Directory
import qualified Godot.Core.CanvasItem as CanvasItem

data Settings = Settings { _url :: Text }
   deriving (Generic, Show)
instance A.FromJSON Settings
instance A.ToJSON Settings
makeFieldsNoPrefix ''Settings

data Story = Story { _storyTitle :: T.Text
                   , _storyDescription :: Maybe T.Text
                   , _storyLink :: T.Text }
  deriving Show
makeFields ''Story

data RSSReader = RSSReader
  { _base :: Control
  , _feed :: MVar [Story]
  }
makeFieldsNoPrefix ''RSSReader

instance NodeInit RSSReader where
  init base = RSSReader base <$> newMVar []

instance NodeMethod RSSReader "_on_OpenButton_pressed" '[] (IO ()) where
  nodeMethod = populateEdit

instance NodeMethod RSSReader "populateEdit" '[] (IO ()) where
  nodeMethod = populateEdit

instance NodeMethod RSSReader "_on_HTTPRequest_request_completed" [Int, Int, PoolStringArray, PoolByteArray] (IO ()) where
  nodeMethod self _ _ _ body = do
    t <- getNode' @"TextEdit" self
    sz <- godot_pool_byte_array_size body
    s <- (\x -> godot_string_chars_to_utf8_with_len (castPtr x) sz) =<< godot_pool_byte_array_read_access_ptr =<< godot_pool_byte_array_read body
    TextEdit.set_text t s
    contents <- T.encodeUtf8 <$> fromLowLevel s
    let stories = parseXML contents
    lst <- getNode' @"ItemList" self
    void $ swapMVar (self ^. feed) stories
    mapM_ (\s -> ItemList.add_item lst <$> toLowLevel (s ^. title) <*> pure Nothing <*> pure (Just True) & join) stories

instance NodeMethod RSSReader "_on_ItemList_item_selected" '[Int] (IO ()) where
  nodeMethod self n = do
    f <- readMVar (self ^. feed)
    TextEdit.set_text <$> getNode' @"DescriptionField" self
                      <*> toLowLevel (fromMaybe "" $ (f !! n) ^. description)
                      & join
    LinkButton.set_text <$> getNode' @"LinkButton" self
                        <*> toLowLevel ((f !! n) ^. link)
                        & join
    pure ()

instance NodeMethod RSSReader "_on_LinkButton_pressed" '[] (IO ()) where
  nodeMethod self = do
    (Just os) <- getSingleton @OS
    void $ OS.shell_open os =<< LinkButton.get_text =<< getNode' @"LinkButton" self

instance NodeMethod RSSReader "_on_SettingsButton_pressed" '[] (IO ()) where
  nodeMethod self = do
    d <- getNode' @"SettingsDialog" self
    Popup.popup d Nothing

instance NodeMethod RSSReader "_on_Settings_Clear_Button_pressed" '[] (IO ()) where
  nodeMethod self = LineEdit.set_text <$> getNode' @"SettingsDialog/RSSURLText" self
                                      <*> toLowLevel ""
                                       & join

instance NodeMethod RSSReader "_on_RSSReader_ready" '[] (IO ()) where
  nodeMethod self = loadData self

instance NodeMethod RSSReader "_on_SaveButton_pressed" '[] (IO ()) where
  nodeMethod self = do
      saveData self
      CanvasItem.hide =<< getNode' @"SettingsDialog" self
      pure ()

clearFields (self :: RSSReader) = do
  void $ swapMVar (self ^. feed) []
  ItemList.clear =<< getNode' @"ItemList" self
  TextEdit.set_text <$> getNode' @"DescriptionField" self <*> toLowLevel "" & join
  LinkButton.set_text <$> getNode' @"LinkButton" self <*> toLowLevel "" & join
  pure ()

saveData self = do
  putStrLn "Saving data"
  (Just os) <- getSingleton @OS
  d <- fromLowLevel =<< OS.get_user_data_dir os
  t <- fromLowLevel =<< LineEdit.get_text =<< getNode' @"SettingsDialog/RSSURLText" self
  A.encodeFile (T.unpack d <> "/save_config.json") (Settings t)

loadData self = do
  putStrLn "Loading data"
  (Just os) <- getSingleton @OS
  d <- fromLowLevel =<< OS.get_user_data_dir os
  e <- doesFileExist (T.unpack d <> "/save_config.json")
  when e $ do
    r <- A.decodeFileStrict' (T.unpack d <> "/save_config.json")
    case r of
      Nothing -> pure ()
      Just (s :: Settings) -> do
        LineEdit.set_text <$> getNode' @"SettingsDialog/RSSURLText" self
          <*> toLowLevel (s ^. url)
          & join

parseXML x = case X.parse x of
            Right xml -> do
              case X.children xml of
                [chan] -> do
                  mapMaybe unItem $ X.children chan
                _ -> error "Unknown RSS"
            Left a -> []
  where head' (h:_) = Just h
        head' _ = Nothing
        byName name nodes = head' . nodeData =<< find (\e -> X.name e == name) nodes
        nodeData = mapMaybe (\case
                                X.Text t -> Just t
                                X.CData t -> Just t
                                _ -> Nothing) . X.contents
        unItem item = let nodes = X.children item
                      in do
                         t <- byName "title" nodes
                         l <- byName "link" nodes
                         pure $ Story (T.decodeUtf8 t) (T.decodeUtf8 <$> byName "description" nodes) (T.decodeUtf8 l)

nothing :: (Object :< a, Typeable a, AsVariant a) => IO a
nothing = fromJust <$> tryCast (Object nullPtr)

populateEdit :: RSSReader -> IO ()
populateEdit self = do
  url <- LineEdit.get_text =<< getNode' @"SettingsDialog/RSSURLText" self
  void $ HTTPRequest.request <$> getNode' @"HTTPRequest" self
                             <*> pure url
                             <*> (Just <$> godot_pool_string_array_new)
                             <*> pure (Just True)
                             <*> pure (Just HTTPClient._METHOD_GET)
                             <*> pure Nothing
                             & join

setupNode ''RSSReader "Rss_reader" "RSSReader"
deriveBase ''RSSReader
