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
girgfree_vco = 105
ir17 = girgfree_vco
ir19 vco2init 1, ir17
girgfree_vco = ir19
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
ir1 = 1.0
ir2 = rnd(ir1)
ir4 = rnd(ir1)
ir6 = rnd(ir1)
ir8 = rnd(ir1)
ir10 = rnd(ir1)
ir12 = rnd(ir1)
ir14 = 0.0
ar0 noise ir1, ir14
ar1 = gargg0
ar2 = gargg1
ir21 active p1
ar3 upsamp k(ir21)
ar4 = sqrt(ar3)
ar3 = (1.0 / ar4)
if (ir21 < 2.0) then
    ar4 = 1.0
else
    ar4 = ar3
endif
kr0 linseg 0.0, 0.85, 1.0, 1.0, 1.0
ar3 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.95, 0.0
ar5 upsamp kr0
ar6 = (ar3 * ar5)
ir28 = 2400.0
ir29 = 0.1
ar3 bqrez ar0, ir28, ir29
ar0 = (0.35 * ar3)
ir32 cpsmidi 
ar3 oscil3 ir1, ir29, 4
ar5 = (5.0e-2 * ar3)
ar3 = (0.35 + ar5)
ar5 oscil3 ir1, ar3, 4
kr0 downsamp ar5
kr1 = (5.0e-3 * kr0)
kr0 = (1.0 + kr1)
kr1 = (ir32 * kr0)
ir40 = 50.0
kr0 = cent(ir40)
kr2 = (kr0 * -1.0)
kr3 = (kr1 + kr2)
kr4 vco2ft kr3, 0
ar3 oscilikt ir1, kr3, kr4, ir2
kr3 vco2ft kr1, 0
ar7 oscilikt ir1, kr1, kr3, ir4
ar8 = (ar3 + ar7)
kr3 = (kr0 * 1.0)
kr0 = (kr1 + kr3)
kr1 vco2ft kr0, 0
ar3 oscilikt ir1, kr0, kr1, ir6
ar7 = (ar8 + ar3)
ar3 = (ar7 / 3.0)
ir55 = 14.0
kr0 = cent(ir55)
kr1 = (ir32 * kr0)
ir58 = 0.14
ar7 oscil3 ir1, ir58, 4
ar8 = (4.3e-2 * ar7)
ar7 = (0.22 + ar8)
ar8 oscil3 ir1, ar7, 4
kr0 downsamp ar8
kr4 = (7.0e-3 * kr0)
kr0 = (1.0 + kr4)
kr4 = (kr1 * kr0)
kr0 = (kr4 + kr2)
kr1 vco2ft kr0, 0
ar7 oscilikt ir1, kr0, kr1, ir8
kr0 vco2ft kr4, 0
ar9 oscilikt ir1, kr4, kr0, ir10
ar10 = (ar7 + ar9)
kr0 = (kr4 + kr3)
kr1 vco2ft kr0, 0
ar7 oscilikt ir1, kr0, kr1, ir12
ar9 = (ar10 + ar7)
ar7 = (ar9 / 3.0)
ar9 = (ar3 + ar7)
ar3 = (ar0 + ar9)
ar0 = (0.18 * ar5)
ar5 = (1.0 + ar0)
ar0 = (1575.0 * ar5)
ir82 = 0.26
ar5 moogvcf ar3, ar0, ir82
ar3 moogvcf ar5, ar0, ir82
ar0 = (0.13 * ar8)
ar5 = (1.0 + ar0)
ar0 = (2075.0 * ar5)
ir88 = 0.32
ar5 moogvcf ar9, ar0, ir88
ar0 = (ar3 + ar5)
ar3 = (ar6 * ar0)
ir92 ampmidi 1.0
ar0 upsamp k(ir92)
ar5 = (ar3 * ar0)
ar0 = (0.4 * ar5)
ar3 = (ar4 * ar0)
ar0 = (ar1 + ar3)
gargg0 = ar0
ar0 = (ar2 + ar3)
gargg1 = ar0
endin

instr 18
ar0 = gargg0
ar1 = gargg1
gargg0 = 0.0
gargg1 = 0.0
ar2 delayr 1.2
ir11 = 1.0
ar3 upsamp k(ir11)
ir12 = 3.75
ar4 oscil3 ir11, ir12, 2
ar5 = (2.1000000000000003e-3 * ar4)
ar4 = (ar5 + 1.0e-2)
ar5 deltap3 ar4
 delayw ar0
ar6 delayr 1.2
ar7 deltap3 ar4
 delayw ar1
arl0 init 0.0
arl1 init 0.0
ar4 = (0.75 * ar0)
ar8 ntrpol ar0, ar5, ir11
ar0 = (0.25 * ar8)
ar5 = (ar4 + ar0)
ar0 = (0.75 * ar5)
ir35 = 0.25
ar4 upsamp k(ir35)
ir36 = 0.65
ar8 flanger ar5, ar4, ir36, 0.255
ar9 = (ar5 + ar8)
ar5 = (0.25 * ar9)
ar8 = (ar0 + ar5)
ar0 = (0.65 * ar8)
ar5 = (0.75 * ar1)
ar9 ntrpol ar1, ar7, ir11
ar1 = (0.25 * ar9)
ar7 = (ar5 + ar1)
ar1 = (0.75 * ar7)
ar5 flanger ar7, ar4, ir36, 0.255
ar4 = (ar7 + ar5)
ar5 = (0.25 * ar4)
ar4 = (ar1 + ar5)
ir51 = 0.9
ir52 = 12000.0
ar1, ar5 reverbsc ar8, ar4, ir51, ir52
ar7 = (ar8 + ar1)
ar1 = (0.35 * ar7)
ar7 = (ar0 + ar1)
ir58 = 0.0
ir59 = 90.0
ir60 = 100.0
ar0 compress ar7, ar3, ir58, ir59, ir59, ir60, ir58, ir58, 0.0
ar1 = (ar0 * 0.8)
arl0 = ar1
ar0 = (0.65 * ar4)
ar1 = (ar4 + ar5)
ar4 = (0.35 * ar1)
ar1 = (ar0 + ar4)
ar0 compress ar1, ar3, ir58, ir59, ir59, ir60, ir58, ir58, 0.0
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

</CsInstruments>

<CsScore>

f4 0 8192 10  1.0
f2 0 8192 19  0.5 1.0 180.0 1.0

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 18 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>