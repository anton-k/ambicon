<CsoundSynthesizer>

<CsOptions>

--output=dac:nil --input=adc:nil -+rtaudio=jack -+jack_client=pad-4 -+jack_inportname=input -+jack_outportname=output --nodisplays

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
ir32 = 1.0
ar5 upsamp k(ir32)
ar6 vco2 ir32, ir32, 2.0, 0.1
kr0 downsamp ar6
kr1 = (0.5 * kr0)
kr0 = (0.5 + kr1)
ir36 = 1.0e-2
kr1 portk kr0, ir36
ar6 upsamp kr1
ar7 = (ar6 * ar2)
ar2 = (ar4 * ar7)
ir40 = 0.0
ir41 = 90.0
ir42 = 100.0
ar7 compress ar2, ar5, ir40, ir41, ir41, ir42, ir40, ir40, 0.0
ar2 = (ar7 * 0.8)
arl0 = ar2
ar2 = (ar6 * ar3)
ar3 = (ar4 * ar2)
ar2 compress ar3, ar5, ir40, ir41, ir41, ir42, ir40, ir40, 0.0
ar3 = (ar2 * 0.8)
arl1 = ar3
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
ar2 = (ar0 * 2.0)
arl0 = ar2
ar0 = arl0
S10 sprintf "p1_%d", p4
 chnmix ar0, S10
S13 sprintf "alive_%d", p4
kr0 chnget S13
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S13
endin

instr 18
ar0 = gargg0
ar1 = gargg1
kr0 linseg 0.0, 0.5, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 1.0, 0.0
ar3 upsamp kr0
ar4 = (ar2 * ar3)
kr0 linseg 0.0, 0.25, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 1.2, 0.0
ar5 upsamp kr0
ar6 = (ar2 * ar5)
ir11 = 1.0
kr0 = (1.0 * p4)
ar5 upsamp kr0
ar7 = (-0.264 + ar5)
ir14 = (1.0 * p4)
if (ir14 < 350.0) then
    ir15 = 4
else
    ir15 = 6
endif
if (ir14 < 230.0) then
    ir16 = 2
else
    ir16 = ir15
endif
ar8 oscil3 ir11, ar7, ir16
ar7 = (-0.21600000000000003 + ar5)
ar9 oscil3 ir11, ar7, ir16
ar7 = (ar8 + ar9)
ar8 = (-0.168 + ar5)
ar9 oscil3 ir11, ar8, ir16
ar8 = (ar7 + ar9)
ar7 = (-0.12 + ar5)
ar9 oscil3 ir11, ar7, ir16
ar7 = (ar8 + ar9)
ar8 = (-7.200000000000001e-2 + ar5)
ar9 oscil3 ir11, ar8, ir16
ar8 = (ar7 + ar9)
ar7 = (-2.400000000000002e-2 + ar5)
ar9 oscil3 ir11, ar7, ir16
ar7 = (ar8 + ar9)
ar8 = (2.400000000000002e-2 + ar5)
ar9 oscil3 ir11, ar8, ir16
ar8 = (ar7 + ar9)
ar7 = (7.200000000000001e-2 + ar5)
ar9 oscil3 ir11, ar7, ir16
ar7 = (ar8 + ar9)
ar8 = (0.12 + ar5)
ar9 oscil3 ir11, ar8, ir16
ar8 = (ar7 + ar9)
ar7 = (0.16799999999999998 + ar5)
ar9 oscil3 ir11, ar7, ir16
ar7 = (ar8 + ar9)
ar8 = (0.21599999999999997 + ar5)
ar5 oscil3 ir11, ar8, ir16
ar8 = (ar7 + ar5)
ar5 = (ar8 / 11.0)
ar7 = (ar6 * ar5)
ar5 = (ar2 * ar3)
kr0 = (ir14 * 0.5)
ar2 upsamp kr0
ar3 = (-0.39 + ar2)
ir53 = (ir14 * 0.5)
if (ir53 < 350.0) then
    ir54 = 4
