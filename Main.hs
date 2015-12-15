import GHCJS.Marshal(fromJSVal)
import GHCJS.Foreign.Callback (Callback, syncCallback1, OnBlocked(ContinueAsync))
import Data.JSString (JSString, unpack, pack)

foreign import javascript unsafe "js_callback_($1)" 
    call_callback :: JSString -> IO ()

foreign import javascript unsafe "js_callback_ = $1"
    set_callback :: Callback a -> IO ()

main = do
    callback <- syncCallback1 ContinueAsync $ \o -> do
        Just str <- fromJSVal o
        putStrLn $ unpack str

    set_callback callback
    call_callback $ pack "hello world"
