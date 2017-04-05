module Pages.PadList(padListPage) where

import Data.Ord
import Data.List

import Dragon.Osc

import ReadDir

padListPage units = Page "pad-list" (padUis units') padKeys
    where units' = fmap (sortBy $ comparing fileSrcName) $ fmap snd $ sortBy (comparing fst) units

padUis units =  multiUi (padSize, 1) (\n -> 
        let len = length $ units !! n
            names = fmap fileSrcName $ units !! n
            files = fmap fileSrcPath $ units !! n
        in ui $ Ver [
                setSend (cmdRun files n) $ ui $ VCheck (n `mod` len) len "olive" names Nothing, 
                setMsg (flowMsg ("/vol/" ++ show (n + 1)) [Arg 0]) $ ui $ Dial 1.25 "navy" (0, 2)])
    where
        padSize = length units



cmdRun files flowIdx = Send defaultMsgs onValue []
    where
        onValue = map (\n -> (show n, [                
                    padVol 0,
                    delCmdMsg 0.1 "/process/kill" [ArgString procName],
                    delCmdMsg 0.1 "/process/run" [ArgString $ procName, ArgString $ "csound -+jack_client=" ++ jackName ++ " " ++ files !! n],
                    delCmdMsg 0.1 "/run" [ArgString "aj-snapshot -r test/jack-config/flow-test.xml"],
                    padVol 1.15
                    ])) [0 .. len - 1]

        defaultMsgs = [padVol 0, cmdMsg "/process/kill" [ArgString  procName], padVol 1.15]

        procName = "pad-" ++ show flowIdx
        jackName = "pad-" ++ (show $ flowIdx + 1)

        len = length files

        padVol x = flowMsg ("/vol/" ++ show (flowIdx + 1)) [ArgFloat x]

padKeys = []

flowMsg = Msg "quad-flow" 
cmdMsg  = Msg "cmd" 
delCmdMsg n = DelayedMsg n "cmd"