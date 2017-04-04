module Spec where

import Csound.Base

main = writeCsdBy jackOptions "spec.csd" specInstr

jackOptions = setJack "spec" <> setDacBy "nil"

oscRef = initOsc 4400

getSig name defaultValue = listenOscSig oscRef name defaultValue

freqs :: Tab
freqs = doubles $ map (\x -> 110 * 2 ** (x/ 12) ) [0 .. 12]

specInstr = do
    idx <- getSig "/base-tone" 0
    bpm <- getSig "/tempo" 120
    return (tablei idx freqs, metroSig (4 * bpm / 120))


