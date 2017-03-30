<CsoundSynthesizer>

<CsOptions>

--output=dac:nil -+rtaudio=jack -+jack_client=pad-3 -+jack_inportname=input -+jack_outportname=output --nodisplays

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
ir5 = 1.0
ar0 upsamp k(ir5)
ar1 vco2 ir5, ir5, 2.0, 0.1
ar2 = (0.5 * ar1)
ar1 = (0.5 + ar2)
kr0 linseg 0.0, 0.25, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 1.2, 0.0
ar3 upsamp kr0
ar4 = (ar2 * ar3)
ir12 = 439.736
ar3 oscil3 ir5, ir12, 2
ir14 = 439.784
ar5 oscil3 ir5, ir14, 2
ar6 = (ar3 + ar5)
ir17 = 439.832
ar3 oscil3 ir5, ir17, 2
ar5 = (ar6 + ar3)
ir20 = 439.88
ar3 oscil3 ir5, ir20, 2
ar6 = (ar5 + ar3)
ir23 = 439.928
ar3 oscil3 ir5, ir23, 2
ar5 = (ar6 + ar3)
ir26 = 439.976
ar3 oscil3 ir5, ir26, 2
ar6 = (ar5 + ar3)
ir29 = 440.024
ar3 oscil3 ir5, ir29, 2
ar5 = (ar6 + ar3)
ir32 = 440.072
ar3 oscil3 ir5, ir32, 2
ar6 = (ar5 + ar3)
ir35 = 440.12
ar3 oscil3 ir5, ir35, 2
ar5 = (ar6 + ar3)
ir38 = 440.168
ar3 oscil3 ir5, ir38, 2
ar6 = (ar5 + ar3)
ir41 = 440.216
ar3 oscil3 ir5, ir41, 2
ar5 = (ar6 + ar3)
ar3 = (ar5 / 11.0)
ar5 = (ar4 * ar3)
kr0 linsegr 1.0, 1.0, 1.0, 1.0, 0.0
ar3 upsamp kr0
ar6 = (ar2 * ar3)
ir48 = 219.61
ar2 oscil3 ir5, ir48, 4
ir50 = 219.67
ar3 oscil3 ir5, ir50, 4
ar7 = (ar2 + ar3)
ir53 = 219.73
ar2 oscil3 ir5, ir53, 4
ar3 = (ar7 + ar2)
ir56 = 219.79
ar2 oscil3 ir5, ir56, 4
ar7 = (ar3 + ar2)
ir59 = 219.85
ar2 oscil3 ir5, ir59, 4
ar3 = (ar7 + ar2)
ir62 = 219.91
ar2 oscil3 ir5, ir62, 4
ar7 = (ar3 + ar2)
ir65 = 219.97
ar2 oscil3 ir5, ir65, 4
ar3 = (ar7 + ar2)
ir68 = 220.03
ar2 oscil3 ir5, ir68, 4
ar7 = (ar3 + ar2)
ir71 = 220.09
ar2 oscil3 ir5, ir71, 4
ar3 = (ar7 + ar2)
ir74 = 220.15
ar2 oscil3 ir5, ir74, 4
ar7 = (ar3 + ar2)
ir77 = 220.21
ar2 oscil3 ir5, ir77, 4
ar3 = (ar7 + ar2)
ir80 = 220.27
ar2 oscil3 ir5, ir80, 4
ar7 = (ar3 + ar2)
ir83 = 220.33
ar2 oscil3 ir5, ir83, 4
ar3 = (ar7 + ar2)
ar2 = (ar3 / 13.0)
ar3 = (ar6 * ar2)
ar2 = (ar5 + ar3)
ar3 = (0.8 * ar2)
ar2 = (0.75 * ar3)
ir91 = 1500.0
ir92 = 0.1
ar5 moogvcf ar3, ir91, ir92
ar3 = (0.25 * ar5)
ar5 = (ar2 + ar3)
ar2 = (0.65 * ar5)
ar3 = (0.75 * ar2)
ir98 = 219.736
ar2 oscil3 ir5, ir98, 4
ir100 = 219.784
ar5 oscil3 ir5, ir100, 4
ar7 = (ar2 + ar5)
ir103 = 219.832
ar2 oscil3 ir5, ir103, 4
ar5 = (ar7 + ar2)
ir106 = 219.88
ar2 oscil3 ir5, ir106, 4
ar7 = (ar5 + ar2)
ir109 = 219.928
ar2 oscil3 ir5, ir109, 4
ar5 = (ar7 + ar2)
ir112 = 219.976
ar2 oscil3 ir5, ir112, 4
ar7 = (ar5 + ar2)
ir115 = 220.024
ar2 oscil3 ir5, ir115, 4
ar5 = (ar7 + ar2)
ir118 = 220.072
ar2 oscil3 ir5, ir118, 4
ar7 = (ar5 + ar2)
ir121 = 220.12
ar2 oscil3 ir5, ir121, 4
ar5 = (ar7 + ar2)
ir124 = 220.168
ar2 oscil3 ir5, ir124, 4
ar7 = (ar5 + ar2)
ir127 = 220.216
ar2 oscil3 ir5, ir127, 4
ar5 = (ar7 + ar2)
ar2 = (ar5 / 11.0)
ar5 = (ar4 * ar2)
ir132 = 109.61
ar2 oscil3 ir5, ir132, 4
ir134 = 109.67
ar4 oscil3 ir5, ir134, 4
ar7 = (ar2 + ar4)
ir137 = 109.73
ar2 oscil3 ir5, ir137, 4
ar4 = (ar7 + ar2)
ir140 = 109.79
ar2 oscil3 ir5, ir140, 4
ar7 = (ar4 + ar2)
ir143 = 109.85
ar2 oscil3 ir5, ir143, 4
ar4 = (ar7 + ar2)
ir146 = 109.91
ar2 oscil3 ir5, ir146, 4
ar7 = (ar4 + ar2)
ir149 = 109.97
ar2 oscil3 ir5, ir149, 4
ar4 = (ar7 + ar2)
ir152 = 110.03
ar2 oscil3 ir5, ir152, 4
ar7 = (ar4 + ar2)
ir155 = 110.09
ar2 oscil3 ir5, ir155, 4
ar4 = (ar7 + ar2)
ir158 = 110.15
ar2 oscil3 ir5, ir158, 4
ar7 = (ar4 + ar2)
ir161 = 110.21
ar2 oscil3 ir5, ir161, 4
ar4 = (ar7 + ar2)
ir164 = 110.27
ar2 oscil3 ir5, ir164, 4
ar7 = (ar4 + ar2)
ir167 = 110.33
ar2 oscil3 ir5, ir167, 4
ar4 = (ar7 + ar2)
ar2 = (ar4 / 13.0)
ar4 = (ar6 * ar2)
ar2 = (ar5 + ar4)
ar4 = (0.8 * ar2)
ar2 = (0.75 * ar4)
ar5 moogvcf ar4, ir91, ir92
ar4 = (0.25 * ar5)
ar5 = (ar2 + ar4)
ar2 = (0.65 * ar5)
ar4 = (0.375 * ar2)
ar2 = (ar3 + ar4)
ar3 = (0.8 * ar2)
ir182 = 0.99
ir183 = 12000.0
ar2, ar4 reverbsc ar3, ar3, ir182, ir183
ar5 = (ar3 + ar2)
ar2 = (0.2 * ar5)
ar5 = (ar3 + ar2)
ar2 = (ar1 * ar5)
ir190 = 0.0
ir191 = 90.0
ir192 = 100.0
ar5 compress ar2, ar0, ir190, ir191, ir191, ir192, ir190, ir190, 0.0
ar2 = (ar5 * 0.8)
arl0 = ar2
ar2 = (ar3 + ar4)
ar4 = (0.2 * ar2)
ar2 = (ar3 + ar4)
ar3 = (ar1 * ar2)
ar1 compress ar3, ar0, ir190, ir191, ir191, ir192, ir190, ir190, 0.0
ar0 = (ar1 * 0.8)
arl1 = ar0
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

</CsInstruments>

<CsScore>

f2 0 8192 10  0.3 0.0 0.0 0.0 0.1
f4 0 8192 10  0.3 0.0 0.0 0.0 0.1 0.1 0.1 0.1 0.1

f0 604800.0

i 21 0.0 -1.0 
i 20 0.0 -1.0 
i 18 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>