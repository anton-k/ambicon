module Test where

import Csound.Base
import Haunt

path x = "/home/anton/music/samples/tamtamDrumKits44/" ++ x

fs1 = fmap path ["agogo aigu.wav", "agogo grave fermÇ.wav", "cowbell tip.wav", "cowbell.wav"]
fs2 = fmap path ["darbuka doom.wav", "darbuka_pied.wav", "darbuka_slap.wav", "darbuka_roll.wav"]
fs3 = fmap path ["vibraslap.wav", "Quica  grave.wav", "tambourine high.wav", "metal_stand.wav"]
fs4 = fmap path ["djembe low.wav", "djembe mid.wav", "djembe mute.wav"]

test1 = lift1 (haunt 2 (fs1, fs2, fs3, fs4)) $ ujoy (0, 0)