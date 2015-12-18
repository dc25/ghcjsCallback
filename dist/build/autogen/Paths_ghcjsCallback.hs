module Paths_ghcjsCallback (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/dave/.cabal/bin"
libdir     = "/home/dave/.cabal/lib/x86_64-linux-ghcjs-0.2.0-ghc7_10_3/ghcjsCallback-0.1.0.0-IWyDuEIF9QFIL2fkS7fMSV"
datadir    = "/home/dave/.cabal/share/x86_64-linux-ghcjs-0.2.0-ghc7_10_3/ghcjsCallback-0.1.0.0"
libexecdir = "/home/dave/.cabal/libexec"
sysconfdir = "/home/dave/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ghcjsCallback_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ghcjsCallback_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "ghcjsCallback_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ghcjsCallback_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ghcjsCallback_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
