module Pages.Haunted where

import Dragon.Osc

-- haunted window

hauntedPage = Page "haunted" hauntedUi hauntedKeys

hauntedUi = ui $ Ver [ pad, controls]
    where
        pad = setMsgs [hauntedMsg "/set-x" [Arg 0], hauntedMsg "/set-y" [Arg 1]] $ ui (XYPad (0.5, 0.5) "orange")
        vols = multiUi (1, 4) (const $ ui $ Dial 0.5 "olive" (0, 1)) 

        controls = ui $ Hor [play, tap, rate, skip]

        play = setOsc $ ui $ Toggle False "olive" "on"
            where setOsc = onBool (hauntedMsg "/start" [ArgInt 1]) (hauntedMsg "/stop" [ArgInt 1])

        tap  = setOsc $ ui $ Button "olive" "tap"
            where setOsc = setMsg (hauntedMsg "/tap" [ArgInt 1])

        rate = ui $ Hor [ui $ Label "navy" "rate", setOsc $ ui $ Dial 0.1 "navy" (0, 2)]
            where setOsc = setMsg (hauntedMsg "/set-rate" [Arg 0])

        skip = ui $ Hor [ui $ Label "navy" "skip", setOsc $ ui $ Dial 0.25 "navy" (0, 1)]
            where setOsc = setMsg (hauntedMsg "/set-skip" [Arg 0])


hauntedMsg = Msg "haunted"

hauntedKeys = []