; JKLmouse for AutoHotkey by Michael Geary
; http://www.jklmouse.com/ - documentation
; http://unlicense.org/ - public domain statement
; Version 0.1: 11/3/2011

#SingleInstance force

; Use either the embedded icon in a compiled .exe,
; or a separate .ico file when running the .ahk script.
iconPath := RegExReplace( A_ScriptFullPath, "i).ahk$", ".ico" )

; Set up the tray icon and menu
Menu, Tray, Icon, %iconPath%
Menu, Tray, Tip, JKLmouse
Menu, Tray, Add
Menu, Tray, Add, About JKLmouse, MenuAbout

; Display tray balloon
; TODO: more useful content?
; TODO: display this only during an install
TrayTip JKLmouse, The Automatic Keyboard Mouse

; Remove forced delay between triggered mouse events.
; TODO: experiment with this when accelerated
SetMouseDelay, -1

; Hotkey repeat count for acceleration
repeat := 0

; Each of these modifier keys enables the same set of JKLmouse hotkeys
SetKeys( "CapsLock" )
SetKeys( "~LButton" )
SetKeys( "~RButton" )
SetKeys( "~MButton" )
SetKeys( "~XButton1" )
SetKeys( "~XButton2" )

return

; Set up all the hotkeys for a specific modifier key
SetKeys( mod ) {
	
	; Left hand
	SetKey( mod, "W", "MouseLeftUp" )
	SetKey( mod, "E", "MouseUp" )
	SetKey( mod, "R", "MouseRightUp" )
	SetKey( mod, "S", "MouseLeft" )
	SetKey( mod, "D", "MouseDown" )
	SetKey( mod, "F", "MouseRight" )
	SetKey( mod, "X", "MouseLeftDown" )
	SetKey( mod, "C", "MouseDown" )
	SetKey( mod, "V", "MouseRightDown" )
	
	; Right hand
	SetKey( mod, "U", "MouseLeftUp" )
	SetKey( mod, "I", "MouseUp" )
	SetKey( mod, "O", "MouseRightUp" )
	SetKey( mod, "J", "MouseLeft" )
	SetKey( mod, "K", "MouseDown" )
	SetKey( mod, "L", "MouseRight" )
	SetKey( mod, "M", "MouseLeftDown" )
	SetKey( mod, "`,","MouseDown" )
	SetKey( mod, "`.","MouseRightDown" )
	
	; Numeric
	SetKey( mod, "7", "MouseLeftUp" )
	SetKey( mod, "8", "MouseUp" )
	SetKey( mod, "9", "MouseRightUp" )
	SetKey( mod, "4", "MouseLeft" )
	SetKey( mod, "5", "MouseDown" )
	SetKey( mod, "6", "MouseRight" )
	SetKey( mod, "1", "MouseLeftDown" )
	SetKey( mod, "2", "MouseDown" )
	SetKey( mod, "3", "MouseRightDown" )
	
	; Arrows
	SetKey( mod, "Up", "MouseUp" )
	SetKey( mod, "Down", "MouseDown" )
	SetKey( mod, "Left", "MouseLeft" )
	SetKey( mod, "Right", "MouseRight" )
}

; Set up one hotkey by combining the modifier and key names.
; Take the specified action on key down,
; and always stop acceleration on key up.
SetKey( mod, key, action ) {
	keydown = %mod% & %key%
	Hotkey %keydown%, %action%
	Hotkey %keydown% UP, StopAcceleration
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
MouseLeftUp:
	Move( -1, -1 )
	return
MouseRightUp:
	Move( 1, -1 )
	return
MouseLeftDown:
	Move( -1, 1 )
	return
MouseRightDown:
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
