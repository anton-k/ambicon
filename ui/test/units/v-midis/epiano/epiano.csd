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
gargg3 init 0.0
gargg2 init 0.0
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
kr0 linsegr 1.0, 1.0, 1.0, 0.75, 0.0
ar2 upsamp kr0
ar4 = (0.8 * ar2)
ir11 ampmidi 1.0
ar2 upsamp k(ir11)
ir12 = 0.0
ar5 mpulse k(ksmps), ir12, 0.0
kr0 downsamp ar5, ksmps
ar5 upsamp kr0
ir15 cpsmidi 
ar6 upsamp k(ir15)
ir16 = 120.0
ar7 bqrez ar5, ir15, ir16, 2.0
ar8 balance ar7, ar5
ar5 = (ar2 * ar8)
ar7 = (ar4 * ar5)
ar4 = (ar3 * ar7)
ar5 = (ar0 + ar4)
gargg0 = ar5
ar0 = (ar1 + ar4)
gargg1 = ar0
ir28 = 1.0
kr0 = rnd(ir28)
ir31 = rnd(ir28)
kr1 = rnd(ir28)
ir35 = rnd(ir28)
kr2 = rnd(ir28)
ir39 = rnd(ir28)
kr3 = rnd(ir28)
ir43 = rnd(ir28)
kr4 = rnd(ir28)
ir47 = rnd(ir28)
kr5 = rnd(ir28)
ir51 = rnd(ir28)
kr6 = rnd(ir28)
ir55 = rnd(ir28)
kr7 = rnd(ir28)
ir59 = rnd(ir28)
kr8 = rnd(ir28)
ir63 = rnd(ir28)
kr9 = rnd(ir28)
ir67 = rnd(ir28)
kr10 = rnd(ir28)
ir71 = rnd(ir28)
kr11 = rnd(ir28)
ir75 = rnd(ir28)
ar0 = gargg2
ar1 = gargg3
ir81 ampmidi 1.0
ir82 = (ir81 + 2.0)
ir83 cpsmidi 
ir84 = (ir83 / 3500.0)
ir85 = (ir84 ^ 2.0)
ir86 = (3.0 * ir85)
ir87 = (0.7 - ir86)
ir88 = (ir82 + ir87)
if (ir88 >= 0.1) then
    ir89 = ir88
else
    ir89 = 0.1
endif
ir90 = (ir81 / 5.0)
ir91 = (ir90 + 5.0e-2)
ir92 = (ir84 / 10.0)
ir93 = (ir91 - ir92)
if (ir93 >= 2.0e-2) then
    ir94 = ir93
else
    ir94 = 2.0e-2
