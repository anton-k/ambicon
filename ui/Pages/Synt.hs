module Pages.Synt(syntPage) where

import Dragon.Osc

import ReadDir

syntPage units = Page "synt" (syntUi units) syntKeys

syntUi :: [(String, [FileSrc])] -> Ui
syntUi units = setOsc $ ui $ DoubleCheck (0, 0) lens "blue" "olive"  names (Orient True True True) Nothing
    where         
        lens = fmap (length . snd) units
        names = fmap (\(name, subs) -> (name, fmap fileSrcName subs)) units
        categoryLen = length units

        setOsc = setSend (Send defaultMsgs onValues [])

        onValues = concat $ zipWith go [0 .. ] units
            where
                go :: Int -> (String, [FileSrc]) -> [(String, [Msg])]
                go n (name, subs) = fmap f [0 .. length subs - 1]
                    where 
                        f x = (value n x, msgs n x)

                value n x = show n ++ " " ++ show x                

        midiVol x = mixerMsg "/track/volume" [ArgInt 4, ArgFloat (127 * x)]
        
        msgs n x = [                
                    midiVol 0,
                    delCmdMsg 0.1 "/process/kill" [ArgString procName],
                    delCmdMsg 0.1 "/process/run" [ArgString $ procName, ArgString $ "csound -+jack_client=" ++ jackName ++ " " ++  (fileSrcPath $ (snd $ units !! n) !! x) ],
                    delCmdMsg 0.1 "/run" [ArgString "aj-snapshot -r test/jack-config/flow-test.xml"],
                    midiVol 0.75 ]

        defaultMsgs = [midiVol 0, cmdMsg "/process/kill" [ArgString  procName], midiVol 0.75]

        procName = "synt"
        jackName = procName

mixerMsg = Msg "mixer"
cmdMsg = Msg "cmd"
delCmdMsg n = DelayedMsg n "cmd"

syntKeys = []    