else
    ir54 = 6
endif
if (ir53 < 230.0) then
    ir55 = 2
else
    ir55 = ir54
endif
ar8 oscil3 ir11, ar3, ir55
ar3 = (-0.33 + ar2)
ar9 oscil3 ir11, ar3, ir55
ar3 = (ar8 + ar9)
ar8 = (-0.27 + ar2)
ar9 oscil3 ir11, ar8, ir55
ar8 = (ar3 + ar9)
ar3 = (-0.21 + ar2)
ar9 oscil3 ir11, ar3, ir55
ar3 = (ar8 + ar9)
ar8 = (-0.15 + ar2)
ar9 oscil3 ir11, ar8, ir55
ar8 = (ar3 + ar9)
ar3 = (-8.999999999999997e-2 + ar2)
ar9 oscil3 ir11, ar3, ir55
ar3 = (ar8 + ar9)
ar8 = (-2.999999999999997e-2 + ar2)
ar9 oscil3 ir11, ar8, ir55
ar8 = (ar3 + ar9)
ar3 = (3.0000000000000027e-2 + ar2)
ar9 oscil3 ir11, ar3, ir55
ar3 = (ar8 + ar9)
ar8 = (9.000000000000002e-2 + ar2)
ar9 oscil3 ir11, ar8, ir55
ar8 = (ar3 + ar9)
ar3 = (0.15000000000000002 + ar2)
ar9 oscil3 ir11, ar3, ir55
ar3 = (ar8 + ar9)
ar8 = (0.21000000000000008 + ar2)
ar9 oscil3 ir11, ar8, ir55
ar8 = (ar3 + ar9)
ar3 = (0.27 + ar2)
ar9 oscil3 ir11, ar3, ir55
ar3 = (ar8 + ar9)
ar8 = (0.33000000000000007 + ar2)
ar2 oscil3 ir11, ar8, ir55
ar8 = (ar3 + ar2)
ar2 = (ar8 / 13.0)
ar3 = (ar5 * ar2)
ar2 = (ar7 + ar3)
ar3 = (0.8 * ar2)
ar2 = (0.75 * ar3)
ir98 = 1500.0
ir99 = 0.1
ar7 moogvcf ar3, ir98, ir99
ar3 = (0.25 * ar7)
ar7 = (ar2 + ar3)
ar2 = (0.65 * ar7)
ar3 = (0.75 * ar2)
kr0 = (0.5 * p4)
ar2 upsamp kr0
ar7 = (-0.264 + ar2)
ir107 = (0.5 * p4)
if (ir107 < 350.0) then
    ir108 = 4
else
    ir108 = 6
endif
if (ir107 < 230.0) then
    ir109 = 2
else
    ir109 = ir108
endif
ar8 oscil3 ir11, ar7, ir109
ar7 = (-0.21600000000000003 + ar2)
ar9 oscil3 ir11, ar7, ir109
ar7 = (ar8 + ar9)
ar8 = (-0.168 + ar2)
ar9 oscil3 ir11, ar8, ir109
ar8 = (ar7 + ar9)
ar7 = (-0.12 + ar2)
ar9 oscil3 ir11, ar7, ir109
ar7 = (ar8 + ar9)
ar8 = (-7.200000000000001e-2 + ar2)
ar9 oscil3 ir11, ar8, ir109
ar8 = (ar7 + ar9)
ar7 = (-2.400000000000002e-2 + ar2)
ar9 oscil3 ir11, ar7, ir109
ar7 = (ar8 + ar9)
ar8 = (2.400000000000002e-2 + ar2)
ar9 oscil3 ir11, ar8, ir109
ar8 = (ar7 + ar9)
ar7 = (7.200000000000001e-2 + ar2)
ar9 oscil3 ir11, ar7, ir109
ar7 = (ar8 + ar9)
ar8 = (0.12 + ar2)
ar9 oscil3 ir11, ar8, ir109
ar8 = (ar7 + ar9)
ar7 = (0.16799999999999998 + ar2)
ar9 oscil3 ir11, ar7, ir109
ar7 = (ar8 + ar9)
ar8 = (0.21599999999999997 + ar2)
ar2 oscil3 ir11, ar8, ir109
ar8 = (ar7 + ar2)
ar2 = (ar8 / 11.0)
ar7 = (ar6 * ar2)
kr0 = (ir107 * 0.5)
ar2 upsamp kr0
ar6 = (-0.39 + ar2)
ir145 = (ir107 * 0.5)
if (ir145 < 350.0) then
    ir146 = 4
