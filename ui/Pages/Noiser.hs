module Pages.Noiser where

import Dragon.Osc

noiserPage = Page "noiser" noiserUi noiserKeys

noiserUi = ui (Ver [noiserList, noiserTweaks])
    where
        noiserList = ui $ HCheck 0 4 "blue" ["foo", "baz", "bar", "cux"] Nothing

        noiserTweaks = multiUi (4, 1) (const $ ui $ Dial 0.5 "olive" (0, 1))

noiserKeys = []