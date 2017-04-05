<CsoundSynthesizer>

<CsOptions>

--output=dac:nil --input=adc:nil -+rtaudio=jack -+jack_client=pad-3 -+jack_inportname=input -+jack_outportname=output --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1.0
nchnls_i = 2
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
ar0, ar1 ins 
ir6 = 1.0
ar2 upsamp k(ir6)
ar3 pinkish ir6
arl0 init 0.0
arl1 init 0.0
kr0 linseg 0.0, 0.5, 1.0, 1.0, 1.0
ar4 upsamp kr0
ir14 = 0.1
ar5 oscil3 ir6, ir14, 2
ar6 = (0.5 * ar5)
ar5 = (0.5 + ar6)
ar6 = (5500.0 * ar5)
ir19 = 0.15
ar5 moogvcf ar3, ar6, ir19
ar3 = (ar4 * ar5)
ir22 = 0.0
ir23 = 90.0
ir24 = 100.0
ar4 compress ar3, ar2, ir22, ir23, ir23, ir24, ir22, ir22, 0.0
ar2 = (ar4 * 0.8)
arl0 = ar2
arl1 = ar2
ar2 = arl0
ar3 = arl1
 outs ar2, ar3
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