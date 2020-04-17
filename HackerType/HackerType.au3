#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=E:\Icon\Metro\Dakirby309-Windows-8-Metro-Apps-Command-Prompt-Metro.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Comment=Chương trình giúp bạn trở thành một hacker tài giỏi trong ... trí tưởng tượng của bạn =)))
#AutoIt3Wrapper_Res_Description=KyTs - HackerType
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=KyTs - Hw
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         KyTs
 Version:		 1.0.0.0
 Features:		 Help you feeling to be a hacker!!!

#ce ----------------------------------------------------------------------------

#include <GUIConstants.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <GUIEdit.au3>
#include "IsPressed_UDF.au3"

Global $Data_AutoIT, $Data_CSharp, $Data_HTML, $Data_Java, $Data_Pascal
Global $Posi_AutoIT = -1, $Posi_CSharp = -1, $Posi_HTML = -1, $Posi_Java = -1, $Posi_Pascal = -1
Global $AutoIT, $Pascal, $CSharp, $Java, $HTML

_Load()

Global $hGUI = GUICreate("ABC", @DesktopWidth + 5, @DesktopHeight + 5, -1, -1, $WS_POPUP)
GUISetBkColor(0x000000)

$Pascal = GUICtrlCreateEdit("Pascal>_" & @CRLF, 10, 10, 300, (@DesktopHeight/2)-15, BitOR($ES_READONLY, $ES_AUTOVSCROLL))
GUICtrlSetColor(-1, 0x1AFF00)
GUICtrlSetBkColor(-1, 0x0A0A0A)
GUICtrlSetFont(-1, 10,0, 0, "Lucida Console", 100)
GUICtrlSetState(-1, $GUI_NOFOCUS)

$AutoIT = GUICtrlCreateEdit("AutoIT>_" & @CRLF, 10, (@DesktopHeight/2)+5, 300, (@DesktopHeight/2)-15, BitOR($ES_READONLY, $ES_AUTOVSCROLL))
GUICtrlSetColor(-1, 0x1AFF00)
GUICtrlSetBkColor(-1, 0x0A0A0A)
GUICtrlSetFont(-1, 10,0, 0, "Lucida Console", 100)
GUICtrlSetState(-1, $GUI_NOFOCUS)

$CSharp = GUICtrlCreateEdit("CSharp>_" & @CRLF, 320, 10, (@DesktopWidth-650), (@DesktopHeight-180), BitOR($ES_READONLY, $ES_AUTOVSCROLL))
GUICtrlSetColor(-1, 0x1AFF00)
GUICtrlSetBkColor(-1, 0x0A0A0A)
GUICtrlSetFont(-1, 10,0, 0, "Lucida Console", 100)
GUICtrlSetState(-1, $GUI_NOFOCUS)

$Java = GUICtrlCreateEdit("Java>_" & @CRLF, 320, @DesktopHeight-160, (@DesktopWidth-650), 150, BitOR($ES_READONLY, $ES_AUTOVSCROLL))
GUICtrlSetColor(-1, 0x1AFF00)
GUICtrlSetBkColor(-1, 0x0A0A0A)
GUICtrlSetFont(-1, 10,0, 0, "Lucida Console", 100)
GUICtrlSetState(-1, $GUI_NOFOCUS)

$HTML = GUICtrlCreateEdit("HTML>_" & @CRLF, (@DesktopWidth-320), 10, 300, @DesktopHeight-20, BitOR($ES_READONLY, $ES_AUTOVSCROLL))
GUICtrlSetColor(-1, 0x1AFF00)
GUICtrlSetBkColor(-1, 0x0A0A0A)
GUICtrlSetFont(-1, 10,0, 0, "Lucida Console", 100)
GUICtrlSetState(-1, $GUI_NOFOCUS)

GUISetState()

AdlibRegister("SetData",50)

While 1
	If _IsAlphaNumKeyPressed() Then
		_KeyPressed()
	ElseIf _IsPressed("1B") Then
		Exit
	EndIf
	Switch GUIGetMsg()
		Case -3
			Exit
	EndSwitch
	Sleep(100)
WEnd

Func _KeyPressed()
	If $Posi_CSharp >= UBound($Data_CSharp)-1 Then $Posi_CSharp = -1
	$Posi_CSharp +=3
	_GUICtrlEdit_AppendText($CSharp, $Data_CSharp[$Posi_CSharp-2] & @CRLF)
	If $Posi_CSharp-1 <= UBound($Data_CSharp)-1 Then _GUICtrlEdit_AppendText($CSharp, $Data_CSharp[$Posi_CSharp-1] & @CRLF)
	If $Posi_CSharp <= UBound($Data_CSharp)-1 Then _GUICtrlEdit_AppendText($CSharp, $Data_CSharp[$Posi_CSharp] & @CRLF)
EndFunc

Func SetData()
	If $Posi_Pascal == UBound($Data_Pascal)-1 Then $Posi_Pascal = -1
	$Posi_Pascal +=1
	_GUICtrlEdit_AppendText($Pascal, $Data_Pascal[$Posi_Pascal] & @CRLF)

	If $Posi_AutoIT == UBound($Data_AutoIT)-1 Then $Posi_AutoIT = -1
	$Posi_AutoIT +=1
	_GUICtrlEdit_AppendText($AutoIT, $Data_AutoIT[$Posi_AutoIT] & @CRLF)

	If $Posi_Java == UBound($Data_Java)-1 Then $Posi_Java = -1
	$Posi_Java +=1
	_GUICtrlEdit_AppendText($Java, $Data_Java[$Posi_Java] & @CRLF)

	If $Posi_HTML == UBound($Data_HTML)-1 Then $Posi_HTML = -1
	$Posi_HTML +=1
	_GUICtrlEdit_AppendText($HTML, $Data_HTML[$Posi_HTML] & @CRLF)
EndFunc

Func _Load()
	Local $hFile
	$hFile = FileOpen("Source\AutoIT.File")
	$Data_AutoIT = FileReadToArray($hFile)
	FileClose($hFile)

	$hFile = FileOpen("Source\CSharp.File")
	$Data_CSharp = FileReadToArray($hFile)
	FileClose($hFile)

	$hFile = FileOpen("Source\Java.File")
	$Data_Java = FileReadToArray($hFile)
	FileClose($hFile)

	$hFile = FileOpen("Source\Pascal.File")
	$Data_Pascal = FileReadToArray($hFile)
	FileClose($hFile)

	$hFile = FileOpen("Source\HTML.File")
	$Data_HTML = FileReadToArray($hFile)
	FileClose($hFile)
EndFunc