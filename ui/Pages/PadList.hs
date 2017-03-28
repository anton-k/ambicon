module Pages.PadList where

import Dragon.Osc

padListPage = Page "pad-list" padUis padKeys

padUis =  multiUi (4, 1) (const $ ui $ Ver [ui $ VCheck 0 8 "olive" (map (("pad " ++) . show) [1 .. 8]) Nothing, ui $ Dial 0.5 "navy" (0, 1)])

padKeys = []