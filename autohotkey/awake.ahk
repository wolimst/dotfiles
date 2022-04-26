#NoEnv
#SingleInstance force
SendMode Input

isAwakeOn := false

#k:: ; WinKey + K
    isAwakeOn := !isAwakeOn
    if (isAwakeOn) {
        ToolTip, Awake ON
        SetTimer, RemoveAwakeTooltip, 1000
        SetTimer, Awake, 300000
    } else {
        ToolTip, Awake OFF
        SetTimer, RemoveAwakeTooltip, 1000
        SetTimer, Awake, Off
    }
return

Awake:
    Random, rand, 0.0, 1.0
    Sleep, Floor(rand * 5000)
    MouseMove, 0, 0, 0, R
return

RemoveAwakeTooltip:
    SetTimer, RemoveAwakeTooltip, Off
    ToolTip
return
