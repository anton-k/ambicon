module Pad where

import Control.Monad
import Csound.Base
import Csound.Patch
import Base

main = renderApp

renderApp = writeCsdBy jackOptions "quad-flow.csd" jackPad

oscRef = initOsc 5400

getSig  = listenOscSig oscRef
getSig2 = listenOscSig2 oscRef 

jackOptions = setJack "quad-flow" <> setDacBy "nil" <> setAdcBy "nil"

jackPad :: Quad Sig2 -> SE (Quad Sig2)
jackPad (ain1, ain2, ain3, ain4) = do
    (x, y) <- getSig2 "/xy" (0.5, 0.5)   
    when1 (changed [x, y] ==* 1) $ printks (text "change: %f, %f |  ")  0 [x, y]
    [vol1, vol2, vol3, vol4] <- mapM  volChannel [1 .. 4]
    (aL, aR) <- padSynt (mul vol1 ain1, mul vol2 ain2, mul vol3 ain3, mul vol4 ain4) (x, y)
    return ((aL, aR), zero, zero, zero)
    where 
        zero = (0, 0)
        volChannel n = getSig ("/vol/" ++ show n) 1


padSynt :: Sigs a => Quad a -> (Sig, Sig) -> SE a
padSynt = genPadSynt 0.07 0.125

genPadSynt :: Sigs a => Sig -> Sig -> Quad a -> (Sig, Sig) -> SE a
genPadSynt rad cps (a1, a2, a3, a4) (x, y) = do
    rx <- randomize x
    ry <- randomize y
    return $ cfd4 rx ry a1 a2 a3 a4
    where 
        randomize t = fmap (t +) $ rspline (-rad) rad (cps / 3) cps

baseFreq = cpspch 6.04

pad :: Sig -> Patch2 -> Patch2 -> SE Sig2
pad t patch p2 = fmap sum $ sequence [atNote (dryPatch patch) (1, baseFreq), at (mlp (150 + 2500 * uosc t) 0.25) $ atNote (dryPatch p2) (0.5, baseFreq * 2)]

main1 = dac $ do
    p1 <- pad 0.14 whaleSongPad nightPad
    p2 <- pad 0.1 (dreamSharc shClarinet) (dreamSharc shOboe) 
    p3 <- pad 0.3 (LayerPatch [(0.5, fmDroneMedium), (0.5, dreamSharc shFlute)]) (pwPad) 
    p4 <- pad 0.17 caveOvertonePad  caveOvertonePad

    mapSource (cave 0.3 . mul (fadeIn 2)) $ lift1 (padSynt (p1, p2, p3, p4)) $ ujoy (0.2, 0.3)

