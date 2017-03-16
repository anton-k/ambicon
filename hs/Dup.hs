module Dup where

import Csound.Base

main = dac $ do
    ref <- newRef (0 :: Sig2)
    k <- chnGetD $ text "q"        
    
    whenD1 ((1::D) >=* k) $ proc ref
    whenD1 ((1::D) <=* k) $ proc ref
    readRef ref
    where
        proc ref = writeRef ref $ diskin2 (text "/home/anton/loop.wav") 1
