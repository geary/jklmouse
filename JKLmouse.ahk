; Using Keyboard Numpad as a Mouse -- by deguix
; http://www.autohotkey.com

;START OF CONFIG SECTION

#SingleInstance force
#MaxHotkeysPerInterval 500

; Using the keyboard hook to implement the Numpad hotkeys prevents
; them from interfering with the generation of ANSI characters such
; as à.  This is because AutoHotkey generates such characters
; by holding down ALT and sending a series of Numpad keystrokes.
; Hook hotkeys are smart enough to ignore such keystrokes.
#UseHook

MouseSpeed = 1
MouseAccelerationSpeed = 1
MouseMaxSpeed = 5

;Mouse wheel speed is also set on Control Panel. As that
;will affect the normal mouse behavior, the real speed of
;these three below are times the normal mouse wheel speed.
MouseWheelSpeed = 1
MouseWheelAccelerationSpeed = 1
MouseWheelMaxSpeed = 5

;END OF CONFIG SECTION

;This is needed or key presses would faulty send their natural
;actions. Like NumPadDiv would send sometimes "/" to the
;screen.       
#InstallKeybdHook

Temp = 0
Temp2 = 0

MouseCurrentAccelerationSpeed = 0
MouseCurrentSpeed = %MouseSpeed%

MouseWheelCurrentAccelerationSpeed = 0
MouseWheelCurrentSpeed = %MouseSpeed%

SetKeyDelay, -1
SetMouseDelay, -1

; CAPS LOCK KEYS

; Left hand
Hotkey, CapsLock & W, MouseLeftUp
Hotkey, CapsLock & E, MouseUp
Hotkey, CapsLock & R, MouseRightUp
Hotkey, CapsLock & S, MouseLeft
Hotkey, CapsLock & D, MouseDown
Hotkey, CapsLock & F, MouseRight
Hotkey, CapsLock & X, MouseLeftDown
Hotkey, CapsLock & C, MouseDown
Hotkey, CapsLock & V, MouseRightDown

; Right hand
Hotkey, CapsLock & U, MouseLeftUp
Hotkey, CapsLock & I, MouseUp
Hotkey, CapsLock & O, MouseRightUp
Hotkey, CapsLock & J, MouseLeft
Hotkey, CapsLock & K, MouseDown
Hotkey, CapsLock & L, MouseRight
Hotkey, CapsLock & M, MouseLeftDown
Hotkey, CapsLock & `, , MouseDown
Hotkey, CapsLock & `. , MouseRightDown

; Numeric
Hotkey, CapsLock & 7, MouseLeftUp
Hotkey, CapsLock & 8, MouseUp
Hotkey, CapsLock & 9, MouseRightUp
Hotkey, CapsLock & 4, MouseLeft
Hotkey, CapsLock & 5, MouseDown
Hotkey, CapsLock & 6, MouseRight
Hotkey, CapsLock & 1, MouseLeftDown
Hotkey, CapsLock & 2, MouseDown
Hotkey, CapsLock & 3, MouseRightDown

; Arrows
Hotkey, CapsLock & Up, MouseUp
Hotkey, CapsLock & Down, MouseDown
Hotkey, CapsLock & Left, MouseLeft
Hotkey, CapsLock & Right, MouseRight

; LEFT BUTTON KEYS

; Left hand
Hotkey, ~LButton & W, MouseLeftUp
Hotkey, ~LButton & E, MouseUp
Hotkey, ~LButton & R, MouseRightUp
Hotkey, ~LButton & S, MouseLeft
Hotkey, ~LButton & D, MouseDown
Hotkey, ~LButton & F, MouseRight
Hotkey, ~LButton & X, MouseLeftDown
Hotkey, ~LButton & C, MouseDown
Hotkey, ~LButton & V, MouseRightDown

; Right hand
Hotkey, ~LButton & U, MouseLeftUp
Hotkey, ~LButton & I, MouseUp
Hotkey, ~LButton & O, MouseRightUp
Hotkey, ~LButton & J, MouseLeft
Hotkey, ~LButton & K, MouseDown
Hotkey, ~LButton & L, MouseRight
Hotkey, ~LButton & M, MouseLeftDown
Hotkey, ~LButton & `, , MouseDown
Hotkey, ~LButton & `. , MouseRightDown

