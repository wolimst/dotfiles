#NoEnv
#SingleInstance force
CoordMode, ToolTip, Screen

#z:: ; WinKey + Z
    WinGet, currentWindow, ID, A
    WinGet, ExStyle, ExStyle, ahk_id %currentWindow%
    if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
    {
        Winset, AlwaysOnTop, off, ahk_id %currentWindow%
        ToolTip, Always on Top OFF, 0, 9999
        SetTimer, RemoteAlwyasOnTopTooltip, 1000
    }
    else
    {
        WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
        ToolTip, Always on Top On, 0, 9999
        SetTimer, RemoteAlwyasOnTopTooltip, 1000
    }
return

RemoteAlwyasOnTopTooltip:
    SetTimer, RemoteAlwyasOnTopTooltip, Off
    ToolTip
return
