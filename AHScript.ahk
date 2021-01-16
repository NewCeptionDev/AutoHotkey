; NEWCEPTIONDEV'S SCRIPT

; HEADER START
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, shell32.dll, 73 ;this changes the icon into a little laptop thingy. just useful for making it distinct from the others.
#singleinstance force ;so you can only run 1 script at a time and it doens't bother you about it.

SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff
; HEADER END

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; #############################################################################################################################################
; CAPSLOCK SHORTCUTS (except Window Switch Buttons)
; #############################################################################################################################################

#IF, GetKeyState("Capslock", "P")
F1::																								; Open my Autohotkey Script Folder
	autohotkeyfilepath := "C:\Users\" . A_UserName . "\Dropbox\Autohotkey"
	Run, %autohotkeyfilepath%
	return

F3::                                                                                                ; Increase Volume of Spotify
    DetectHiddenWindows, On
    WinGet, winInfo, List, ahk_exe Spotify.exe
    Loop, %winInfo%
    {
        thisID := winInfo%A_Index%
        ControlFocus , , ahk_id %thisID%
        ControlSend, , ^{up}, ahk_id %thisID%
    }
    return

F2::                                                                                                ; Decrease Volume of Spotify
    DetectHiddenWindows, On
    WinGet, winInfo, List, ahk_exe Spotify.exe
    Loop, %winInfo%
    {
        thisID := winInfo%A_Index%
        ControlFocus , , ahk_id %thisID%
        ControlSend, , ^{down}, ahk_id %thisID%
    }
    return

^C::
    Run, "C:\Program Files (x86)\NZXT\CAM\CAM_V3.exe"
    return
#IF