else
    ir146 = 6
endif
if (ir145 < 230.0) then
    ir147 = 2
else
    ir147 = ir146
endif
ar8 oscil3 ir11, ar6, ir147
ar6 = (-0.33 + ar2)
ar9 oscil3 ir11, ar6, ir147
ar6 = (ar8 + ar9)
ar8 = (-0.27 + ar2)
ar9 oscil3 ir11, ar8, ir147
ar8 = (ar6 + ar9)
ar6 = (-0.21 + ar2)
ar9 oscil3 ir11, ar6, ir147
ar6 = (ar8 + ar9)
ar8 = (-0.15 + ar2)
ar9 oscil3 ir11, ar8, ir147
ar8 = (ar6 + ar9)
ar6 = (-8.999999999999997e-2 + ar2)
ar9 oscil3 ir11, ar6, ir147
ar6 = (ar8 + ar9)
ar8 = (-2.999999999999997e-2 + ar2)
ar9 oscil3 ir11, ar8, ir147
ar8 = (ar6 + ar9)
ar6 = (3.0000000000000027e-2 + ar2)
ar9 oscil3 ir11, ar6, ir147
ar6 = (ar8 + ar9)
ar8 = (9.000000000000002e-2 + ar2)
ar9 oscil3 ir11, ar8, ir147
ar8 = (ar6 + ar9)
ar6 = (0.15000000000000002 + ar2)
ar9 oscil3 ir11, ar6, ir147
ar6 = (ar8 + ar9)
ar8 = (0.21000000000000008 + ar2)
ar9 oscil3 ir11, ar8, ir147
ar8 = (ar6 + ar9)
ar6 = (0.27 + ar2)
ar9 oscil3 ir11, ar6, ir147
ar6 = (ar8 + ar9)
ar8 = (0.33000000000000007 + ar2)
ar2 oscil3 ir11, ar8, ir147
ar8 = (ar6 + ar2)
ar2 = (ar8 / 13.0)
ar6 = (ar5 * ar2)
ar2 = (ar7 + ar6)
ar5 = (0.8 * ar2)
ar2 = (0.75 * ar5)
ar6 moogvcf ar5, ir98, ir99
ar5 = (0.25 * ar6)
ar6 = (ar2 + ar5)
ar2 = (0.65 * ar6)
ar5 = (0.375 * ar2)
ar2 = (ar3 + ar5)
ar3 = (0.8 * ar2)
ir197 = 0.99
ir198 = 12000.0
ar2, ar5 reverbsc ar3, ar3, ir197, ir198
ar6 = (ar3 + ar2)
ar2 = (0.2 * ar6)
ar6 = (ar3 + ar2)
ar2 = (ar4 * ar6)
ar6 = (ar0 + ar2)
gargg0 = ar6
ar0 = (ar3 + ar5)
ar2 = (0.2 * ar0)
ar0 = (ar3 + ar2)
ar2 = (ar4 * ar0)
ar0 = (ar1 + ar2)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>

f6 0 8192 10  0.3 0.0 0.0 0.0 0.1
f4 0 8192 10  0.3 0.0 0.0 0.0 0.1 0.1 0.1
f2 0 8192 10  0.3 0.0 0.0 0.0 0.1 0.1 0.1 0.1 0.1

f0 604800.0

i 24 0.0 -1.0 
i 23 0.0 -1.0 
i 21 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>