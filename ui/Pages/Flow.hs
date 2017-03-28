module Pages.Flow where

import Dragon.Osc

-- quad flow window

flowPage = Page "flow"  flowUi flowKeys

flowUi = setMsg (flowMsg "/xy" [Arg 0, Arg 1])  $ ui (XYPad (0.5, 0.5) "olive")
flowKeys = []

flowMsg = Msg "quad-flow" 
