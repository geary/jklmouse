; JKLmouse for AutoHotkey by Michael Geary
; http://www.jklmouse.com/ - documentation
; http://unlicense.org/ - public domain statement
; Version 0.1: 11/3/2011

#SingleInstance force

iconPath := RegExReplace( A_ScriptFullPath, "i).ahk$", ".ico" )
Menu, Tray, Icon, %iconPath%
Menu, Tray, Tip, JKLmouse
Menu, Tray, Add
Menu, Tray, Add, About JKLmouse, MenuAbout

TrayTip JKLmouse, The Automatic Keyboard Mouse

SetMouseDelay, -1

repeat := 0

SetKeys( "CapsLock" )
SetKeys( "~LButton" )
SetKeys( "~RButton" )
SetKeys( "~MButton" )
SetKeys( "~XButton1" )
SetKeys( "~XButton2" )

return

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

SetKey( mod, key, action ) {
	keydown = %mod% & %key%
	Hotkey %keydown%, %action%
	Hotkey %keydown% UP, StopAcceleration
}

Move( x, y ) {
	global repeat
	++repeat
	factor := Floor( ( repeat + 1 ) / 2 )
	x := x * factor
	y := y * factor
	MouseMove, x, y, 0, R
}

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

StopAcceleration:
	repeat = 0
	return

MenuAbout:
	Run, http://www.jklmouse.com/
	return
