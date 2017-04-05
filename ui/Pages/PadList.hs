module Pages.PadList(padListPage) where

import Dragon.Osc

padListPage _ = Page "pad-list" padUis padKeys

padUis =  multiUi (4, 1) (\n -> ui $ Ver [
        setSend (cmdRun n) $ ui $ VCheck n 8 "olive" (map (("pad " ++) . show) [1 .. 8]) Nothing, 
        setMsg (flowMsg ("/vol/" ++ show (n + 1)) [Arg 0]) $ ui $ Dial 1.25 "navy" (0, 2)])

cmdRun flowIdx = Send [] onValue []
    where
        onValue = map (\n -> (show n, [                
                    flowMsg ("/vol/" ++ show (flowIdx + 1)) [ArgFloat 0],
                    delCmdMsg 0.1 "/process/kill" [ArgString $ "pad-" ++ show flowIdx],
                    delCmdMsg 0.1 "/process/run" [ArgString $ "pad-" ++ show flowIdx, ArgString $ "csound -+jack_client=pad-" ++ (show $ flowIdx + 1) ++ " test/units/pads/pad-" ++ (show $ 1 + n) ++ ".csd"],
                    delCmdMsg 0.1 "/run" [ArgString "aj-snapshot -r test/jack-config/flow-test.xml"],
                    flowMsg ("/vol/" ++ show (flowIdx + 1)) [ArgFloat 1.15]
                    ])) [0 .. 7]



padKeys = []

flowMsg = Msg "quad-flow" 
cmdMsg  = Msg "cmd" 
delCmdMsg n = DelayedMsg n "cmd"