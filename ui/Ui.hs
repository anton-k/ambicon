module Ui where

import System.Process
import Dragon.Osc

import ReadDir
import Pages

renderUi = do
    config <- readSrc
    writeJson "ui.json" (root config)

main = do
    config <- readSrc    
    writeJson "ui.json" $ root config
    system "dragon-osc -i test.json --verbose -c quad-flow=5400"
    return ()

root config = Root (windows config) keys inits

windows config = [mainWindow config]

keys = []
inits = []

mainWindow config = Window 
    { windowTitle = "amby" 
    , windowSize = Just (500, 300)
    , windowContent = ui (Tabs $ pages config)
    , windowKeys = [] }

pages config = 
    [ mixerPage
    , flowPage
    , hauntedPage
    , noiserPage $ srcNoisers config
    , bassPage
    , syntPage $ srcMidis config
    , loopPage
    , delLoopPage
    , padListPage $ srcPads config
    , specPage]
