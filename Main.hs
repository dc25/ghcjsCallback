{-# LANGUAGE OverloadedStrings #-}

import GHCJS.Marshal(fromJSVal)
import GHCJS.Foreign.Callback (Callback, syncCallback1, syncCallback1', OnBlocked(ContinueAsync))
import Data.JSString (JSString, pack)
import GHCJS.Types (JSVal, jsval)
import JavaScript.Object (create, setProp)


foreign import javascript unsafe "js_sayHello = $1"
    set_sayHelloCallback :: Callback a -> IO ()

foreign import javascript unsafe "js_sayHello($1)" 
    test_sayHelloCallback :: JSString -> IO ()

sayHelloTest = do
    let sayHello jv = do
            Just str <- fromJSVal jv
            print $ "(say): hello, " ++ str

    sayHelloCallback <- syncCallback1 ContinueAsync sayHello
    set_sayHelloCallback sayHelloCallback
    test_sayHelloCallback $ pack "world"
    return ()


foreign import javascript unsafe "js_getHello = $1"
    set_getHelloCallback :: Callback a -> IO ()

foreign import javascript unsafe "js_getHello($1)" 
    test_getHelloCallback :: JSString -> IO ()

getHelloTest = do
    let getHello jv = do
            Just str <- fromJSVal jv
            o <- create
            setProp "helloworld" (jsval $ pack $ "(get): hello, " ++ str) o
            return $ jsval o

    getHelloCallback <- syncCallback1' getHello
    set_getHelloCallback getHelloCallback
    test_getHelloCallback $ pack "WORLD"
    return ()

main = do
    sayHelloTest
    getHelloTest