; Numeric
Hotkey, ~LButton & 7, MouseLeftUp
Hotkey, ~LButton & 8, MouseUp
Hotkey, ~LButton & 9, MouseRightUp
Hotkey, ~LButton & 4, MouseLeft
Hotkey, ~LButton & 5, MouseDown
Hotkey, ~LButton & 6, MouseRight
Hotkey, ~LButton & 1, MouseLeftDown
Hotkey, ~LButton & 2, MouseDown
Hotkey, ~LButton & 3, MouseRightDown

; Arrows
Hotkey, ~LButton & Up, MouseUp
Hotkey, ~LButton & Down, MouseDown
Hotkey, ~LButton & Left, MouseLeft
Hotkey, ~LButton & Right, MouseRight

; RIGHT BUTTON KEYS

; Left hand
Hotkey, ~RButton & W, MouseLeftUp
Hotkey, ~RButton & E, MouseUp
Hotkey, ~RButton & R, MouseRightUp
Hotkey, ~RButton & S, MouseLeft
Hotkey, ~RButton & D, MouseDown
Hotkey, ~RButton & F, MouseRight
Hotkey, ~RButton & X, MouseLeftDown
Hotkey, ~RButton & C, MouseDown
Hotkey, ~RButton & V, MouseRightDown

; Right hand
Hotkey, ~RButton & U, MouseLeftUp
Hotkey, ~RButton & I, MouseUp
Hotkey, ~RButton & O, MouseRightUp
Hotkey, ~RButton & J, MouseLeft
Hotkey, ~RButton & K, MouseDown
Hotkey, ~RButton & L, MouseRight
Hotkey, ~RButton & M, MouseLeftDown
Hotkey, ~RButton & `, , MouseDown
Hotkey, ~RButton & `. , MouseRightDown

; Numeric
Hotkey, ~RButton & 7, MouseLeftUp
Hotkey, ~RButton & 8, MouseUp
Hotkey, ~RButton & 9, MouseRightUp
Hotkey, ~RButton & 4, MouseLeft
Hotkey, ~RButton & 5, MouseDown
Hotkey, ~RButton & 6, MouseRight
Hotkey, ~RButton & 1, MouseLeftDown
Hotkey, ~RButton & 2, MouseDown
Hotkey, ~RButton & 3, MouseRightDown

; Arrows
Hotkey, ~RButton & Up, MouseUp
Hotkey, ~RButton & Down, MouseDown
Hotkey, ~RButton & Left, MouseLeft
Hotkey, ~RButton & Right, MouseRight

; MIDDLE BUTTON KEYS

; Left hand
Hotkey, ~MButton & W, MouseLeftUp
Hotkey, ~MButton & E, MouseUp
Hotkey, ~MButton & R, MouseRightUp
Hotkey, ~MButton & S, MouseLeft
Hotkey, ~MButton & D, MouseDown
Hotkey, ~MButton & F, MouseRight
Hotkey, ~MButton & X, MouseLeftDown
Hotkey, ~MButton & C, MouseDown
Hotkey, ~MButton & V, MouseRightDown

; Right hand
Hotkey, ~MButton & U, MouseLeftUp
Hotkey, ~MButton & I, MouseUp
Hotkey, ~MButton & O, MouseRightUp
Hotkey, ~MButton & J, MouseLeft
Hotkey, ~MButton & K, MouseDown
Hotkey, ~MButton & L, MouseRight
Hotkey, ~MButton & M, MouseLeftDown
Hotkey, ~MButton & `, , MouseDown
Hotkey, ~MButton & `. , MouseRightDown

