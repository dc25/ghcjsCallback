# ghcjsCallback

This project demonstrates how to do a callback from javascript to haskell in ghcjs.


    dave@c29b77f44248:/repos/gitnc$ git clone https://github.com/dc25/ghcjsCallback.git
    Cloning into 'ghcjsCallback'...
    remote: Counting objects: 57, done.
    remote: Compressing objects: 100% (2/2), done.
    remote: Total 57 (delta 1), reused 1 (delta 1), pack-reused 54
    Unpacking objects: 100% (57/57), done.
    Checking connectivity... done.
    dave@c29b77f44248:/repos/gitnc$ cd ghcjsCallback
    dave@c29b77f44248:/repos/gitnc/ghcjsCallback$ ls
    dist  ghcjsCallback.cabal  index.html  Main.hs  makefile  README.md  subtree_push.txt
    dave@c29b77f44248:/repos/gitnc/ghcjsCallback$ rm -rf dist/ 
    dave@c29b77f44248:/repos/gitnc/ghcjsCallback$ cabal sandbox init
    Writing a default package environment file to
    /repos/gitnc/ghcjsCallback/cabal.sandbox.config
    Creating a new sandbox at /repos/gitnc/ghcjsCallback/.cabal-sandbox
    dave@c29b77f44248:/repos/gitnc/ghcjsCallback$ cabal configure --ghcjs
    Warning: The package list for 'hackage.haskell.org' does not exist. Run 'cabal
    update' to download it.
    Resolving dependencies...
    Configuring ghcjsCallback-0.1.0.0...
    Warning: The 'license-file' field refers to the file 'LICENSE' which does not
    exist.
    dave@c29b77f44248:/repos/gitnc/ghcjsCallback$ cabal build
    Building ghcjsCallback-0.1.0.0...
    Preprocessing executable 'ghcjsCallback' for ghcjsCallback-0.1.0.0...
    [1 of 1] Compiling Main             ( Main.hs, dist/build/ghcjsCallback/ghcjsCallback-tmp/Main.js_o )
    Linking dist/build/ghcjsCallback/ghcjsCallback.jsexe (Main)
    dave@c29b77f44248:/repos/gitnc/ghcjsCallback$ cd dist/build/ghcjsCallback/ghcjsCallback.jsexe/
    dave@c29b77f44248:/repos/gitnc/ghcjsCallback/dist/build/ghcjsCallback/ghcjsCallback.jsexe$ python -m SimpleHTTPServer
    Serving HTTP on 0.0.0.0 port 8000 ...

