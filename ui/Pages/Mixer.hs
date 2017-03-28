module Pages.Mixer where

import Dragon.Osc

-- mixer window

mixerPage = Page "mixer" mixerUi mixerKeys

mixerUi = multiUi (7, 1) strip
    where
        strip n = ui $ Ver [vol n, mute n]
            where
                isMaster n = n == 6

                vol n
                    | isMaster n = ui $ VFader 0.75 "blue"  (0, 1)
                    | otherwise  = ui $ VFader 0.75 "olive" (0, 1)

                mute n = ui $ Toggle False "navy" (labels !! n)

                masterVol = ui $ VFader 0.75 "blue" (0, 1)

                labels = ["flow", "haunt", "noise", "bass", "synt", "loop", "master"]

mixerKeys = []