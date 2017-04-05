<CsoundSynthesizer>

<CsOptions>

--output=dac:nil -+rtaudio=jack -+jack_client=synt -+jack_inportname=input -+jack_outportname=output --midi-device=0 -+rtmidi=virtual --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1.0
 massign 0, 19
gargg1 init 0.0
gargg0 init 0.0
giPort init 1
opcode FreePort, i, 0
xout giPort
giPort = giPort + 1
endop




instr 22

endin

instr 21
 event_i "i", 20, 604800.0, 1.0e-2
endin

instr 20
ir1 = 19
ir2 = 0.0
 turnoff2 ir1, ir2, ir2
ir5 = 18
 turnoff2 ir5, ir2, ir2
 exitnow 
endin

instr 19
ar0 = gargg0
ar1 = gargg1
ir5 active p1
ar2 upsamp k(ir5)
ar3 = sqrt(ar2)
ar2 = (1.0 / ar3)
if (ir5 < 2.0) then
    ar3 = 1.0
else
    ar3 = ar2
endif
ir9 ampmidi 1.0
ar2 upsamp k(ir9)
ar4 = (0.75 * ar2)
ir11 ampmidi 1.0
ir12 = (1.275 * ir11)
ir13 = (ir12 * ir11)
ir14 = (ir13 + 1.5)
ir15 cpsmidi 
ir16 = (ir15 / 10000.0)
ir17 = (ir14 - ir16)
kr0 linsegr 1.0, 1.0, 1.0, ir17, 0.0
ar2 upsamp kr0
ar5 = (ar4 * ar2)
ir20 = 1.0
ir21 = 0.0
ar2 mpulse ir20, ir21
ir23 cpsmidi 
ar4 butlp ar2, ir23
ar2 = (0.1 * ar4)
kr0 = (1.0 * ir23)
kr1 = (3.141592653589793 * kr0)
if (sr > kr1) then
    ar6 = 1.0
else
    ar6 = 0.0
endif
kr1 downsamp ar6
kr2 = (3.984 * ir23)
kr3 = (3.141592653589793 * kr2)
if (sr > kr3) then
    ar7 = 1.0
else
    ar7 = 0.0
endif
kr3 downsamp ar7
ar8 = (ar6 + ar7)
kr4 = (10.668 * ir23)
kr5 = (3.141592653589793 * kr4)
if (sr > kr5) then
    ar9 = 1.0
else
    ar9 = 0.0
endif
kr5 downsamp ar9
ar10 = (ar8 + ar9)
kr6 = (17.979 * ir23)
kr7 = (3.141592653589793 * kr6)
if (sr > kr7) then
    ar8 = 1.0
else
    ar8 = 0.0
endif
kr7 downsamp ar8
ar11 = (ar10 + ar8)
kr8 = (23.679 * ir23)
kr9 = (3.141592653589793 * kr8)
if (sr > kr9) then
    ar10 = 1.0
else
    ar10 = 0.0
endif
kr9 downsamp ar10
ar12 = (ar11 + ar10)
kr10 = (33.642 * ir23)
kr11 = (3.141592653589793 * kr10)
if (sr > kr11) then
    ar11 = 1.0
else
    ar11 = 0.0
endif
kr11 downsamp ar11
ar13 = (ar12 + ar11)
ar12 = (1.0 / ar13)
kr12 = (1.0 - kr1)
kr13 = (kr1 * kr0)
kr0 = (kr12 + kr13)
ir53 = 2000.0
ar13 mode ar4, kr0, ir53
ar14 = (ar6 * ar13)
kr0 = (1.0 - kr3)
kr1 = (kr3 * kr2)
kr2 = (kr0 + kr1)
ar6 mode ar4, kr2, ir53
ar13 = (ar7 * ar6)
ar6 = (ar14 + ar13)
kr0 = (1.0 - kr5)
kr1 = (kr5 * kr4)
kr2 = (kr0 + kr1)
ar7 mode ar4, kr2, ir53
ar13 = (ar9 * ar7)
ar7 = (ar6 + ar13)
kr0 = (1.0 - kr7)
kr1 = (kr7 * kr6)
kr2 = (kr0 + kr1)
ar6 mode ar4, kr2, ir53
ar9 = (ar8 * ar6)
ar6 = (ar7 + ar9)
kr0 = (1.0 - kr9)
kr1 = (kr9 * kr8)
kr2 = (kr0 + kr1)
ar7 mode ar4, kr2, ir53
ar8 = (ar10 * ar7)
ar7 = (ar6 + ar8)
kr0 = (1.0 - kr11)
kr1 = (kr11 * kr10)
kr2 = (kr0 + kr1)
ar6 mode ar4, kr2, ir53
ar4 = (ar11 * ar6)
ar6 = (ar7 + ar4)
ar4 = (ar12 * ar6)
ar6 = (0.9 * ar4)
ar4 = (ar2 + ar6)
ar2 = (15.0 * ar4)
ar4 = (ar5 * ar2)
ar2 = (0.75 * ar4)
ar4 = (0.75 * ar2)
ar2 = (ar3 * ar4)
ar3 = (ar0 + ar2)
gargg0 = ar3
ar0 = (ar1 + ar2)
gargg1 = ar0
endin

instr 18
ar0 = gargg0
ar1 = gargg1
gargg0 = 0.0
gargg1 = 0.0
arl0 init 0.0
arl1 init 0.0
ar2 = (0.75 * ar0)
ar3 = (0.65 * ar0)
ir15 = 0.25
ar4 upsamp k(ir15)
ir16 = 0.55
ar5 flanger ar0, ar4, ir16, 0.255
ar6 = (ar0 + ar5)
ar0 = (0.35 * ar6)
ar5 = (ar3 + ar0)
ar0 = (0.65 * ar1)
ar3 flanger ar1, ar4, ir16, 0.255
ar4 = (ar1 + ar3)
ar3 = (0.35 * ar4)
ar4 = (ar0 + ar3)
ir26 = 0.8
ir27 = 12000.0
ar0, ar3 reverbsc ar5, ar4, ir26, ir27
ar6 = (ar5 + ar0)
ar0 = (0.25 * ar6)
ar5 = (ar2 + ar0)
ir33 = 1.0
ar0 upsamp k(ir33)
ir34 = 0.0
ir35 = 90.0
ir36 = 100.0
ar2 compress ar5, ar0, ir34, ir35, ir35, ir36, ir34, ir34, 0.0
ar5 = (ar2 * 0.8)
arl0 = ar5
ar2 = (0.75 * ar1)
ar1 = (ar4 + ar3)
ar3 = (0.25 * ar1)
ar1 = (ar2 + ar3)
ar2 compress ar1, ar0, ir34, ir35, ir35, ir36, ir34, ir34, 0.0
ar0 = (ar2 * 0.8)
arl1 = ar0
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

</CsInstruments>

<CsScore>



f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 18 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>