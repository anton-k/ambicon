module Main where

import System.Process
import Dragon.Osc

import Pages.Bass
import Pages.Noiser
import Pages.Haunted
import Pages.Flow

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
    , windowSize = Just (400, 300)
    , windowContent = ui (Tabs pages)
    , windowKeys = [] }

pages = [flowPage, hauntedPage, noiserPage, bassPage]
