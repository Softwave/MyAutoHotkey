#NoEnv
#SingleInstance, Force
#Include *i ImagePut.ahk

StartLabel:
; Variables
MouseX = 0
MouseY = 0
uiColor = 0xff00aa
invColor = 0xbbaacc

Return
^!p::
ImagePutCursor("mouse1.png", 0, 0)
KeyWait, LButton, D
Loop
{
    MouseGetPos, MouseX, MouseY
    PixelGetColor, uiColor, %MouseX%, %MouseY%, RGB
    Gui, PopUi:New
    Gui, Color, %uiColor%

    

    ; String stuff
    outString := SubStr(uiColor,3)
    string2 = #
    string3 = %string2%%outString%
    Clipboard := string3

    
    invColor := uiColor
    SetFormat, Integer, Hex

    Gui, Font, % "c" Color_Invert(invColor), Consolas 
    Gui, Add, Text, w300 h150 +Center 0x200, %string3% Copied to clipboard ;%invColor%
    Gui, Show
    break
}

ImageDestroy(A_Cursor)
Sleep 2500
Gui, Destroy
Goto, StartLabel

Esc::
ExitApp

Color_Invert(x, a = "") 
{
    ; by Infogulch
    ; inverts the rgb/bgr hex color passed
    ; x: color to be inverted
    ; a: true to invert alpha as well
    return ~x & (a ? 0xFFFFFFFF : 0xFFFFFF)
}