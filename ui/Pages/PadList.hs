module Pages.PadList(padListPage) where

import Dragon.Osc

padListPage = Page "pad-list" padUis padKeys

padUis =  multiUi (4, 1) (\n -> ui $ Ver [ui $ VCheck 0 8 "olive" (map (("pad " ++) . show) [1 .. 8]) Nothing, setMsg (flowMsg ("/vol/" ++ show (n + 1)) [Arg 0]) $ ui $ Dial 0.5 "navy" (0, 2)])

padKeys = []

flowMsg = Msg "quad-flow" 