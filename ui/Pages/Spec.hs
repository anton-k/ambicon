module Pages.Spec(specPage) where

import Dragon.Osc    

specPage = Page "spec" specUi specKeys

lab name = ui $ Label "black" name

specUi = ui $ Ver [ scale, baseTone, tempo, ui Space ]

baseTone = setOsc $ ui $ HCheck 0 12 "orange" names Nothing
    where setOsc = setMsg (specMsg "/base-tone" [Arg 0])

names = ["a", "a#", "b", "c", "c#", "d", "d#", "e", "f", "f#", "g", "g#", "h"]

tempo = ui $ Hor [lab "tempo", setTempoOsc $ ui $ IntDial 120 "blue" (65, 240), ui $ IntDial 8 "olive" (1, 20)]
    where setTempoOsc = setMsg (specMsg "/tempo" [Arg 0])

scale = ui $ DropDownList 0 scaleNames

scaleNames = ["bhopali", "major", "minor", "kafi"]

specKeys = []

specMsg = Msg "spec"