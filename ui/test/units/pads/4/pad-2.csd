<CsoundSynthesizer>

<CsOptions>

--output=dac:nil --input=adc:nil -+rtaudio=jack -+jack_client=pad-2 -+jack_inportname=input -+jack_outportname=output --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1.0
nchnls_i = 2
gargg1 init 0.0
gargg0 init 0.0
giPort init 1
opcode FreePort, i, 0
xout giPort
giPort = giPort + 1
endop




instr 24

endin

instr 23
gargg1 = 0.0
gargg0 = 0.0
 event_i "i", 22, 604800.0, 1.0e-2
endin

instr 22
ir1 = 21
ir2 = 0.0
 turnoff2 ir1, ir2, ir2
ir5 = 20
 turnoff2 ir5, ir2, ir2
ir8 = 19
 turnoff2 ir8, ir2, ir2
ir11 = 18
 turnoff2 ir11, ir2, ir2
 exitnow 
endin

instr 21
ar0, ar1 ins 
ar2 = gargg0
ar3 = gargg1
ar4 subinstr 20
kr0 downsamp ar4
kr1 changed kr0
if (kr1 == 1.0) then
    ir15 = 18.0
    ir16 = 0.0
    ir17 = 1.0
     turnoff2 ir15, ir16, ir17
    ir20 = 18.0
    ir21 = 1.0e-2
    ir22 = -1.0
     event "i", ir20, ir21, ir22, kr0
endif
arl0 init 0.0
arl1 init 0.0
kr0 linseg 0.0, 0.5, 1.0, 1.0, 1.0
ar4 upsamp kr0
ar5 = (ar4 * ar2)
ir33 = 1.0
ar2 upsamp k(ir33)
ir34 = 0.0
ir35 = 90.0
ir36 = 100.0
ar6 compress ar5, ar2, ir34, ir35, ir35, ir36, ir34, ir34, 0.0
ar5 = (ar6 * 0.8)
arl0 = ar5
ar5 = (ar4 * ar3)
ar3 compress ar5, ar2, ir34, ir35, ir35, ir36, ir34, ir34, 0.0
ar2 = (ar3 * 0.8)
arl1 = ar2
ar2 = arl0
ar3 = arl1
 outs ar2, ar3
endin

instr 20
krl0 init 10.0
ir3 FreePort 
ir5 = 0.0
ar0 mpulse k(ksmps), ir5, 0.0
kr0 downsamp ar0, ksmps
if (kr0 == 1.0) then
    krl0 = 2.0
    ir12 = 19
    ir13 = 0.1
    ir14 = 604800.0
     event "i", ir12, ir13, ir14, ir3
endif
S19 sprintf "p1_%d", ir3
ar0 chnget S19
 chnclear S19
arl1 init 0.0
arl1 = ar0
ar0 = arl1
 out ar0
kr0 = krl0
S34 sprintf "alive_%d", ir3
 chnset kr0, S34
endin

instr 19
arl0 init 0.0
ar0, ar1 ins 
arl0 = ar0
ar0 = arl0
S9 sprintf "p1_%d", p4
 chnmix ar0, S9
S12 sprintf "alive_%d", p4
kr0 chnget S12
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S12
endin

instr 18
ar0 = gargg0
ar1 = gargg1
kr0 linseg 0.0, 0.5, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 1.0, 0.0
ar3 upsamp kr0
ar4 = (ar2 * ar3)
ir8 = 1.0
kr0 = (1.0 * p4)
kr1 = (-0.1 + kr0)
ar5 poscil ir8, kr1, 2
kr1 = (-3.333333333333334e-2 + kr0)
ar6 poscil ir8, kr1, 2
ar7 = (ar5 + ar6)
kr1 = (3.3333333333333326e-2 + kr0)
ar5 poscil ir8, kr1, 2
ar6 = (ar7 + ar5)
ar5 = (ar6 / 3.0)
ir19 = 1200.0
ar6 butlp ar5, ir19
ar5 = (ar2 * ar6)
ar6 = (ar3 * ar5)
ar5 = (0.8 * ar6)
ar6 = (0.48 * ar5)
ar5 = (0.75 * ar6)
kr0 = (0.5 * p4)
kr1 = (-0.1 + kr0)
ar6 poscil ir8, kr1, 2
kr1 = (-3.333333333333334e-2 + kr0)
ar7 poscil ir8, kr1, 2
ar8 = (ar6 + ar7)
kr1 = (3.3333333333333326e-2 + kr0)
ar6 poscil ir8, kr1, 2
ar7 = (ar8 + ar6)
ar6 = (ar7 / 3.0)
ar7 butlp ar6, ir19
ar6 = (ar2 * ar7)
ar2 = (ar3 * ar6)
ar3 = (0.8 * ar2)
ar2 = (0.48 * ar3)
ar3 = (0.375 * ar2)
ar2 = (ar5 + ar3)
ar3 = (0.75 * ar2)
ir44 = 0.9
ir45 = 12000.0
ar5, ar6 reverbsc ar2, ar2, ir44, ir45
ar7 = (ar2 + ar5)
ar5 = (0.25 * ar7)
ar7 = (ar3 + ar5)
ar5 = (ar4 * ar7)
ar7 = (ar0 + ar5)
gargg0 = ar7
ar0 = (ar2 + ar6)
ar2 = (0.25 * ar0)
ar0 = (ar3 + ar2)
ar2 = (ar4 * ar0)
ar0 = (ar1 + ar2)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>

f2 0 8192 10  1.0 0.5 0.33 0.25 0.0 0.1 0.1 0.1

f0 604800.0

i 24 0.0 -1.0 
i 23 0.0 -1.0 
i 21 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>