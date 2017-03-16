module Pad where

import Csound.Base
import Base

padSynt :: Quad a -> (Sig, Sig) -> SE a
padSynt = genPadSynt 0.2 0.17

genPadSynt :: Sigs a => Sig -> Sig -> Quad a -> (Sig, Sig) -> SE a
genPadSynt rad cps (a1, a2, a3, a4) (x, y) = do
    rx <- randomize x
    ry <- randomize y
    return $ cfd4 rx ry a1 a2 a3 a4
    where 
        randomize t = fmap ((t + ) . integ) $ randomi (-rad) rad cps



