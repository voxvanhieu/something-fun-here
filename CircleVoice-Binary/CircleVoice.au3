#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=E:\Icon\1457821154_sound.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

	FileName:		CircleVoice.au3
	AutoIt Version: 3.3.14.2
	Author:         KyTs
	Facebook: 		fb.com/hieuvovan143
	Version:		1.0.0.0

#ce ----------------------------------------------------------------------------

#include <GDIPlus.au3>
#Include <string.au3>

Global $hGUI, $gW = 300, $gH = 300
Global $hGraphic, $hBitmap, $hBuffer, $hBrush
Global $iFirst = 125, $iLast = $gW - 50

Global $Circle_Diameter_Original = $iLast - $iFirst
Global $Circle_Diameter = $iFirst
Global $Circle_CenterX = Int($gW/2)
Global $Circle_CenterY = Int($gH/2)
Global $Circle_Left, $Circle_Top, $Circle_Radius

Global $cCircle_Diameter = 100
Global $cCircle_CenterX = $Circle_CenterX
Global $cCircle_CenterY = $Circle_CenterY
Global $cCircle_Radius = Int($cCircle_Diameter/2)
Global $cCircle_Left = $cCircle_CenterX - $cCircle_Radius
Global $cCircle_Top = $cCircle_CenterY - $cCircle_Radius

Global $lpszDevice = "new type waveaudio"
Global $lpszDeviceID = "mywave"
Global $lpszOpenFlags = "alias mywave"
Global $lpszRequest = "level"
Global $lpszFlags = ""
Global $lpszCommand = StringFormat("open %s %s %s", $lpszDevice, $lpszOpenFlags, $lpszFlags)
Global $lpszReturnString = _StringRepeat(" ", 100)
Global $cchReturn = StringLen($lpszReturnString)
Global $mciError = _mciSendString($lpszCommand, $lpszReturnString, $cchReturn, 0)

If $mciError[0] <> 0 Then _mciShowError($mciError[0])
$lpszCommand = StringFormat("status %s %s %s", $lpszDeviceID, $lpszRequest, $lpszFlags);

Global $inc = True
SetCirclePos()

$hGUI = GUICreate("Speaker - KyTs", $gW, $gH)
GUISetState(@SW_SHOW)

_GDIPlus_Startup()
$hBrush = _GDIPlus_BrushCreateSolid(BitOR(0xFF000000, 4560242))
$hBrush2 = _GDIPlus_BrushCreateSolid(BitOR(0xFF000000, _GetDarkerColour(0xFFFFFFFF)))

$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
$hBitmap  = _GDIPlus_BitmapCreateFromGraphics($gW, $gH, $hGraphic)
$hBuffer  = _GDIPlus_ImageGetGraphicsContext($hBitmap)
_GDIPlus_GraphicsSetSmoothingMode($hBuffer, 2)

Do
;~ 	Xài đoạn này thì bỏ dòng "$Circle_Diameter = Int($Circle_Diameter_Original * GetmciVariables() / 100)" đi
;~ 	If ($inc==True) And ($Circle_Diameter<$iLast) Then
;~ 		$Circle_Diameter += 15
;~ 	ElseIf ($inc==True) And ($Circle_Diameter>=$iLast) Then
;~ 		$inc = False
;~ 		$Circle_Diameter -= 15
;~ 	ElseIf ($inc==False) And ($Circle_Diameter>$iFirst) Then
;~ 		$Circle_Diameter -=15
;~ 	Else
;~ 		$inc = True
;~ 		$Circle_Diameter +=15
;~ 	EndIf
	$Circle_Diameter = Int($Circle_Diameter_Original * GetmciVariables() / 100)*2 + $cCircle_Diameter + 25
	_Draw()
	Sleep(20)
Until GUIGetMsg() == -3

_GDIPlus_BrushDispose($hBrush)
_GDIPlus_BitmapDispose($hBitmap)
_GDIPlus_GraphicsDispose($hBuffer)
_GDIPlus_GraphicsDispose($hGraphic)
_GDIPlus_Shutdown()

;~ Graphic Functions
Func _Draw()
;~ 	$Circle_Diameter = Random($iFirst, $iLast, 1)
	SetCirclePos()
	_GDIPlus_GraphicsClear($hBuffer, 0xFFFFFFFF);, 0xFFC0C0C0)
	_GDIPlus_GraphicsFillEllipse($hBuffer, $Circle_Left, $Circle_Top, $Circle_Diameter, $Circle_Diameter, $hBrush)
	_GDIPlus_GraphicsFillEllipse($hBuffer, $cCircle_Left, $cCircle_Top, $cCircle_Diameter, $cCircle_Diameter, $hBrush2)
	_GDIPlus_GraphicsDrawImage($hGraphic, $hBitmap, 0, 0)
EndFunc

Func SetCirclePos()
	$Circle_Radius = Int($Circle_Diameter/2)
	$Circle_Left = $Circle_CenterX - $Circle_Radius
	$Circle_Top  = $Circle_CenterY- $Circle_Radius
EndFunc
Func _GetColor()
	Return (Random(0, 255, 1) * 0x10000) + (Random(0, 255, 1) * 0x100) + Random(0, 255, 1)
EndFunc
Func _GetDarkerColour($Colour)
    Local $Red, $Green, $Blue
    $Red = (BitAND($Colour, 0xff0000) / 0x10000) - 40
    $Green = (BitAND($Colour, 0x00ff00) / 0x100) - 40
    $Blue = (BitAND($Colour, 0x0000ff)) - 40
    If $Red < 0 Then $Red = 0
    If $Green < 0 Then $Green = 0
    If $Blue < 0 Then $Blue = 0
    Return ($Red * 0x10000) + ($Green * 0x100) + $Blue
EndFunc ;==>_GetDarkerColour

;~ Audio Functions
Func GetmciVariables()
	$mciError = _mciSendString($lpszCommand, $lpszReturnString, $cchReturn, 0);
	If $mciError[0] <> 0 Then _mciShowError($mciError[0])
	$mciError = (100*$mciError[2])/128
	If $mciError > 100 Then $mciError = 100
	Return Int($mciError)
EndFunc
Func _mciSendString($lpszCommand, $lpszReturnString, $cchReturn, $hwndCallback)
    Return DllCall("winmm.dll", "long", "mciSendStringA", "str", $lpszCommand, "str", $lpszReturnString, "long", $cchReturn, "long", 0)
EndFunc ;==>_mciSendString
Func _mciShowError($mciError)
    Global $errStr; Error message
    $errStr = _StringRepeat(" ", 100); Reserve some space for the error message
    $Result = DllCall("winmm.dll", "long", "mciGetErrorStringA", "long", $mciError, "string", $errStr, "long", StringLen($errStr))
    MsgBox(0, "MCI test", "MCI Error Number " & $mciError & ":" & $Result[2])
EndFunc ;==>_mciShowError