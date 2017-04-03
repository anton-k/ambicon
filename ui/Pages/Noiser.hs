module Pages.Noiser where

import Dragon.Osc

noiserPage = Page "noiser" noiserUi noiserKeys

noiserUi = ui (Ver [noiserList, noiserTweaks])
    where        
        noiserList = setOsc $ ui $ HCheck (-1) noiserSize "blue" names Nothing
            where
                setOsc = setSend (Send defaultMsgs onValues [])

                onValues = map (\n -> (show n, [
                        cmdMsg "/process/kill" [ArgString "noiser"],
                        delCmdMsg 0.1 "/process/run" [ArgString "noiser", ArgString $ "csound test/units/noisers/" ++ files !! n],
                        delCmdMsg 0.1 "/run" [ArgString "aj-snapshot -r test/jack-config/flow-test.xml"]
                    ])) [0 .. noiserSize - 1]

                defaultMsgs = [cmdMsg "/process/kill" [ArgString "noiser"]]

        noiserTweaks = multiUi (4, 1) (\n -> setMsg (setOsc n) $ ui $ Dial 0.5 "olive" (0, 1))
            where
                setOsc n = case n of
                    0 -> noiserMsg "/frequency/1" [Arg 0]
                    1 -> noiserMsg "/resonance/1" [Arg 0]
                    2 -> noiserMsg "/frequency/2" [Arg 0]
                    3 -> noiserMsg "/resonance/2" [Arg 0]


units = fmap (\x -> (x, x ++ ".csd")) ["pink", "white"]
names = map fst units
files = map snd units
noiserSize = length units

noiserKeys = []

noiserMsg = Msg "noiser"
cmdMsg = Msg "cmd"
delCmdMsg n = DelayedMsg n "cmd"