{-# Language FlexibleContexts #-}
-- make several noise models

import Csound.Base

fx :: Sigs a => a -> a
fx = pongy2m 0.5 1.5 0.6 . pongy1 0.5 0.5 0.75

noiseBy cfq noiseGen a b = at fromMono $ at (mlp ((cfq + 500 * uosc 0.1) * expcurve a 4) (b + 0.15 * uosc 0.17)) noiseGen

pinkNoiser  = noiseBy 2500 pink
whiteNoiser = noiseBy 1200 white


uiEnv :: (Sig -> Sig -> SE Sig2) -> Source (SE Sig2)
uiEnv noiser = mapSource (fmap fx) $ hlift2 (+) q q
    where q = mul 0.5 $ mapSource (hall 0.25) $  hlifts (\[a, b] -> noiser a b) $ fmap uknob [0.5, 0.2]

uiPinkNoiser  = uiEnv pinkNoiser
uiWhiteNoiser = uiEnv whiteNoiser

oscRef = initOsc 6400
getSig  = listenOscSig oscRef

oscEnv :: (Sig -> Sig -> SE Sig2) -> SE Sig2
oscEnv noiser = do
    res1 <- getFilt 1
    res2 <- getFilt 2
    return $ fx $ res1 + res2
    where 
        getFilt n = do
            freq  <- getSig ("/frequency/" ++ show n) 0.5
            reson <- getSig ("/resonance/" ++ show n) 0.1
            noiser freq reson

oscPink  = oscEnv pinkNoiser
oscWhite = oscEnv whiteNoiser

jackOptions = setJack "noise" <> setDacBy "nil" 

runOsc name noiser = writeCsdBy jackOptions name noiser

main = do
    runOsc "pink.csd"  oscPink
    runOsc "white.csd" oscWhite
