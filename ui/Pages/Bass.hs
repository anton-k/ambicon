module Pages.Bass where

import Dragon.Osc

-- bass window    

bassPage = Page "bass" bassUi bassKeys

bassUi = multiUi (1, 4) param
    where
        param n = ui $ Hor [ui $ Label "navy" (labels !! n), ui $ HFader 0.5 "orange" (0, 1)]

        labels = ["p1", "p2", "p3", "p4"]

bassKeys = []