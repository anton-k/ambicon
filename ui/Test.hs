module Test where

import Prelude hiding (catch)
import Control.Concurrent

import Control.Exception ( SomeException(..),
                           AsyncException(..)
                         , catch, handle, throw)

import System.Process
import System.IO
import Control.Monad (forever)

import Ui(renderUi)

csound args = system $ "csound " ++ args

runUnit cmd = csound $ "test/units/" ++ cmd ++ ".csd &"

runClients = do
    mapM_ runUnit ["pad-1", "pad-2", "pad-3", "pad-4"]
    runFlow   
    runHaunted

runFlow = csound "../hs/quad-flow.csd &"
runHaunted = csound "../haunted/haunt.csd --omacro:PORT=5401 -odac:nil &"
connectJack = system "aj-snapshot -r test/jack-config/flow-test.xml &"

runUi = system $ "dragon-osc -i test.json  --verbose -c quad-flow=5400,haunted=5401 &"

setup = do    
    runClients        
    threadDelay (1000 * 1000)
    connectJack    
    -- renderUi
    runUi 
    repl
    return ()

repl :: IO ()
repl = forever $ do
    putStr ">>> " >> hFlush stdout
    out <- getLine
    if null out
       then return ()
       else putStrLn out


stop = do    
    system "pkill -9 csound"    
    system "pkill -9 java"    
    return ()

onUserInterrupt UserInterrupt = putStrLn "\nUserInterruption"
onUserInterrupt e = throw e

main = do
    handle onAbort (setup `catch` onUserInterrupt)
    putStrLn "Exiting..."

onAbort e = do
    stop
    let x = show (e :: SomeException)
    putStrLn $ "\nAborted: " ++ x    
    