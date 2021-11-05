; + Shift
; ^ Control
; ! Alt
; # Win
; < Left (e.g. <!a:: Left Alt + A)
; > Right (e.g. >+<^a:: Right Shift + Left Ctrl + A)
; * Wildcard

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

#F::Run, firefox.exe
#G::Run, notepad.exe
#C::Run, calc.exe
#T::Run, wt.exe
#[:: Send {Volume_Down}
#]:: Send {Volume_Up}
XButton1 & WheelDown:: Send {Volume_Down}
XButton1 & WheelUp:: Send {Volume_Up}
!+Q:: Send {Alt down}{F4}{Alt up}

; Vim-like hotkeys

; Navigations
; CapsLock & h:: left  ; duplicate
CapsLock & j:: down
CapsLock & k:: up
CapsLock & l:: right

CapsLock & 0:: Home
CapsLock & 4:: End

CapsLock & u::
    if (GetKeyState("Control", "P"))
        Send {PgUp}
    return
CapsLock & d::
    if (GetKeyState("Control", "P"))
        Send {PgDn}
    return

CapsLock & b::
    if (GetKeyState("Shift", "P"))
        Send {Control down}{Shift down}{left}{Shift up}{Control up}
    else
        Send {Control down}{left}{Control up}
    return

CapsLock & w:: 
    if (GetKeyState("Shift", "P"))
        Send {Control down}{Shift down}{right}{Shift up}{Control up}
    else
        Send {Control down}{right}{Control up}
    return

; Text modifications
CapsLock & x:: Delete
CapsLock & h::
    if (GetKeyState("Control", "P"))
        Send {BackSpace}
    else
        Send {left}
    return

CapsLock & C::
    if (GetKeyState("Shift", "P"))
        Send {Shift down}{End}{Shift up}{Delete}
    return
CapsLock & S::
    if (GetKeyState("Shift", "P"))
        Send {Home}{Shift down}{End}{Shift up}{Delete}
    return

; Change the hotkey to enable CapsLock and disable CapsLock key.
; Need to be placed below hotkeys using CapsLock.
RControl & CapsLock::
    if (GetKeyState("CapsLock", "T"))
        SetCapsLockState, AlwaysOff  ; Prevent unintended CapsLock On while using CapsLock hotkeys
    else
        SetCapsLockState, On
return
CapsLock:: return

; Toggle focus on the taskbar
CapsLock & F2::
    if (WinActive("ahk_class Shell_TrayWnd"))
    {
        WinActivate ahk_id %window_id%
    }
    else
    {
        WinGet, window_id, ID, A
        WinActivate ahk_class Shell_TrayWnd
    }
    return
