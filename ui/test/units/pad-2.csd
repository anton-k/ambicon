<CsoundSynthesizer>

<CsOptions>

--output=dac:nil -+rtaudio=jack -+jack_client=pad-2 -+jack_inportname=input -+jack_outportname=output --nodisplays

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
arl0 init 0.0
arl1 init 0.0
kr0 linsegr 1.0, 1.0, 1.0, 1.0, 0.0
ar0 upsamp kr0
kr0 linseg 0.0, 0.5, 1.0, 1.0, 1.0
ar1 upsamp kr0
ir7 = 1.0
ar2 upsamp k(ir7)
ir8 = 219.9
ar3 poscil ir7, ir8, 2
ir10 = 219.96666666666667
ar4 poscil ir7, ir10, 2
ar5 = (ar3 + ar4)
ir13 = 220.03333333333333
ar3 poscil ir7, ir13, 2
ar4 = (ar5 + ar3)
ar3 = (ar4 / 3.0)
ir17 = 1200.0
ar4 butlp ar3, ir17
ar3 = (ar1 * ar4)
ar4 = (ar0 * ar3)
ar3 = (0.8 * ar4)
ar4 = (0.48 * ar3)
ar3 = (0.75 * ar4)
ir24 = 109.9
ar4 poscil ir7, ir24, 2
ir26 = 109.96666666666667
ar5 poscil ir7, ir26, 2
ar6 = (ar4 + ar5)
ir29 = 110.03333333333333
ar4 poscil ir7, ir29, 2
ar5 = (ar6 + ar4)
ar4 = (ar5 / 3.0)
ar5 butlp ar4, ir17
ar4 = (ar1 * ar5)
ar1 = (ar0 * ar4)
ar0 = (0.8 * ar1)
ar1 = (0.48 * ar0)
ar0 = (0.375 * ar1)
ar1 = (ar3 + ar0)
ar0 = (0.75 * ar1)
ir41 = 0.9
ir42 = 12000.0
ar3, ar4 reverbsc ar1, ar1, ir41, ir42
ar5 = (ar1 + ar3)
ar3 = (0.25 * ar5)
ar5 = (ar0 + ar3)
ir48 = 0.0
ir49 = 90.0
ir50 = 100.0
ar3 compress ar5, ar2, ir48, ir49, ir49, ir50, ir48, ir48, 0.0
ar5 = (ar3 * 0.8)
arl0 = ar5
ar3 = (ar1 + ar4)
ar1 = (0.25 * ar3)
ar3 = (ar0 + ar1)
ar0 compress ar3, ar2, ir48, ir49, ir49, ir50, ir48, ir48, 0.0
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

</CsInstruments>

<CsScore>

f2 0 8192 10  1.0 0.5 0.33 0.25 0.0 0.1 0.1 0.1

f0 604800.0

i 21 0.0 -1.0 
i 20 0.0 -1.0 
i 18 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>