; JKLmouse for AutoHotkey by Michael Geary
; http://www.jklmouse.com/ - documentation
; http://unlicense.org/ - public domain statement
; Version 0.1: 11/3/2011

#SingleInstance force

; Use either the embedded icon in a compiled .exe,
; or a separate .ico file when running the .ahk script.
iconPath := RegExReplace( A_ScriptFullPath, "i).ahk$", ".ico" )

keyMap := ""

keyMaps :=
(join
{
	Arrows: "Up~Up Down~Down Left~Left Right~Right",
	NumPad: "7~UpLeft 8~Up 9~UpRight 4~Left 5~Down 6~Right 1~DownLeft 2~Down 3~DownRight",
	IJKL: "U~UpLeft I~Up O~UpRight J~Left K~Down L~Right M~DownLeft ,~Down .~DownRight",
	HJKL: "H~Left J~Down K~Up L~Right",
	ESDF: "W~UpLeft E~Up R~UpRight S~Left D~Down F~Right X~DownLeft C~Down V~DownRight",
	WASD: "Q~UpLeft W~Up E~UpRight A~Left S~Down D~Right Z~DownLeft X~Down C~DownRight"
}
)

; Set up the tray icon and menu
Menu, Tray, Icon, %iconPath%
Menu, Tray, Tip, JKLmouse
Menu, Tray, Add
Menu, Tray, Add, Left Hand: ESDF, MenuESDF
Menu, Tray, Add, Left Hand: WASD, MenuWASD
Menu, Tray, Add
Menu, Tray, Add, Right Hand: IJKL, MenuIJKL
Menu, Tray, Add, Right Hand: HJKL, MenuHJKL
Menu, Tray, Add
Menu, Tray, Add, About JKLmouse, MenuAbout

Menu, Tray, Check, Left Hand: ESDF
Menu, Tray, Check, Right Hand: IJKL

; Display tray balloon
; TODO: more useful content?
; TODO: display this only during an install
TrayTip JKLmouse, The Automatic Keyboard Mouse

; Remove forced delay between triggered mouse events.
; TODO: experiment with this when accelerated
SetMouseDelay, -1

; Hotkey repeat count for acceleration
repeat := 0

SetKeyMap( "Arrows", "NumPad", "IJKL", "ESDF" )
;SetKeyMap( "Arrows", "NumPad", "HJKL", "WASD" )

;MsgBox % keyMap

SetAllKeys( true )

return

SetKeyMap( keys* ) {
	global keyMap, keyMaps
    for index, value in keys
        keyMap .= keyMaps[value] . " "
    return SubStr( str, 1, -StrLen(sep) )
}

SetAllKeys( on ) {
	; Each of these modifier keys enables the same set of JKLmouse hotkeys
	SetKeys( on, "CapsLock" )
	SetKeys( on, "~LButton" )
	SetKeys( on, "~RButton" )
	SetKeys( on, "~MButton" )
	SetKeys( on, "~XButton1" )
	SetKeys( on, "~XButton2" )
}

; Set up or remove all the hotkeys for a specific modifier key
SetKeys( on, mod ) {
	global keyMap
	Loop, Parse, keyMap, %A_Space%
	{
		StringSplit map, A_LoopField, ~
		SetKey( on, mod, map1, "Mouse" . map2 )
	}
}

; Set up or remove one hotkey by combining the modifier and key names.
; Take the specified action on key down,
; and always stop acceleration on key up.
SetKey( on, mod, key, action ) {
	keydown = %mod% & %key%
	if( on ) {
		Hotkey %keydown%, %action%
		Hotkey %keydown% UP, StopAcceleration
	}
	else {
		Hotkey %keydown%, Off
		Hotkey %keydown% UP, Off
	}
}

; Move the mouse the specifed x and y distances, both scaled by the
; mouse acceleration factor calculated from the key repeat count.
Move( x, y ) {
	global repeat
	++repeat
	factor := Floor( ( repeat + 1 ) / 2 )
	x := x * factor
	y := y * factor
	MouseMove, x, y, 0, R
}

;ArrayJoin( sep, ary ) {
;    for index, value in ary
;		MsgBox % index
;        ;str .= value . sep
;	MsgBox % str
;    return SubStr( str, 1, -StrLen(sep) )
;}

; Handle the keydown for each of the mouse movement directions
; TODO: Maybe a way to simplify this?
MouseUp:
	Move( 0, -1 )
	return
MouseDown:
	Move( 0, 1 )
	return
MouseLeft:
	Move( -1, 0 )
	return
MouseRight:
	Move( 1, 0 )
	return
MouseUpLeft:
	Move( -1, -1 )
	return
MouseUpRight:
	Move( 1, -1 )
	return
MouseDownLeft:
	Move( -1, 1 )
	return
MouseDownRight:
	Move( 1, 1 )
	return

; Handle the keyup for all hotkeys
StopAcceleration:
	repeat = 0
	return

; Handle the About menu item
MenuAbout:
	Run, http://www.jklmouse.com/
	return

MenuESDF:
	return

MenuWASD:
	return

MenuIJKL:
	return

MenuHJKL:
	return

