<CsoundSynthesizer>

<CsOptions>

--output=dac:nil -+rtaudio=jack -+jack_client=pad-1 -+jack_inportname=input -+jack_outportname=output --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1.0
giPort init 1
opcode FreePort, i, 0
xout giPort
giPort = giPort + 1
endop




instr 21

endin

instr 20
 event_i "i", 19, 604800.0, 1.0e-2
endin

instr 19
ir1 = 18
ir2 = 0.0
 turnoff2 ir1, ir2, ir2
 exitnow 
endin

instr 18
ir1 = 0.8
ir2 = 4.3
ir3 = -1.1250000000000001e-2
ir4 = 1.375e-2
kr0 rspline ir1, ir2, ir3, ir4
ir7 = -1.0e-2
ir8 = 1.5000000000000001e-2
kr1 rspline ir1, ir2, ir7, ir8
kr2 rspline ir1, ir2, ir3, ir4
kr3 rspline ir1, ir2, ir7, ir8
kr4 rspline ir1, ir2, ir3, ir4
kr5 rspline ir1, ir2, ir7, ir8
kr6 rspline ir1, ir2, ir3, ir4
kr7 rspline ir1, ir2, ir7, ir8
arl0 init 0.0
arl1 init 0.0
ar0 madsr 0.5, 0.0, 1.0, 1.0
ir28 = 1.0
ar1 upsamp k(ir28)
ir29 = 220.0
ir30 = 3.0
ir31 = 0.5
kr8 oscil3 ir28, ir31, 2
kr9 = (0.5 * kr8)
kr8 = (0.5 + kr9)
kr9 = (kr0 * kr8)
ar2 foscili ir28, ir29, ir28, ir30, kr9, 2
ir37 = 0.7
kr9 oscil3 ir28, ir37, 2
kr10 = (0.5 * kr9)
kr9 = (0.5 + kr10)
kr10 = (kr1 * kr9)
ar3 foscili ir28, ir29, ir30, ir28, kr10, 2
ar4 = (ar2 + ar3)
ir44 = 7.0
ir45 = 0.35
kr1 oscil3 ir28, ir45, 2
kr10 = (0.5 * kr1)
kr1 = (0.5 + kr10)
kr10 = (kr0 * kr1)
ar2 foscili ir28, ir29, ir28, ir44, kr10, 2
ar3 = (ar4 + ar2)
ar2 = (ar3 / 3.0)
ir53 = 1840.0
ir54 = 0.1
ar3 moogvcf ar2, ir53, ir54
ar2 = (0.8 * ar3)
ar3 = (ar0 * ar2)
ir58 = 110.0
kr0 = (kr2 * kr8)
ar2 foscili ir28, ir58, ir28, ir30, kr0, 2
kr0 = (kr3 * kr9)
ar4 foscili ir28, ir58, ir30, ir28, kr0, 2
ar5 = (ar2 + ar4)
kr0 = (kr2 * kr1)
ar2 foscili ir28, ir58, ir28, ir44, kr0, 2
ar4 = (ar5 + ar2)
ar2 = (ar4 / 3.0)
ir68 = 1620.0
ar4 moogvcf ar2, ir68, ir54
ar2 = (0.8 * ar4)
ar4 = (ar0 * ar2)
ar2 = (0.75 * ar4)
ar4 = (ar3 + ar2)
ar2 = (0.6 * ar4)
ar3 = (0.75 * ar2)
ir76 = 110.0
kr0 = (kr4 * kr8)
ar2 foscili ir28, ir76, ir28, ir30, kr0, 2
kr0 = (kr5 * kr9)
ar4 foscili ir28, ir76, ir30, ir28, kr0, 2
ar5 = (ar2 + ar4)
kr0 = (kr4 * kr1)
ar2 foscili ir28, ir76, ir28, ir44, kr0, 2
ar4 = (ar5 + ar2)
ar2 = (ar4 / 3.0)
ar4 moogvcf ar2, ir68, ir54
ar2 = (0.8 * ar4)
ar4 = (ar0 * ar2)
ir89 = 55.0
kr0 = (kr6 * kr8)
ar2 foscili ir28, ir89, ir28, ir30, kr0, 2
kr0 = (kr7 * kr9)
ar5 foscili ir28, ir89, ir30, ir28, kr0, 2
ar6 = (ar2 + ar5)
kr0 = (kr6 * kr1)
ar2 foscili ir28, ir89, ir28, ir44, kr0, 2
ar5 = (ar6 + ar2)
ar2 = (ar5 / 3.0)
ir99 = 1510.0
ar5 moogvcf ar2, ir99, ir54
ar2 = (0.8 * ar5)
ar5 = (ar0 * ar2)
ar0 = (0.75 * ar5)
ar2 = (ar4 + ar0)
ar0 = (0.6 * ar2)
ar2 = (0.375 * ar0)
ar0 = (ar3 + ar2)
ar2 = (0.65 * ar0)
ir109 = 0.9
ir110 = 12000.0
ar3, ar4 reverbsc ar0, ar0, ir109, ir110
ar5 = (ar0 + ar3)
ar3 = (0.35 * ar5)
ar5 = (ar2 + ar3)
ir116 = 0.0
ir117 = 90.0
ir118 = 100.0
ar3 compress ar5, ar1, ir116, ir117, ir117, ir118, ir116, ir116, 0.0
ar5 = (ar3 * 0.8)
arl0 = ar5
ar3 = (ar0 + ar4)
ar0 = (0.35 * ar3)
ar3 = (ar2 + ar0)
ar0 compress ar3, ar1, ir116, ir117, ir117, ir118, ir116, ir116, 0.0
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

</CsInstruments>

<CsScore>

f2 0 8192 10  1.0

f0 604800.0

i 21 0.0 -1.0 
i 20 0.0 -1.0 
i 18 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>