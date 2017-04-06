module Pages.Loop(loopPage, delLoopPage) where

import Dragon.Osc

loopPage = Page "loop" loopUi loopKey

loopUi = ui $ Ver [loopSources, loopPlayers]

loopSources = multiUi (6, 1) unit
    where
        unit n = ui $ Button (loopColors n) (loopLabels n)

loopColors n = case n `div` 2 of
        0 ->  "orange" 
        1 ->  "olive" 
        2 ->  "blue" 

loopLabels n = case n `div` 2 of
        0 -> "1"
        1 -> "2"
        2 -> "4"

loopPlayers = multiUi (1, 9) unit
    where
        unit n = ui $ Hor [starter n, speed, pitch, skip, volume, fxs]
            where
                starter n = ui $ CircleToggle False (col n)
                speed = ui $ DropDownList 0 ["1", "x2", "/2", "/4", "-/2", "-/4", "-/8"]
                pitch = ui $ DropDownList 0 ["1", "2", "0.5", "0.25", "1.5"]
                skip = ui $ DropDownList 0 ["0", "1", "2", "4", "8", "16"]
                fxs = ui $ DropDownList 0 ["dry", "pul", "gli", "bbc"]
                volume = ui $ HFader 0.5 "blue" (0, 1)

                col n
                    | n >= 0 && n < 3 = "orange"
                    | n >= 3 && n < 6 = "olive"
                    | otherwise       = "blue"


    -- multiUi (4, 4) (const $ ui $ Toggle False "blue" "")

loopKey = []

---------------------------------------

delLoopPage = Page "del-loop"  delLoopUi []

delLoopUi = ui $ Ver 
    [ multiUi (3, 2) (\n -> ui $    Button (loopColors n) (loopLabels n))
    , ui $ Label "black" "CLEAR ALL"
    , ui $ Button "navy" "" ]