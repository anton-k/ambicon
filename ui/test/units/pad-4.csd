<CsoundSynthesizer>

<CsOptions>

--output=dac:nil -+rtaudio=jack -+jack_client=pad-4 -+jack_inportname=input -+jack_outportname=output --nodisplays

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
ir1 = 1.0
ar0 upsamp k(ir1)
ar1 pinkish ir1
arl0 init 0.0
arl1 init 0.0
ir8 = 0.1
ar2 oscil3 ir1, ir8, 2
ar3 = (0.5 * ar2)
ar2 = (0.5 + ar3)
ar3 = (2500.0 * ar2)
ir13 = 0.15
ar2 moogvcf ar1, ar3, ir13
ir15 = 0.0
ir16 = 90.0
ir17 = 100.0
ar1 compress ar2, ar0, ir15, ir16, ir16, ir17, ir15, ir15, 0.0
ar0 = (ar1 * 0.8)
arl0 = ar0
arl1 = ar0
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