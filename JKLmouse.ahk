; JKLmouse for AutoHotkey by Michael Geary
; http://jklmouse.com/ - documentation
; http://unlicense.org/ - public domain statement
; Version 0.1: 11/3/2011

#SingleInstance force

repeat = 0

SetKeyDelay, -1
SetMouseDelay, -1

SetHotkeys( modifier ) {
	
	; TODO: refactor keydown and keyup
	
	; KEY DOWN
	
	; Left hand
	Hotkey, %modifier% & W, MouseLeftUp
	Hotkey, %modifier% & E, MouseUp
	Hotkey, %modifier% & R, MouseRightUp
	Hotkey, %modifier% & S, MouseLeft
	Hotkey, %modifier% & D, MouseDown
	Hotkey, %modifier% & F, MouseRight
	Hotkey, %modifier% & X, MouseLeftDown
	Hotkey, %modifier% & C, MouseDown
	Hotkey, %modifier% & V, MouseRightDown
	
	; Right hand
	Hotkey, %modifier% & U, MouseLeftUp
	Hotkey, %modifier% & I, MouseUp
	Hotkey, %modifier% & O, MouseRightUp
	Hotkey, %modifier% & J, MouseLeft
	Hotkey, %modifier% & K, MouseDown
	Hotkey, %modifier% & L, MouseRight
	Hotkey, %modifier% & M, MouseLeftDown
	Hotkey, %modifier% & `, , MouseDown
	Hotkey, %modifier% & `. , MouseRightDown
	
	; Numeric
	Hotkey, %modifier% & 7, MouseLeftUp
	Hotkey, %modifier% & 8, MouseUp
	Hotkey, %modifier% & 9, MouseRightUp
	Hotkey, %modifier% & 4, MouseLeft
	Hotkey, %modifier% & 5, MouseDown
	Hotkey, %modifier% & 6, MouseRight
	Hotkey, %modifier% & 1, MouseLeftDown
	Hotkey, %modifier% & 2, MouseDown
	Hotkey, %modifier% & 3, MouseRightDown
	
	; Arrows
	Hotkey, %modifier% & Up, MouseUp
	Hotkey, %modifier% & Down, MouseDown
	Hotkey, %modifier% & Left, MouseLeft
	Hotkey, %modifier% & Right, MouseRight
	
	; KEY UP
	
	; Left hand
	Hotkey, %modifier% & W UP, StopAcceleration
	Hotkey, %modifier% & E UP, StopAcceleration
	Hotkey, %modifier% & R UP, StopAcceleration
	Hotkey, %modifier% & S UP, StopAcceleration
	Hotkey, %modifier% & D UP, StopAcceleration
	Hotkey, %modifier% & F UP, StopAcceleration
	Hotkey, %modifier% & X UP, StopAcceleration
	Hotkey, %modifier% & C UP, StopAcceleration
	Hotkey, %modifier% & V UP, StopAcceleration
	
	; Right hand
	Hotkey, %modifier% & U UP, StopAcceleration
	Hotkey, %modifier% & I UP, StopAcceleration
	Hotkey, %modifier% & O UP, StopAcceleration
	Hotkey, %modifier% & J UP, StopAcceleration
	Hotkey, %modifier% & K UP, StopAcceleration
	Hotkey, %modifier% & L UP, StopAcceleration
	Hotkey, %modifier% & M UP, StopAcceleration
	Hotkey, %modifier% & `,  UP, StopAcceleration
	Hotkey, %modifier% & `.  UP, StopAcceleration
	
	; Numeric
	Hotkey, %modifier% & 7 UP, StopAcceleration
	Hotkey, %modifier% & 8 UP, StopAcceleration
	Hotkey, %modifier% & 9 UP, StopAcceleration
	Hotkey, %modifier% & 4 UP, StopAcceleration
	Hotkey, %modifier% & 5 UP, StopAcceleration
	Hotkey, %modifier% & 6 UP, StopAcceleration
	Hotkey, %modifier% & 1 UP, StopAcceleration
	Hotkey, %modifier% & 2 UP, StopAcceleration
	Hotkey, %modifier% & 3 UP, StopAcceleration
	
	; Arrows
	Hotkey, %modifier% & Up UP, StopAcceleration
	Hotkey, %modifier% & Down UP, StopAcceleration
	Hotkey, %modifier% & Left UP, StopAcceleration
	Hotkey, %modifier% & Right UP, StopAcceleration
}

SetHotkeys( "CapsLock" )
SetHotkeys( "~LButton" )
SetHotkeys( "~RButton" )
SetHotkeys( "~MButton" )
SetHotkeys( "~XButton1" )
SetHotkeys( "~XButton2" )

return

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
