module Pages.Loop where

import Dragon.Osc

loopPage = Page "loop" loopUi loopKey

loopUi = multiUi (4, 4) (const $ ui $ Toggle False "blue" "")

loopKey = []