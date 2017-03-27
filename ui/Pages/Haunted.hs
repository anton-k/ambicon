module Pages.Haunted where

import Dragon.Osc

-- haunted window

hauntedPage = Page "haunted" hauntedUi hauntedKeys

hauntedUi = ui (XYPad (0.5, 0.5) "orange")
hauntedKeys = []