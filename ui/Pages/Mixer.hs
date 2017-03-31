module Pages.Mixer where

import Dragon.Osc

-- mixer window

mixerPage = Page "mixer" mixerUi mixerKeys

mixerUi = multiUi (7, 1) strip
    where
        strip n = ui $ Ver [label n, vol n, mute n]
            where
                isMaster n = n == 6

                label n = ui $ Label "navy" (labels !! n)

                vol n
                    | isMaster n = setMasterOsc $ ui $ VFader 85 "blue"  (1, 127)
                    | otherwise  = setOsc n $ ui $ VFader 85 "olive" (1, 127)
                    where 
                        setOsc n = setMsg (mixerMsg "/track/volume" [ArgInt n, Arg 0])
                        setMasterOsc = setMsg (mixerMsg "/master/volume" [Arg 0])

                mute n  
                    | isMaster n = setMasterOsc muteUi
                    | otherwise  = setOsc n muteUi
                    where
                        muteUi = ui $ Toggle False "navy" ""

                        setOsc n = setMsg (mixerMsg "/track/mute" [ArgInt n, Arg 0])
                        setMasterOsc = setMsg (mixerMsg "/master/mute" [Arg 0])
                
                labels = ["flow", "haunt", "noise", "bass", "synt", "loop", "master"]

mixerMsg = Msg "mixer"

mixerKeys = []