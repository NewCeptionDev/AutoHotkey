; NewCeptionDev's AutoHotkey Scripts
; These Scripts contain small enhancements and shortcuts
; Many Enhancements and Shortcuts are based on https://github.com/sebinside/AutoHotkeyScripts

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, shell32.dll, 73 ; this changes the icon
#singleinstance force ;so you can only run 1 script at a time and it doens't bother you about it.
SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; #############################################################################################################################################
; CAPSLOCK SHORTCUTS (except Window Switch Buttons)
; #############################################################################################################################################

#IF, GetKeyState("Capslock", "P")
F1::																								; Open my Autohotkey Script Folder
	autohotkeyfilepath := "D:\Autohotkey"
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

Q::
	Send ``
	Send ``
	Send {Left}
	return

T::
	Send \
	return


E::
	Send, [
	return

R::
	Send, ]
	return

D::
  Send, {{}
  return

F::
  Send, {}}
  return

C::
	callChrome()
	return

#IF

; Shift + Wheel scrolles left / right
#IfWinNotActive Minecraft
+WheelDown::WheelRight
+WheelUp::WheelLeft
#IfWinNotActive

; Overwrites the apostrophe key to be actually usefull without dumb extra key presses
SC00D::
 String := "`` "
 SendRaw %String%
return

#!7::
WinGet, active_name, ProcessName, A
clipboard := active_name
tooltip %active_name%
sleep 1500
tooltip
return

#!8::
inputbox, pse, Ps-Box, Kill Process w/ .exe
if errorlevel = 1
{
pse := clipboard
}
else pse := pse
While WinExist("ahk_exe " pse)
{
process, close, %pse%
}
tooltip %pse% closed
sleep, 1000
tooltip
return

callChrome() {
	IfWinNotExist, ahk_exe chrome.exe
			Run, chrome.exe
		if WinActive("ahk_exe chrome.exe")
			Send ^{tab}
		else
			WinActivate ahk_exe chrome.exe
}
