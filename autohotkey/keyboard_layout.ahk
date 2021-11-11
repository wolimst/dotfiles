; Assign CapsLock hotkeys to change keyboard layouts
; Turn IME on automatically when switched to Korean and Japanese.

#NoEnv
#SingleInstance force
SendMode Input

CapsLock & n:: change_layout("en")
CapsLock & ,:: change_layout("ko")
CapsLock & .:: change_layout("ja")
$CapsLock:: change_layout(last_layout, false)

; Change keyboard layout to given locale
change_layout(locale, turn_on_ime:=true)
{
    if (locale = "en")
        enable_english()
    else if (locale = "ko")
        enable_korean(turn_on_ime)
    else if (locale = "ja")
        enable_japanese(turn_on_ime)
    else
        return

    update_history(locale)
    return
}

; Update current and last layout information
update_history(locale)
{
    global last_layout
    static current_layout
    if (current_layout != locale)
    {
        last_layout := current_layout
        current_layout := locale
    }
    return
}

; Change keyboard layout to English
enable_english()
{
    PostMessage 0x50, 0, 0x4090409,, A
    KeyWait, CapsLock
    return
}

; Change keyboard layout to Korean
enable_korean(turn_on_ime:=true)
{
    PostMessage 0x50, 0, 0x4120412,, A
    KeyWait, CapsLock
    if (turn_on_ime and is_ime_on() = 0)
        Send {vk15sc138}
    return
}

; Change keyboard layout to Japanese
enable_japanese(turn_on_ime:=true)
{
    PostMessage 0x50, 0, 0x4110411,, A
    KeyWait, CapsLock
    if (turn_on_ime and is_ime_on() = 0)
        Send {vkF2sc070B}
    return
}

; Return 1 if IME is on, else 0
is_ime_on()
{
    WinGet, vcurrentwindow, ID, A
    ime_on := DllCall("user32.dll\SendMessageA", "UInt", DllCall("imm32.dll\ImmGetDefaultIMEWnd", "Uint", vcurrentwindow), "UInt", 0x0283, "Int", 0x0005, "Int", 0)
    return ime_on
}
