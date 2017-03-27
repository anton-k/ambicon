module Pages.Flow where

import Dragon.Osc

-- quad flow window

flowPage = Page "flow"  flowUi flowKeys

flowUi = ui (XYPad (0.5, 0.5) "olive")
flowKeys = []
