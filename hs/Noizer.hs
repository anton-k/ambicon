-- make several noise models


let q = mul 0.5 $ mapSource (hall 0.25) $  hlifts (\[a, b] -> at (mlp ((2500 + 500 * uosc 0.1) * expcurve a 4) (b + 0.15 * uosc 0.17)) pink) $ fmap uknob [0.5, 0.2]

dac $ mapSource (fmap $ pongy2m 0.5 1.5 0.6 . pongy1 0.5 0.5 0.75)  $ hlift2 (+) q q
