# ghcjsCallback

This project demonstrates how to do a callback from javascript to haskell in ghcjs.  To build the project you need to have a recent version of ghcjs.

To see it in action.... 

First, compile Main.hs using ghcjs:

    ghcjs Main.hs

next, run a server in Main.jsexe :

    cd Main.jsexe
    python -m SimpleHTTPServer
    
finally, view the results in your brower.

If you just want to see the results, follow the link below:
https://dc25.github.io/ghcjsCallback

If you want to see a slightly modified version that runs under node.js,
look at the nodejs branch.