endif
ir95 = (0.25 + ir94)
ar4 madsr 1.0e-3, ir89, 0.25, ir95
ar5 = (ar2 * ar4)
kr12 = (2.0 * kr0)
kr0 = (kr12 - 1.0)
ar2 upsamp kr0
ar4 = (5.0 * ar2)
ar2 = cent(ar4)
ar4 = (ar6 * ar2)
ar2 = (1.0 * ar4)
ar4 oscil3 ir28, ar2, 2, ir31
kr0 = (2.0 * kr1)
kr1 = (kr0 - 1.0)
ar2 upsamp kr1
ar7 = (5.0 * ar2)
ar2 = cent(ar7)
ar7 = (ar6 * ar2)
ar2 = (1.0 * ar7)
ar7 oscil3 ir28, ar2, 2, ir35
ar2 = (ar4 + ar7)
kr0 = (2.0 * kr2)
kr1 = (kr0 - 1.0)
ar4 upsamp kr1
ar7 = (5.0 * ar4)
ar4 = cent(ar7)
ar7 = (ar6 * ar4)
ar4 = (1.0 * ar7)
ar7 oscil3 ir28, ar4, 2, ir39
ar4 = (ar2 + ar7)
kr0 = (2.0 * kr3)
kr1 = (kr0 - 1.0)
ar2 upsamp kr1
ar7 = (5.0 * ar2)
ar2 = cent(ar7)
ar7 = (ar6 * ar2)
ar2 = (1.0 * ar7)
ar7 oscil3 ir28, ar2, 2, ir43
ar2 = (ar4 + ar7)
ar4 = (ar2 / 4.0)
ar2 = (1.0 * ar4)
kr0 = (2.0 * kr4)
kr1 = (kr0 - 1.0)
ar4 upsamp kr1
ar7 = (10.0 * ar4)
ar4 = cent(ar7)
ar7 = (ar6 * ar4)
ar4 = (2.01 * ar7)
ar7 oscil3 ir28, ar4, 2, ir47
kr0 = (2.0 * kr5)
kr1 = (kr0 - 1.0)
ar4 upsamp kr1
ar8 = (10.0 * ar4)
ar4 = cent(ar8)
ar8 = (ar6 * ar4)
ar4 = (2.01 * ar8)
ar8 oscil3 ir28, ar4, 2, ir51
ar4 = (ar7 + ar8)
kr0 = (2.0 * kr6)
kr1 = (kr0 - 1.0)
ar7 upsamp kr1
ar8 = (10.0 * ar7)
ar7 = cent(ar8)
ar8 = (ar6 * ar7)
ar7 = (2.01 * ar8)
ar8 oscil3 ir28, ar7, 2, ir55
ar7 = (ar4 + ar8)
kr0 = (2.0 * kr7)
kr1 = (kr0 - 1.0)
ar4 upsamp kr1
ar8 = (10.0 * ar4)
ar4 = cent(ar8)
ar8 = (ar6 * ar4)
ar4 = (2.01 * ar8)
ar8 oscil3 ir28, ar4, 2, ir59
ar4 = (ar7 + ar8)
kr0 = (2.0 * kr8)
kr1 = (kr0 - 1.0)
ar7 upsamp kr1
ar8 = (10.0 * ar7)
ar7 = cent(ar8)
ar8 = (ar6 * ar7)
ar7 = (2.01 * ar8)
ar8 oscil3 ir28, ar7, 2, ir63
ar7 = (ar4 + ar8)
kr0 = (2.0 * kr9)
kr1 = (kr0 - 1.0)
ar4 upsamp kr1
ar8 = (10.0 * ar4)
ar4 = cent(ar8)
ar8 = (ar6 * ar4)
ar4 = (2.01 * ar8)
ar8 oscil3 ir28, ar4, 2, ir67
ar4 = (ar7 + ar8)
kr0 = (2.0 * kr10)
kr1 = (kr0 - 1.0)
ar7 upsamp kr1
ar8 = (10.0 * ar7)
ar7 = cent(ar8)
ar8 = (ar6 * ar7)
ar7 = (2.01 * ar8)
ar8 oscil3 ir28, ar7, 2, ir71
ar7 = (ar4 + ar8)
kr0 = (2.0 * kr11)
kr1 = (kr0 - 1.0)
ar4 upsamp kr1
ar8 = (10.0 * ar4)
ar4 = cent(ar8)
ar8 = (ar6 * ar4)
ar4 = (2.01 * ar8)
ar6 oscil3 ir28, ar4, 2, ir75
ar4 = (ar7 + ar6)
ar6 = (ar4 / 8.0)
ar4 = (1.0 * ar6)
ar6 = (ar2 + ar4)
ar2 madsr 8.5e-2, 3.0, 0.0, 0.1
ar4 = (4500.0 * ar2)
ar2 = (2500.0 + ar4)
ir200 = 0.25
ar4 moogvcf ar6, ar2, ir200
ar2 = (ar5 * ar4)
ar4 = (1.125 * ar2)
ar2 = (ar3 * ar4)
ar3 = (ar0 + ar2)
gargg2 = ar3
ar0 = (ar1 + ar2)
gargg3 = ar0
endin

instr 18
ar0 = gargg0
ar1 = gargg1
gargg0 = 0.0
gargg1 = 0.0
ar2 = gargg2
ar3 = gargg3
gargg2 = 0.0
gargg3 = 0.0
arl0 init 0.0
arl1 init 0.0
ar4 = (0.7 * ar0)
ir22 = 0.8
ir23 = 12000.0
ar5, ar6 reverbsc ar0, ar1, ir22, ir23
ar7 = (ar0 + ar5)
ar0 = (0.3 * ar7)
ar5 = (ar4 + ar0)
ar0 = (0.15 * ar5)
ar4 = (0.75 * ar2)
ar5, ar7 reverbsc ar2, ar3, ir22, ir23
ar8 = (ar2 + ar5)
ar2 = (0.25 * ar8)
ar5 = (ar4 + ar2)
ar2 = (1.0 * ar5)
ar4 = (ar0 + ar2)
ar0 = (0.4 * ar4)
ar2 = (1.0 * ar0)
ir40 = 1.0
ar0 upsamp k(ir40)
ir41 = 0.0
ir42 = 90.0
ir43 = 100.0
ar4 compress ar2, ar0, ir41, ir42, ir42, ir43, ir41, ir41, 0.0
ar2 = (ar4 * 0.8)
arl0 = ar2
ar2 = (0.7 * ar1)
ar4 = (ar1 + ar6)
ar1 = (0.3 * ar4)
ar4 = (ar2 + ar1)
ar1 = (0.15 * ar4)
ar2 = (0.75 * ar3)
ar4 = (ar3 + ar7)
ar3 = (0.25 * ar4)
ar4 = (ar2 + ar3)
ar2 = (1.0 * ar4)
ar3 = (ar1 + ar2)
ar1 = (0.4 * ar3)
ar2 = (1.0 * ar1)
ar1 compress ar2, ar0, ir41, ir42, ir42, ir43, ir41, ir41, 0.0
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