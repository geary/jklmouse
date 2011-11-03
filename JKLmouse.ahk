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
