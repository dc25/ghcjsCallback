import GHCJS.Marshal(fromJSVal)
import GHCJS.Foreign.Callback (Callback, syncCallback1, OnBlocked(ContinueAsync))
import Data.JSString (JSString, unpack, pack)
import GHCJS.Types (JSVal, jsval)

getHello :: String -> String
getHello name = "hello, " ++ name

getHello' :: JSVal -> IO JSVal
getHello' jv = do
    Just str <- fromJSVal jv
    let hello = getHello str
    return (jsval . pack  $ hello)

sayHello :: String -> IO ()
sayHello name = print $ getHello name

sayHello' :: JSVal -> IO ()
sayHello' jv = do
    Just str <- fromJSVal jv
    sayHello $ unpack str

foreign import javascript unsafe "js_sayHello = $1"
    set_sayHelloCallback :: Callback a -> IO ()

foreign import javascript unsafe "js_sayHello($1)" 
    test_callback :: JSString -> IO ()

main = do
    sayHelloCallback <- syncCallback1 ContinueAsync sayHello'
    set_sayHelloCallback sayHelloCallback
    test_callback $ pack "world"
