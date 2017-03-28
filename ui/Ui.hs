module Main where

import System.Process
import Dragon.Osc

import Pages

main = do
    writeJson "ui.json" root
    system "dragon-osc -i test.json"
    return ()

root = Root windows keys inits

windows = [mainWindow]

keys = []
inits = []

mainWindow = Window 
    { windowTitle = "amby" 
    , windowSize = Just (500, 300)
    , windowContent = ui (Tabs pages)
    , windowKeys = [] }

pages = [mixerPage, flowPage, hauntedPage, noiserPage, bassPage, syntPage, loopPage, padListPage]
