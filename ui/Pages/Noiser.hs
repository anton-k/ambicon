module Pages.Noiser(noiserPage) where

import Dragon.Osc

import ReadDir(FileSrc(..))

noiserPage units = Page "noiser" (noiserUi units) noiserKeys

noiserUi units = ui (Ver [noiserList, noiserTweaks])
    where        
        names = fmap fileSrcName units
        noiserSize = length units
        files = map fileSrcPath units

        noiserList = setOsc $ ui $ HCheck (-1) noiserSize "blue" names Nothing
            where
                setOsc = setSend (Send defaultMsgs onValues [])

                onValues = map (\n -> (show n, [
                        noiseVol 0,
                        delCmdMsg 0.1 "/process/kill" [ArgString "noiser"],
                        delCmdMsg 0.1 "/process/run" [ArgString "noiser", ArgString $ "csound " ++ files !! n],
                        delCmdMsg 0.1 "/run" [ArgString "aj-snapshot -r test/jack-config/flow-test.xml"],
                        noiseVol 0.85
                    ])) [0 .. noiserSize - 1]

                noiseVol x = mixerMsg "/track/volume" [ArgInt 2, ArgFloat (127 * x)]

                defaultMsgs = [noiseVol 0, cmdMsg "/process/kill" [ArgString "noiser"], noiseVol 0.85]

        noiserTweaks = multiUi (4, 1) (\n -> setMsg (setOsc n) $ ui $ Dial 0.5 "olive" (0, 1))
            where
                setOsc n = case n of
                    0 -> noiserMsg "/frequency/1" [Arg 0]
                    1 -> noiserMsg "/resonance/1" [Arg 0]
                    2 -> noiserMsg "/frequency/2" [Arg 0]
                    3 -> noiserMsg "/resonance/2" [Arg 0]


mixerMsg = Msg "mixer"

noiserKeys = []

noiserMsg = Msg "noiser"
cmdMsg = Msg "cmd"
delCmdMsg n = DelayedMsg n "cmd"