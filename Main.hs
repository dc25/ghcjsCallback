{-# LANGUAGE ScopedTypeVariables #-}

import GHCJS.Marshal(fromJSVal)
import GHCJS.Foreign.Callback (Callback, syncCallback1')
import Data.JSString (JSString, unpack, pack)
import GHCJS.Types (JSVal, jsval)
import JavaScript.Object (Object, create, setProp)
import Data.Maybe (fromJust)

foreign import javascript unsafe "helloWorld = $1"
    set_callback :: Callback (JSVal -> IO JSVal) -> IO ()

main :: IO ()
main = do
    callback <- syncCallback1' $ \jv -> do
      (str :: String) <- unpack . fromJust <$> fromJSVal jv
      (o :: Object) <- create
      setProp (pack "helloworld" :: JSString) (jsval . pack $ "hello, " ++ str) o
      return $ jsval o
    -- when all.js is loaded, it will defined the function `helloWorld` globally in jsLand
    set_callback callback
