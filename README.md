# ghcjsCallback

This project demonstrates how to do a callback from javascript to haskell in ghcjs that returns a value.  To build the project you need to have a recent version of ghcjs.

    $ ghcjs --version
    The Glorious Glasgow Haskell Compilation System for JavaScript, version 0.2.0 (GHC 7.10.3)

To see it in action first compile Main.hs using ghcjs:

    ghcjs Main.hs

Then, run a server in Main.jsexe :

    cd Main.jsexe
    python -m SimpleHTTPServer

Finally, view the results in your brower. `helloWorld` will be in scope in the browser's console:

    >let hi = helloWorld("bob")
    Object {helloworld: "hello, bob"}
    >helloWorld([] + {})
    Object {helloworld: "hello, [object Object]"}
    >helloWorld(Array(16).join("wat" - 1) + " Batman!")
    Object {helloworld: "hello, NaNNaNNaNNaNNaNNaNNaNNaNNaNNaNNaNNaNNaNNaNNaN Batman!"}

If you just want to see the results, follow the link below:
https://dc25.github.io/ghcjsCallback

If you want to see a slightly modified version that runs under node.js,
look at the nodejs branch.

NB: index.html loads {lib,rts,out,runmain}.js. If you want a single js lib to load/compile, use all.js.
