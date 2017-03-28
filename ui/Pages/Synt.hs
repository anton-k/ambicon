module Pages.Synt where

import Dragon.Osc

syntPage = Page "synt" syntUi syntKeys

syntUi = ui $ DoubleCheck (0, 0) [4, 4, 4] "blue" "olive" [("pad 1", instrs), ("pad 2", instrs), ("fx", instrs)] (Orient True True True) Nothing
    where instrs = map show [1, 2, 3, 4]

syntKeys = []    