; Numeric
Hotkey, ~MButton & 7, MouseLeftUp
Hotkey, ~MButton & 8, MouseUp
Hotkey, ~MButton & 9, MouseRightUp
Hotkey, ~MButton & 4, MouseLeft
Hotkey, ~MButton & 5, MouseDown
Hotkey, ~MButton & 6, MouseRight
Hotkey, ~MButton & 1, MouseLeftDown
Hotkey, ~MButton & 2, MouseDown
Hotkey, ~MButton & 3, MouseRightDown

; Arrows
Hotkey, ~MButton & Up, MouseUp
Hotkey, ~MButton & Down, MouseDown
Hotkey, ~MButton & Left, MouseLeft
Hotkey, ~MButton & Right, MouseRight

; EXTRA BUTTON 1 KEYS

; Left hand
Hotkey, ~XButton1 & W, MouseLeftUp
Hotkey, ~XButton1 & E, MouseUp
Hotkey, ~XButton1 & R, MouseRightUp
Hotkey, ~XButton1 & S, MouseLeft
Hotkey, ~XButton1 & D, MouseDown
Hotkey, ~XButton1 & F, MouseRight
Hotkey, ~XButton1 & X, MouseLeftDown
Hotkey, ~XButton1 & C, MouseDown
Hotkey, ~XButton1 & V, MouseRightDown

; Right hand
Hotkey, ~XButton1 & U, MouseLeftUp
Hotkey, ~XButton1 & I, MouseUp
Hotkey, ~XButton1 & O, MouseRightUp
Hotkey, ~XButton1 & J, MouseLeft
Hotkey, ~XButton1 & K, MouseDown
Hotkey, ~XButton1 & L, MouseRight
Hotkey, ~XButton1 & M, MouseLeftDown
Hotkey, ~XButton1 & `, , MouseDown
Hotkey, ~XButton1 & `. , MouseRightDown

; Numeric
Hotkey, ~XButton1 & 7, MouseLeftUp
Hotkey, ~XButton1 & 8, MouseUp
Hotkey, ~XButton1 & 9, MouseRightUp
Hotkey, ~XButton1 & 4, MouseLeft
Hotkey, ~XButton1 & 5, MouseDown
Hotkey, ~XButton1 & 6, MouseRight
Hotkey, ~XButton1 & 1, MouseLeftDown
Hotkey, ~XButton1 & 2, MouseDown
Hotkey, ~XButton1 & 3, MouseRightDown

; Arrows
Hotkey, ~XButton1 & Up, MouseUp
Hotkey, ~XButton1 & Down, MouseDown
Hotkey, ~XButton1 & Left, MouseLeft
Hotkey, ~XButton1 & Right, MouseRight

; EXTRA BUTTON 2 KEYS

; Left hand
Hotkey, ~XButton2 & W, MouseLeftUp
Hotkey, ~XButton2 & E, MouseUp
Hotkey, ~XButton2 & R, MouseRightUp
Hotkey, ~XButton2 & S, MouseLeft
Hotkey, ~XButton2 & D, MouseDown
Hotkey, ~XButton2 & F, MouseRight
Hotkey, ~XButton2 & X, MouseLeftDown
Hotkey, ~XButton2 & C, MouseDown
Hotkey, ~XButton2 & V, MouseRightDown

; Right hand
Hotkey, ~XButton2 & U, MouseLeftUp
Hotkey, ~XButton2 & I, MouseUp
Hotkey, ~XButton2 & O, MouseRightUp
Hotkey, ~XButton2 & J, MouseLeft
Hotkey, ~XButton2 & K, MouseDown
Hotkey, ~XButton2 & L, MouseRight
Hotkey, ~XButton2 & M, MouseLeftDown
Hotkey, ~XButton2 & `, , MouseDown
Hotkey, ~XButton2 & `. , MouseRightDown

; Numeric
Hotkey, ~XButton2 & 7, MouseLeftUp
Hotkey, ~XButton2 & 8, MouseUp
Hotkey, ~XButton2 & 9, MouseRightUp
Hotkey, ~XButton2 & 4, MouseLeft
Hotkey, ~XButton2 & 5, MouseDown
Hotkey, ~XButton2 & 6, MouseRight
Hotkey, ~XButton2 & 1, MouseLeftDown
Hotkey, ~XButton2 & 2, MouseDown
Hotkey, ~XButton2 & 3, MouseRightDown

