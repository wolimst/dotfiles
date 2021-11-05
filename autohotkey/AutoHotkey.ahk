; Frequently used modifiers
; + Shift, ^ Control, ! Alt, # Win, * Wildcard

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force
CoordMode, ToolTip, Screen
SetCapsLockState, AlwaysOff
return

#include keyboard_layout.ahk
#include hotkey.ahk
#include toggle_microphone_mute.ahk
#include always_on_top.ahk
#include easy_window_dragging.ahk
#include input_symbol.ahk