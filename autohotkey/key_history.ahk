﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent
#InstallMouseHook
#InstallKeybdHook
while !(getKeyState("F1", "T"))
      KeyHistory
return
esc::exitapp
