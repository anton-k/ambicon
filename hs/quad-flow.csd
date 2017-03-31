<CsoundSynthesizer>

<CsOptions>

--output=dac:nil --input=adc:nil -+rtaudio=jack -+jack_client=quad-flow -+jack_inportname=input -+jack_outportname=output --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 8
0dbfs = 1.0
nchnls_i = 8
ir11 OSCinit 5400.0
girgg0 init ir11
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
ar0, ar1, ar2, ar3, ar4, ar5, ar6, ar7 ino 
krl0 init 0.5
krl1 init 0.5
krl2 init 0.0
krl3 init 0.0
kr0 OSClisten girgg0, "/xy", "ff", krl2, krl3
if (kr0 == 1.0) then
    kr0 = krl2
    kr1 = krl3
    kr2 = krl2
    krl0 = kr2
    kr2 = krl3
    krl1 = kr2
endif
kr2 = krl0
ar8 upsamp kr2
kr3 = krl1
ar9 upsamp kr3
kr4 changed kr2, kr3
if (kr4 == 1.0) then
     printks "change: %f, %f |  ", 0.0, kr2, kr3
endif
krl4 init 1.0
krl5 init 0.0
kr2 OSClisten girgg0, "/vol/1", "f", krl5
if (kr2 == 1.0) then
    kr2 = krl5
    kr3 = krl5
    krl4 = kr3
endif
kr3 = krl4
ar10 upsamp kr3
krl6 init 1.0
krl7 init 0.0
kr3 OSClisten girgg0, "/vol/2", "f", krl7
if (kr3 == 1.0) then
    kr3 = krl7
    kr4 = krl7
    krl6 = kr4
endif
kr4 = krl6
ar11 upsamp kr4
krl8 init 1.0
krl9 init 0.0
kr4 OSClisten girgg0, "/vol/3", "f", krl9
if (kr4 == 1.0) then
    kr4 = krl9
    kr5 = krl9
    krl8 = kr5
endif
kr5 = krl8
ar12 upsamp kr5
krl10 init 1.0
krl11 init 0.0
kr5 OSClisten girgg0, "/vol/4", "f", krl11
if (kr5 == 1.0) then
    kr5 = krl11
    kr6 = krl11
    krl10 = kr6
endif
kr6 = krl10
ar13 upsamp kr6
ir121 = -7.0e-2
ir122 = 7.0e-2
ir123 = 4.1666666666666664e-2
ir124 = 0.125
ar14 rspline ir121, ir122, ir123, ir124
ar15 rspline ir121, ir122, ir123, ir124
arl12 init 0.0
arl13 init 0.0
arl14 init 0.0
arl15 init 0.0
arl16 init 0.0
arl17 init 0.0
arl18 init 0.0
arl19 init 0.0
ar16 = (ar8 + ar14)
ar8 = (1.0 - ar16)
ar14 = (ar9 + ar15)
ar9 = (1.0 - ar14)
ar15 = (ar8 * ar9)
ar17 = (ar10 * ar0)
ar0 = (ar15 * ar17)
ar17 = (ar16 * ar9)
ar9 = (ar11 * ar2)
ar2 = (ar17 * ar9)
ar9 = (ar0 + ar2)
ar0 = (ar16 * ar14)
ar2 = (ar12 * ar4)
ar4 = (ar0 * ar2)
ar2 = (ar9 + ar4)
ar4 = (ar8 * ar14)
ar8 = (ar13 * ar6)
ar6 = (ar4 * ar8)
ar8 = (ar2 + ar6)
ir164 = 1.0
ar2 upsamp k(ir164)
ir165 = 0.0
ar6 upsamp k(ir165)
ir166 = 90.0
ir167 = 100.0
ar9 compress ar8, ar2, ir165, ir166, ir166, ir167, ir165, ir165, 0.0
ar8 = (ar9 * 0.8)
arl12 = ar8
ar8 = (ar10 * ar1)
ar1 = (ar15 * ar8)
ar8 = (ar11 * ar3)
ar3 = (ar17 * ar8)
ar8 = (ar1 + ar3)
ar1 = (ar12 * ar5)
ar3 = (ar0 * ar1)
ar0 = (ar8 + ar3)
ar1 = (ar13 * ar7)
ar3 = (ar4 * ar1)
ar1 = (ar0 + ar3)
ar0 compress ar1, ar2, ir165, ir166, ir166, ir167, ir165, ir165, 0.0
ar1 = (ar0 * 0.8)
arl13 = ar1
ar0 compress ar6, ar2, ir165, ir166, ir166, ir167, ir165, ir165, 0.0
ar1 = (ar0 * 0.8)
arl14 = ar1
arl15 = ar1
arl16 = ar1
arl17 = ar1
arl18 = ar1
arl19 = ar1
ar0 = arl12
ar1 = arl13
ar2 = arl14
ar3 = arl15
ar4 = arl16
ar5 = arl17
ar6 = arl18
ar7 = arl19
 outo ar0, ar1, ar2, ar3, ar4, ar5, ar6, ar7
endin

</CsInstruments>

<CsScore>



f0 604800.0

i 21 0.0 -1.0 
i 20 0.0 -1.0 
i 18 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>