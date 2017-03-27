module Main where

import System.Cmd
import Dragon.Osc

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

-- quad flow window

flowPage = Page "flow"  flowUi flowKeys

flowUi = ui (XYPad (0.5, 0.5) "olive")
flowKeys = []

-- haunted window

hauntedPage = Page "haunted" hauntedUi hauntedKeys

hauntedUi = ui (XYPad (0.5, 0.5) "orange")
hauntedKeys = []

-- noiser selection window

noiserPage = Page "noiser" noiserUi noiserKeys

noiserUi = ui (Ver [noiserList, noiserTweaks])
    where
        noiserList = ui $ HCheck 0 4 "blue" ["foo", "baz", "bar", "cux"] Nothing

        noiserTweaks = multiUi (4, 1) (const $ ui $ Dial 0.5 "olive" (0, 1))

noiserKeys = []

-- bass window    

bassPage = Page "bass" bassUi bassKeys

bassUi = ui Space
bassKeys = []
