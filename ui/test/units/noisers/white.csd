<CsoundSynthesizer>

<CsOptions>

--output=dac:nil -+rtaudio=jack -+jack_client=noise -+jack_inportname=input -+jack_outportname=output --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1.0
ir9 OSCinit 6400.0
girgg0 init ir9
giPort init 1
opcode FreePort, i, 0
xout giPort
giPort = giPort + 1
endop

opcode StereoPingPongDelay, aa, aaKKKKKi
    aInL, aInR, kdelayTime, kFeedback, kMix, kWidth, kDamp, iMaxDelayTime xin

    iporttime   =       .1          ;PORTAMENTO TIME
    kporttime   linseg      0, .001, iporttime  ;USE OF AN ENVELOPE VALUE THAT QUICKLY RAMPS UP FROM ZERO TO THE REQUIRED VALUE. THIS PREVENTS VARIABLES GLIDING TO THEIR REQUIRED VALUES EACH TIME THE INSTRUMENT IS STARTED
    kdlt        portk       kdelayTime, kporttime    ;PORTAMENTO IS APPLIED TO THE VARIABLE 'gkdlt'. A NEW VARIABLE 'kdlt' IS CREATED.
    adlt        interp      kdlt            ;A NEW A-RATE VARIABLE 'adlt' IS CREATED BY INTERPOLATING THE K-RATE VARIABLE 'kdlt' 

    ;;;LEFT CHANNEL OFFSET;;;NO FEEDBACK!!;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    abufferL_OS delayr  iMaxDelayTime          ;CREATE A DELAY BUFFER OF imaxdelay SECONDS DURATION
    adelsigL_OS     deltap3 adlt                ;TAP THE DELAY LINE AT adlt SECONDS
    adelsigL_OS tone adelsigL_OS, kDamp
            delayw  aInL                ;WRITE AUDIO SOURCE INTO THE BEGINNING OF THE BUFFER

    ;;;LEFT CHANNEL DELAY;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    abufferL    delayr  iMaxDelayTime*2            ;CREATE A DELAY BUFFER OF 5 SECONDS DURATION (EQUIVALENT TO THE MAXIMUM DELAY TIME POSSIBLE USING THIS EXAMPLE)
    adelsigL    deltap3 adlt*2              ;TAP THE DELAY LINE AT gkdlt SECONDS
    adelsigL    tone adelsigL, kDamp
            delayw  adelsigL_OS + (adelsigL * kFeedback)    ;WRITE AUDIO SOURCE FROM OFFSETTTING DELAY AND FEEDBACK SIGNAL INTO THE BEGINNING OF THE BUFFER
    
    abufferR    delayr  iMaxDelayTime*2            ;CREATE A DELAY BUFFER OF 5 SECONDS DURATION (EQUIVALENT TO THE MAXIMUM DELAY TIME POSSIBLE USING THIS EXAMPLE)
    adelsigR    deltap3 adlt*2              ;TAP THE DELAY LINE AT gkdlt SECONDS
    adelsigR    tone adelsigR, kDamp
            delayw  aInR+(adelsigR*kFeedback)   ;WRITE AUDIO SOURCE AND FEEDBACK SIGNAL INTO THE BEGINNING OF THE BUFFER

    ;CREATE LEFT AND RIGHT CHANNEL MIXES
    aOutL       sum     (adelsigL  + adelsigL_OS)* kMix, aInL * (1-kMix), (1 - kWidth) * adelsigR
    aOutR       sum     adelsigR                 * kMix, aInR * (1-kMix), (1 - kWidth) * adelsigL     
            xout        aOutL, aOutR        ;CREATE A MIX BETWEEN THE WET AND THE DRY SIGNALS AT THE OUTPUT
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
krl0 init 0.5
krl1 init 0.0
kr0 OSClisten girgg0, "/frequency/1", "f", krl1
if (kr0 == 1.0) then
    kr0 = krl1
    kr1 = krl1
    krl0 = kr1
endif
kr1 = krl0
krl2 init 0.1
krl3 init 0.0
kr2 OSClisten girgg0, "/resonance/1", "f", krl3
if (kr2 == 1.0) then
    kr2 = krl3
    kr3 = krl3
    krl2 = kr3
endif
kr3 = krl2
ar0 upsamp kr3
ir35 = 1.0
ar1 upsamp k(ir35)
ir36 = 0.0
ar2 noise ir35, ir36
krl4 init 0.5
krl5 init 0.0
kr3 OSClisten girgg0, "/frequency/2", "f", krl5
if (kr3 == 1.0) then
    kr3 = krl5
    kr4 = krl5
    krl4 = kr4
endif
kr4 = krl4
krl6 init 0.1
krl7 init 0.0
kr5 OSClisten girgg0, "/resonance/2", "f", krl7
if (kr5 == 1.0) then
    kr5 = krl7
    kr6 = krl7
    krl6 = kr6
endif
kr6 = krl6
ar3 upsamp kr6
ar4 noise ir35, ir36
arl8 init 0.0
arl9 init 0.0
ir79 = 0.1
ar5 oscil3 ir35, ir79, 2
ar6 = (0.5 * ar5)
ar5 = (0.5 + ar6)
ar6 = (500.0 * ar5)
ar5 = (1200.0 + ar6)
ir85 = 4.0
kr6 expcurve kr1, ir85
ar6 upsamp kr6
ar7 = (ar5 * ar6)
ir88 = 0.17
ar6 oscil3 ir35, ir88, 2
ar8 = (0.5 * ar6)
ar6 = (0.5 + ar8)
ar8 = (0.15 * ar6)
ar6 = (ar0 + ar8)
ar0 moogvcf ar2, ar7, ar6
kr1 expcurve kr4, ir85
ar2 upsamp kr1
ar6 = (ar5 * ar2)
ar2 = (ar3 + ar8)
ar3 moogvcf ar4, ar6, ar2
ar2 = (ar0 + ar3)
ir100 = 0.5
ir101 = 0.75
kr1 expcurve ir100, ir85
ir103 = 12000.0
ir104 = 100.0
kr4 scale kr1, ir103, ir104
ar0, ar3 StereoPingPongDelay ar2, ar2, ir100, ir79, ir100, ir101, kr4, 5.0
ir109 = 1.5
ir110 = 0.25
ir111 = 0.6
ir112 = 0.2
kr1 expcurve ir112, ir85
kr4 scale kr1, ir103, ir104
ar2, ar4 StereoPingPongDelay ar0, ar3, ir109, ir110, ir100, ir111, kr4, 5.0
ir117 = 90.0
ar0 compress ar2, ar1, ir36, ir117, ir117, ir104, ir36, ir36, 0.0
ar2 = (ar0 * 0.8)
arl8 = ar2
ar0 compress ar4, ar1, ir36, ir117, ir117, ir104, ir36, ir36, 0.0
ar1 = (ar0 * 0.8)
arl9 = ar1
ar0 = arl8
ar1 = arl9
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