module Pad where

import Control.Monad
import Csound.Base
import Csound.Patch
import Base

padSynt :: Sigs a => Quad a -> (Sig, Sig) -> SE a
padSynt = genPadSynt 0.2 0.25

genPadSynt :: Sigs a => Sig -> Sig -> Quad a -> (Sig, Sig) -> SE a
genPadSynt rad cps (a1, a2, a3, a4) (x, y) = do
    rx <- randomize x
    ry <- randomize y
    return $ cfd4 rx ry a1 a2 a3 a4
    where 
        randomize t = fmap ((t + ) . dcblock . integ) $ mul 0.01 $ randomi (-rad) rad cps

baseFreq = cpspch 6.04

pad :: Sig -> Patch2 -> Patch2 -> SE Sig2
pad t patch p2 = fmap sum $ sequence [atNote (dryPatch patch) (1, baseFreq), at (mlp (150 + 2500 * uosc t) 0.25) $ atNote (dryPatch p2) (0.5, baseFreq * 2)]

main = dac $ do
    p1 <- pad 0.14 whaleSongPad nightPad
    p2 <- pad 0.1 (dreamSharc shClarinet) (dreamSharc shOboe) 
    p3 <- pad 0.3 (LayerPatch [(0.5, fmDroneMedium), (0.5, dreamSharc shFlute)]) (pwPad) 
    p4 <- pad 0.17 caveOvertonePad  caveOvertonePad

    mapSource (cave 0.3 . mul (fadeIn 2)) $ lift1 (padSynt (p1, p2, p3, p4)) $ ujoy (0.2, 0.3)
