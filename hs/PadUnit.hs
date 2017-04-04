module PadUnit where

import Csound.Base

main = do
    renderApp 1 pad1
    renderApp 2 pad2
    renderApp 3 pad3
    renderApp 4 pad4

renderApp :: Int -> (Sig -> SE Sig2) -> IO ()
renderApp n instr = writeCsdBy jackOptions (name ++ ".csd") instr'
    where 
        instr' :: Sig2 -> SE Sig2
        instr' (baseTone, _) = mul (fadeIn 0.5) $ instr baseTone

        jackOptions = setJack name <> setDacBy "nil" <> setAdcBy "nil"

        name = "pad-" ++ show n

pad1 = mkPad testDrone
pad2 = mkPad testDrone2

pad3 _ = at fromMono $ at (mlp (5500 * uosc 0.1) 0.15) pink
pad4 cps = mul (smooth 0.01 $ upw 0.1 1) $ mkPad testDrone3 (cps * 2)

mkPad :: (D -> SE Sig2) -> Sig -> SE Sig2
mkPad drone baseTone = do
    (ref, res) <- newOutInstr $ \cps -> mul (fades 0.5 1) $ drone cps 

    runEvt e $ \cps -> do
        turnoff2 ref 0 1
        scheduleEvent ref 0.01 (-1) cps

    return res    
    where 
        e = snaps $ delaySnd 0.1 $ baseTone
