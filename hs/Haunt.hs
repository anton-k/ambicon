-- Two bugs happen:
--
-- no conversion from k to i rate
--
-- lots of duplicated expressions
--
module Haunt where

import Control.Arrow(first)
import Csound.Base
import Base

type Files = [FilePath]

haunt :: Sig -> Quad Files -> (Sig, Sig) -> SE Sig2
haunt density (fs1, fs2, fs3, fs4) (x, y) = do
    [arr1, arr2, arr3, arr4] <- mapM mkArray [fs1, fs2, fs3, fs4]    
    return $ sched (instr (arr1, arr2, arr3, arr4)) $ withDur 0.1 $ freqOfSigQuad $ dust density
    where
        mkArray x = fillGlobalArr [length x] (fmap text x)

        instr :: Quad (Arr D Str) -> D -> SE Sig2
        instr (arr1, arr2, arr3, arr4) arrId = do
            ref <- newRef (0 :: Sig2)
            whenD1 (arrId ==* 0) $ playArray ref arr1
            whenD1 (arrId ==* 1) $ playArray ref arr2
            whenD1 (arrId ==* 2) $ playArray ref arr3
            whenD1 (arrId ==* 3) $ playArray ref arr4
            readRef ref          
            where
                playArray :: Ref Sig2 -> Arr D Str -> SE ()
                playArray ref arr = do
                    file <- getRandElem arr
                    xtratim $ filelen file
                    writeRef ref $ fromMono $ diskin2 file 1

        getRandElem :: Tuple a => Arr D a -> SE a
        getRandElem arr = do
            idx <- fmap int' $ random 0 (lenarray arr - 0.01)
            readArr arr idx

        freqOfSigQuad :: Tick -> Evt D
        freqOfSigQuad = freqOf [(w1, 0), (w2, 1), (w3, 2), (w4, 3)]
            where (w1, w2, w3, w4) = getWeights (x, y)
      
        getWeights :: (Sig, Sig) -> Quad Sig
        getWeights (x, y) = ((1 - x) * (1 - y), x * (1 - y), x * y, (1 - x) * y)

