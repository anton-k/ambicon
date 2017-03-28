module Pages.Mixer where

import Dragon.Osc

-- mixer window

mixerPage = Page "mixer" mixerUi mixerKeys

mixerUi = multiUi (7, 1) strip
    where
        strip n = ui $ Ver [label n, vol n, mute]
            where
                isMaster n = n == 6

                label n = ui $ Label "navy" (labels !! n)

                vol n
                    | isMaster n = ui $ VFader 0.75 "blue"  (0, 1)
                    | otherwise  = ui $ VFader 0.75 "olive" (0, 1)

                mute = ui $ Toggle False "navy" ""

                masterVol = ui $ VFader 0.75 "blue" (0, 1)

                labels = ["flow", "haunt", "noise", "bass", "synt", "loop", "master"]

mixerKeys = []