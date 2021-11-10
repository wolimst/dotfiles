; Assign CapsLock hotkeys to windows keyboard layout hotkeys (English, Korean, Japanese)
; Turn IME on automatically when switched to Korean and Japanese.

#NoEnv
SendMode Input

; Change keyboard layout to English
CapsLock & n::
    KeyWait, CapsLock
    PostMessage 0x50, 0, 0x4090409,, A
    return

; Change keyboard layout to Korean and turn on the IME
CapsLock & ,::
    KeyWait, CapsLock
    PostMessage 0x50, 0, 0x4120412,, A
    ime_on := is_ime_on()
    if (ime_on = 0)
        Send {vk15sc138}
    return

; Change keyboard layout to Japanese and turn on the IME
CapsLock & .::
    KeyWait, CapsLock
    PostMessage 0x50, 0, 0x4110411,, A
    ime_on := is_ime_on()
    if (ime_on = 0)
        Send {LAlt down}{``}{LAlt up}
    return

; Return 1 if IME is on, else 0
is_ime_on()
{
    WinGet, vcurrentwindow, ID, A
    ime_on := DllCall("user32.dll\SendMessageA", "UInt", DllCall("imm32.dll\ImmGetDefaultIMEWnd", "Uint", vcurrentwindow), "UInt", 0x0283, "Int", 0x0005, "Int", 0)
    return ime_on
}
