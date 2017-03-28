module Pages.Haunted where

import Dragon.Osc

-- haunted window

hauntedPage = Page "haunted" hauntedUi hauntedKeys

hauntedUi = pad
    where
        pad = ui (XYPad (0.5, 0.5) "orange")
        vols = multiUi (1, 4) (const $ ui $ Dial 0.5 "olive" (0, 1)) 

hauntedKeys = []