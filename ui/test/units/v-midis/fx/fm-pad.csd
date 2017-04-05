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
ar2 madsr 5.0, 0.0, 1.0, 3.0
ar4 = (0.5 * ar2)
ir11 = 1.0
ir12 cpsmidi 
ar5 upsamp k(ir12)
ar6 = (ar5 * 0.998)
ar7 = (3.0 * ar5)
ar8 = (ar7 * ar2)
ar2 = (ar5 * 1.0)
ar7 oscil3 ir11, ar2, 2
ar2 = (ar8 * ar7)
ar7 = (ar6 + ar2)
ar6 oscil3 ir11, ar7, 2
ar7 = (ar5 * 1.5007)
ar9 = (ar7 + ar2)
ar7 oscil3 ir11, ar9, 2
ar9 = (ar6 + ar7)
ar6 = (0.1 + ar2)
ar2 oscil3 ir11, ar6, 2
ar6 = (ar9 + ar2)
ar2 = (ar4 * ar6)
ar6 = (0.39 * ar2)
ir30 ampmidi 1.0
ar2 upsamp k(ir30)
ar7 = (ar6 * ar2)
ar6 = (0.5 * ar7)
ar7 = (ar5 * 0.987)
ar9 = (ar5 * 0.99)
ar10 oscil3 ir11, ar9, 2
ar9 = (ar8 * ar10)
ar8 = (ar7 + ar9)
ar7 oscil3 ir11, ar8, 2
ar8 = (ar5 * 1.498)
ar5 = (ar8 + ar9)
ar8 oscil3 ir11, ar5, 2
ar5 = (ar7 + ar8)
ar7 = (0.13 + ar9)
ar8 oscil3 ir11, ar7, 2
ar7 = (ar5 + ar8)
ar5 = (ar4 * ar7)
ar4 = (0.39 * ar5)
ar5 = (ar4 * ar2)
ar2 = (0.5 * ar5)
ar4 = (ar6 + ar2)
ar2 = (0.5 * ar4)
ar4 = (0.6 * ar2)
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
ar2 = (0.65 * ar0)
ir14 = 0.9
ir15 = 12000.0
ar3, ar4 reverbsc ar0, ar1, ir14, ir15
ar5 = (ar0 + ar3)
ar0 = (0.35 * ar5)
ar3 = (ar2 + ar0)
ir21 = 1.0
ar0 upsamp k(ir21)
ir22 = 0.0
ir23 = 90.0
ir24 = 100.0
ar2 compress ar3, ar0, ir22, ir23, ir23, ir24, ir22, ir22, 0.0
ar3 = (ar2 * 0.8)
arl0 = ar3
ar2 = (0.65 * ar1)
ar3 = (ar1 + ar4)
ar1 = (0.35 * ar3)
ar3 = (ar2 + ar1)
ar1 compress ar3, ar0, ir22, ir23, ir23, ir24, ir22, ir22, 0.0
ar0 = (ar1 * 0.8)
arl1 = ar0
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

</CsInstruments>

<CsScore>

f2 0 8192 10  1.0

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 18 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>