import GHCJS.Marshal(fromJSVal)
import GHCJS.Foreign.Callback (Callback, syncCallback1, OnBlocked(ContinueAsync))
import Data.JSString (JSString, unpack, pack)

foreign import javascript unsafe "js_callback_($1)" 
    call_callback :: JSString -> IO ()

foreign import javascript unsafe "js_callback_ = $1"
    set_callback :: Callback a -> IO ()

sayHello :: String -> IO ()
sayHello name = print $ "hello, " ++ name

main = do
    callback <- syncCallback1 ContinueAsync $ \o -> do
        Just str <- fromJSVal o
        sayHello $ unpack str

    set_callback callback
    call_callback $ pack "world"