; Arrows
Hotkey, ~XButton2 & Up, MouseUp
Hotkey, ~XButton2 & Down, MouseDown
Hotkey, ~XButton2 & Left, MouseLeft
Hotkey, ~XButton2 & Right, MouseRight

return

Move( x, y ) {
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

If Action <> 0
{
	IfNotInString, A_ThisLabel, %Action%
	{
		MouseCurrentAccelerationSpeed = 0
		MouseCurrentSpeed = %MouseSpeed%
	}
}
StringReplace, Action, A_ThisLabel, *

ButtonAccelerationStart:
If MouseAccelerationSpeed >= 1
{
	If MouseMaxSpeed > %MouseCurrentSpeed%
	{
		Temp = 0.001
		Temp *= %MouseAccelerationSpeed%
		MouseCurrentAccelerationSpeed += %Temp%
		MouseCurrentSpeed += %MouseCurrentAccelerationSpeed%
	}
}

MouseCurrentSpeedToDirection = 1

MouseCurrentSpeedToSide = 0

MouseCurrentSpeedToDirection *= %MouseCurrentSpeed%
MouseCurrentSpeedToSide *= %MouseCurrentSpeed%

Temp = 0

If Action = MouseUp
{
	MouseCurrentSpeedToDirection *= -1
	MouseMove, %MouseCurrentSpeedToSide%, %MouseCurrentSpeedToDirection%, 0, R
}
else if Action = MouseDown
{
	MouseCurrentSpeedToSide *= -1
	MouseMove, %MouseCurrentSpeedToSide%, %MouseCurrentSpeedToDirection%, 0, R
}
else if Action = MouseLeft
{
	MouseCurrentSpeedToSide *= -1
	MouseCurrentSpeedToDirection *= -1
	MouseMove, %MouseCurrentSpeedToDirection%, %MouseCurrentSpeedToSide%, 0, R
}
else if Action = MouseRight
{
	MouseMove, %MouseCurrentSpeedToDirection%, %MouseCurrentSpeedToSide%, 0, R
}
else if Action = MouseLeftUp
{
	Temp = %MouseCurrentSpeedToDirection%
	Temp -= %MouseCurrentSpeedToSide%
	Temp *= -1
	Temp2 = %MouseCurrentSpeedToDirection%
	Temp2 += %MouseCurrentSpeedToSide%
	Temp2 *= -1
	MouseMove, %Temp%, %Temp2%, 0, R
}
else if Action = MouseRightUp
{
	Temp = %MouseCurrentSpeedToDirection%
	Temp += %MouseCurrentSpeedToSide%
	Temp2 = %MouseCurrentSpeedToDirection%
	Temp2 -= %MouseCurrentSpeedToSide%
	Temp2 *= -1
	MouseMove, %Temp%, %Temp2%, 0, R
}
else if Action = MouseLeftDown
{
	Temp = %MouseCurrentSpeedToDirection%
	Temp += %MouseCurrentSpeedToSide%
	Temp *= -1
	Temp2 = %MouseCurrentSpeedToDirection%
	Temp2 -= %MouseCurrentSpeedToSide%
	MouseMove, %Temp%, %Temp2%, 0, R
}
else if Action = MouseRightDown
{
	Temp = %MouseCurrentSpeedToDirection%
	Temp -= %MouseCurrentSpeedToSide%
	Temp2 *= -1
	Temp2 = %MouseCurrentSpeedToDirection%
	Temp2 += %MouseCurrentSpeedToSide%
	MouseMove, %Temp%, %Temp2%, 0, R
}

SetTimer, ButtonAccelerationEnd, 10
return

ButtonAccelerationEnd:
GetKeyState, kstate, %Action%, P
if kstate = D
	Goto ButtonAccelerationStart

SetTimer, ButtonAccelerationEnd, off
MouseCurrentAccelerationSpeed = 0
MouseCurrentSpeed = %MouseSpeed%
Action = 0
return
