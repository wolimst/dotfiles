#NoEnv
#SingleInstance force
SendMode Input

#z:: ; WinKey + Z
    WinGet, currentWindow, ID, A
    WinGet, ExStyle, ExStyle, ahk_id %currentWindow%
    if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
    {
        Winset, AlwaysOnTop, off, ahk_id %currentWindow%
        ToolTip, Always on Top OFF
        SetTimer, RemoveAlwyasOnTopTooltip, 1000
    }
    else
    {
        WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
        ToolTip, Always on Top On
        SetTimer, RemoveAlwyasOnTopTooltip, 1000
    }
return

RemoveAlwyasOnTopTooltip:
    SetTimer, RemoveAlwyasOnTopTooltip, Off
    ToolTip
return
