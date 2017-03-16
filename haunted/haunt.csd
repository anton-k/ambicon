<CsoundSynthesizer>
<CsOptions>
-odac  -d -+rtaudio=jack  -+jack_client=haunted 
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs  = 1

; ----------------------------------------------
; global config

#ifndef PORT
    #define PORT        # 7700 #
#end

gihandle OSCinit $PORT

; number of samples in the bin
#ifndef SIZE
    #define SIZE        # 32 #
#end

gkVolume    init 1

; ----------------------------------------------
; state

giSize      init $SIZE

gkLens[]    init 4
gkIndex[]   init 4
gSFiles[][] init 4, $SIZE

gkRate      init 1
gkSkip      init 0
gkWidth     init 0.75
gkDelaySpan init 0

gkIsOn      init 0
gkTap       init 0

gaLeft      init 0
gaRight     init 0

gkX         init 0.5
gkY         init 0.5

#include "haunt_init.csd"

; ----------------------------------------------
; OSC interface
;
; We can load and clear audio files from memory
; 
;   "/load"   file-name-string,  bin-id-int
;   "/clear"  bin-id-int
;
; We can set the parameters:
;
;   "/set-rate"   value-float    -- rate of repetition  (Hz)
;   "/set-skip"   value-float    -- probability of skipping the playback (0 to 1)
;   "/set-width"  value-float    -- stereo width in panorama (0 to 1)
;
; We can start and stop playback
;
;  "/start"  1          
;  "/stop"   1
;
; We can trigger a sample
;
;  "/tap"    1

; Work with memory

instr LoadMsg
    SFile = ""
    kIdx init 0
    kk init 0

    kk  OSClisten gihandle, "/load", "si", SFile, kIdx

    if (kk > 0 && kIdx < 4) then
        printks "Load file to %d: ", 0, kIdx
        printks SFile, 0
        printks "\n", 0

        gSFiles[kIdx][gkIndex[kIdx]] strcpyk SFile
        gkLens[kIdx] min (gkLens[kIdx] + 1), giSize
        gkIndex[kIdx] = (gkIndex[kIdx] + 1) % giSize
    endif          
endin

alwayson "LoadMsg"

instr ClearMsg
    kk init 0
    kIdx init 0

    kk  OSClisten gihandle, "/clear", "i", kIdx

    if (kk > 0 && kIdx < 4) then
        printks "Clear the corner %d.\n", 0, kIdx        
        gkLens[kIdx] = 0
        gkIndex[kIdx] = 0
    endif
endin

alwayson "ClearMsg"

; Set parameters

#define SET_GLOBAL_PARAM(INSTR'INSTR_STRING'OSC_PATH'VAR) #

instr $INSTR
    kVal    init 0
    kk      init 0

    kk OSClisten gihandle, $OSC_PATH, "f", kVal
    if (kk > 0) then
        printks $INSTR_STRING, 0        
        $VAR = kVal
    endif
endin

alwayson $INSTR_STRING
#

$SET_GLOBAL_PARAM(SetRateMsg'"SetRateMsg"'"/set-rate"'gkRate)
$SET_GLOBAL_PARAM(SetSkipMsg'"SetSkipMsg"'"/set-skip"'gkSkip)
$SET_GLOBAL_PARAM(SetWidthMsg'"SetWidthMsg"'"/set-width"'gkWidth)
$SET_GLOBAL_PARAM(SetX_Msg'"SetX_Msg"'"/set-x"'gkX)
$SET_GLOBAL_PARAM(SetY_Msg'"SetY_Msg"'"/set-y"'gkY)

; Trigger samples

instr StartMsg 
    kVal init 0
    kk init 0

    kk OSClisten gihandle, "/start", "i", kVal
    if (kk > 0) then
        printks "start playback.\n", 0
        gkIsOn = 1
    endif
endin

alwayson "StartMsg"

instr StopMsg 
    kVal init 0
    kk init 0

    kk OSClisten gihandle, "/stop", "i", kVal
    if (kk > 0) then
        printks "stop playback.\n", 0
        gkIsOn = 0
    endif
endin

alwayson "StopMsg"

instr TapMsg 
    kVal init 0
    kk init 0

    kk OSClisten gihandle, "/tap", "i", kVal
    if (kk > 0) then
        printks "tap one.\n", 0
        gkTap = 1
    endif
endin

alwayson "TapMsg"

; ----------------------------------------------
; The audio engine

opcode GetWeights, iiii, ii
    ix, iy xin 
    iw1 = (1 - ix) * (1 - iy)
    iw2 = ix * (1 - iy)
    iw3 = ix * iy
    iw4 = (1 - ix) * iy
    xout iw1, iw2, iw3, iw4
endop

opcode GetBin, i, ii
    ix, iy xin
    iw1, iw2, iw3, iw4 GetWeights ix, iy
    iChoice random 0, 1    

    iRes = 0
    iThresh = iw1
    if (iChoice < iThresh) then
        iRes = 0
    else 
        iThresh += iw2  
        if (iChoice < iThresh) then
            iRes = 1
        else
            iThresh += iw3
            if (iChoice < iThresh) then
                iRes = 2
            else 
                iRes = 3
            endif 
        endif
    endif

    print iRes
    xout iRes
endop

opcode GetId, i, i
    iBin xin
    iMax = i(gkLens[iBin])
    iIndex random 0, iMax
    print iMax, int(iIndex)
    xout int(iIndex)
endop

opcode GetPan, i, 0 
    iRad = i(gkWidth) * 0.5
    iPan random 0.5 - iRad, 0.5 + iRad
    xout iPan
endop

instr Tap 
    iBin, iId, iWidth passign 4
    iBin GetBin i(gkX), i(gkY)
    iId  GetId  iBin    
    SFile strcpy gSFiles[iBin][iId]
    iDur filelen SFile  
    xtratim iDur  

    aLeft init 0
    aRight init 0

    iChnls filenchnls SFile
    if (iChnls == 1) then 
        aLeft diskin2 SFile, 1
        aRight = aLeft
    endif

    if (iChnls == 2) then 
        aLeft, aRight diskin2 SFile, 1
    endif   

    iPan GetPan
    aLeft, aRight pan2 0.5 * (aLeft + aRight), iPan

    gaLeft  += aLeft
    gaRight += aRight    
endin

instr Heart
    kTrig metro gkRate

    if (kTrig * gkIsOn > 0) then
        kIsSkip random 0, 1

        if (kIsSkip > gkSkip) then
            printks "fire\n", 0
            event "i", "Tap", 0, 0.1
        endif        
    endif

    if (gkTap == 1) then
        printks "fire\n", 0
        event "i", "Tap", 0, 0.1
        gkTap = 0
    endif
    

    outs gaLeft * gkVolume, gaRight * gkVolume
    gaLeft = 0
    gaRight = 0
endin

alwayson "Heart"

; -----------------------------------------------

</CsInstruments>
<CsScore>

f0 1000000

i 110 0 -1
e
</CsScore>
</CsoundSynthesizer>
