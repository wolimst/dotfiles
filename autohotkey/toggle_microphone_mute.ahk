; https://www.autohotkey.com/docs/commands/SoundSet.htm

#NoEnv
#SingleInstance force
SendMode Input

#m:: ; WinKey + M

    ; Use the SoundCardAnalysis script from the AHK docs to find your mixer value.
    ; Define mixer_value variable in toggle_microphone_mute_mixer_value.ahk
    ; (e.g.) mixer_value := 5
    #include toggle_microphone_mute_mixer_value.ahk

    SoundGet, mic_mute, MASTER, MUTE, % mixer_value
    if (mic_mute)
    {
        SoundSet, +1, MASTER, MUTE, % mixer_value
        if (mic_mute = "On")
            ToolTip, Microphone On
        else
            ToolTip, Microphone Off
        SetTimer, RemoveMicToolTip, 1000
    }
    else
    {
        ToolTip, Cannot find microphone
        SetTimer, RemoveMicToolTip, 1000
    }
return

RemoveMicToolTip:
    SetTimer, RemoveMicToolTip, Off
    ToolTip
return
