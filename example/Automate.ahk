#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance,Force

FileDelete, index.html
sleep, 20
CopyDir := A_ScriptDir . "\res"


FileSelectFile, InputVideo
FileCopy, %InputVideo%, %CopyDir%
sleep, 80
SplitPath, InputVideo, name, dir, ext, name_no_ext,

MovedFile := "res/" . name
InputVideo2 := "video.src = '" . MovedFile . "';"

Sauce := A_ScriptDir . "\source.html"
fileread, oWo, %Sauce%
oWo := StrReplace(oWo, "video.src =", InputVideo2)


;msgbox % oWo
CreateServer := ComSpec . " /k " . "http-server -p 666"
FileAppend, %oWo%, index.html
run, %CreateServer%

WinWait, http-server
gosub, SettingsGUI
Return


Continue:
msgbox, Opening Chrome, prepare to glitch video.
sleep, 2000

CaptureCanvas := ComSpec . " /c " . " timecut " . chr(0x22) . "http://127.0.0.1:666" . chr(0x22) . " --executable-path " . chr(0x22) . "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" . chr(0x22) . " --no-headless --canvas-capture-mode immediate:png --viewport=" . Resolution . " --duration=" . Duration . " --output-options=" . chr(0x22) . "-q:v 0" . chr(0x22) . " --output=CANVASOUTPUT.mp4"
RunWait, %CaptureCanvas%

MsgBox, Applying crt filter!
ApplyCRTFilter := ComSpec . " /k " . " ffmpeg -i CANVASOUTPUT.mp4 -i " . chr(0x22) . InputVideo . chr(0x22) . " -lavfi " . chr(0x22) . "[0:v]vignette,vignette,format=gbrp,lenscorrection=k1=0.2:k2=0.2[out]" . chr(0x22) . " -map " . chr(0x22) . "[out]" . chr(0x22) . " -map 1:a -f mp4 -q:v 0 -pix_fmt yuv420p -t " . Duration . " Final.mp4 -y"
RunWait, %ApplyCRTFilter%
ExitApp
return

SettingsGUI:
SetBatchLines -1
Gui Font, s12
Gui Add, Edit, x20 y68 w90 h31 vResolution, 1080,720
Gui Font
Gui Font, s12
Gui Add, Edit, x158 y68 w90 h31 vDuration, 5
Gui Font
Gui Font, s9
Gui Add, Text, x3 y38 w131 h23 +0x200, Canvas/Output Resolution
Gui Font
Gui Add, Text, x154 y38 w97 h23 +0x200, Total Video Duration
Gui Font, s10
Gui Add, Button, x89 y7 w80 h28 gCloseSettings, Apply
Gui Font
Gui Show, w267 h115, Settings
Gui -sysmenu
Gui +AlwaysOnTop
Return

CloseSettings:
Gui, Submit, Nohide
Gui, Hide
gosub, Continue
Return
