<CsoundSynthesizer>

<CsOptions>

--output=dac:nil -+rtaudio=jack -+jack_client=spec -+jack_inportname=input -+jack_outportname=output --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1.0
ir9 OSCinit 4400.0
girgg0 init ir9
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
krl0 init 0.0
krl1 init 0.0
kr0 OSClisten girgg0, "/base-tone", "f", krl1
if (kr0 == 1.0) then
    kr0 = krl1
    kr1 = krl1
    krl0 = kr1
endif
kr1 = krl0
ar0 upsamp kr1
krl2 init 120.0
krl3 init 0.0
kr1 OSClisten girgg0, "/tempo", "f", krl3
if (kr1 == 1.0) then
    kr1 = krl3
    kr2 = krl3
    krl2 = kr2
endif
kr2 = krl2
arl4 init 0.0
arl5 init 0.0
ar1 tablei ar0, 2
ir40 = 1.0
ar0 upsamp k(ir40)
ir41 = 0.0
ir42 = 90.0
ir43 = 100.0
ar2 compress ar1, ar0, ir41, ir42, ir42, ir43, ir41, ir41, 0.0
ar1 = (ar2 * 0.8)
arl4 = ar1
kr3 = (4.0 * kr2)
kr2 = (kr3 / 120.0)
kr3 metro kr2
ar1 upsamp kr3
ar2 compress ar1, ar0, ir41, ir42, ir42, ir43, ir41, ir41, 0.0
ar0 = (ar2 * 0.8)
arl5 = ar0
ar0 = arl4
ar1 = arl5
 outs ar0, ar1
endin

</CsInstruments>

<CsScore>

f2 0 -13 -2  110.0 116.54094037952248 123.47082531403103 130.8127826502993 138.59131548843604 146.8323839587038 155.56349186104046 164.81377845643496 174.61411571650194 184.9972113558172 195.99771799087463 207.65234878997256 220.0

f0 604800.0

i 21 0.0 -1.0 
i 20 0.0 -1.0 
i 18 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>