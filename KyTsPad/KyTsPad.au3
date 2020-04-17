#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=E:\Icon\Notepad-Bloc-notes.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Comment=Phần mềm soạn thảo văn bản giao diện metro - KyTsPad. Mọi quyền lợi từ phần mềm thuộc về Võ Văn Hiếu - KyTs
#AutoIt3Wrapper_Res_Description=KyTsPad
#AutoIt3Wrapper_Res_Fileversion=2.15.0.10
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=KyTs - Hw
#AutoIt3Wrapper_Res_Language=1066
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs
		░░▓▓███  ████████████████████████████████▄▄
		░░▓▓███  ██         ▓███
		░░▓▓███ ██   ██  ██ ▓███  ██████
		░░▓▓█████    ██  ██ ▓███  ██   █
		░░▓▓███████  ██  ██ ▓███  ██
		░░▓▓▌█▐  ▌█  ▌▄  █▐ ▓▐██  ██████
		░░▓▓▌▄▐  ▌█  ▌▄  █▐ ▓▐██       █
		░░▓▓▌█▐  ▌█  ▌▀███▐ ▓▐██  ██████
						 ██
 ▄▄████████████████████████
#ce

#include <GuiEdit.au3>

Global Const $AppName = ' - KyTsPad'
Global $FileName = 'Untitled', $Tile = 'Untitled - KyTsPad'
Global $GUI, $Ex, $Mn, $Mx, $Edit, $Fdir ;GUI
Global $SelAll, $Ope, $Sav, $SvA, $Nw, $Tb,$Encode, $Go, $Help ;Hotkey
Global $OldDAT = '', $MSG, $Encoding = 0, $Size = @SW_RESTORE
Global $Hel
$Hel = '----------%& THÔNG TIN SẢN PHẨM &%-----------' & @CRLF
$Hel &= 'Chương trình KyTsPad by Võ Văn Hiếu' & @CRLF
$Hel &= '▼ Các phím tắt:' & @CRLF
$Hel &= '   → Ctrl + O' & @TAB & ':Open' & @CRLF
$Hel &= '   → Ctrl + S' & @TAB & ':Save' & @CRLF
$Hel &= '   → Ctrl + Shift +S' & @TAB & ':Save As' & @CRLF
$Hel &= '   → Ctrl + N' & @TAB & ':New' & @CRLF
$Hel &= '   → Ctrl + E' & @TAB & ':Đổi Bảng Mã' & @CRLF
$Hel &= '-> Facebook: fb.com/hieuvovan143' & @CRLF
$Hel &= ' Cảm ơn đã sử dụng sản phẩm của tôi  💪☺ 💪☺ 💪☺' & @CRLF

CreateGUI()

While 1
	$MSG = GUIGetMsg()
	Switch $MSG
		Case -3, $Ex
			_Exit()
		Case -7, $Fdir
			DllCall('user32.dll', 'int', 'SendMessage', 'HWND', $GUI, 'int', 0x0112, 'int', 0xF012, 'int', 0)
			;_SendMessage($GUI, $WM_SYSCOMMAND, $SC_DRAGMOVE, 0)
			;Global Const $WM_SYSCOMMAND = 0x0112
			;Global Const $SC_DRAGMOVE = 0xF012
			;Global Const $GUI_EVENT_PRIMARYDOWN = -7
		Case $Mn
			GUISetState(6)
		Case $Mx
			If $Size = 9 Then
				GUISetState(3)
				$Size = 3
				GUICtrlSetTip($Mx, 'Thu Gọn')
				;WinMove($Tile,$OldDAT,0,0,
			Else
				GUISetState(9)
				$Size = 9
				GUICtrlSetTip($Mx, 'Phóng To')
			EndIf
			;@SW_RESTORE = 9
			;@SW_MAXIMIZE = 3
		Case $Help
			MsgBox(64, 'Thông Tin Sản Phầm', $Hel)
		Case $SelAll
			SelectAll()
		Case $Ope
			Open()
		Case $Sav
			Save()
		Case $SvA
			SaveAs()
		Case $Nw
			New()
		Case $Tb
			ControlSend($GUI,'',$Edit,'^{TAB}')
		Case $Encode
			ChangeEncode()
	EndSwitch
WEnd

Func CreateGUI()
	$GUI = GUICreate($FileName & $AppName, 700, 450, -1, -1, 0x80000000 + 0x00800000)
	GUISetBkColor(0x000000)

	GUICtrlCreateIcon(@ScriptFullPath, -1, 5, 5, 20, 20)

	$Ex = GUICtrlCreateLabel('X', 670, 0, 24, 24, 0x01 + 0x0200)
	GUICtrlSetBkColor(-1, 0xBC0000)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetFont(-1, 15, 100, 0, 'Lucida Console', 5)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetTip(-1, "Đóng")
	GUICtrlSetResizing(-1, 4 + 768)

	$Mx = GUICtrlCreateLabel('o', 642, 0, 24, 24, 0x01 + 0x0200)
	GUICtrlSetBkColor(-1, 0x156CFF)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetFont(-1, 15, 100, 0, 'Lucida Console', 5)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetTip(-1, "Phóng To")
	GUICtrlSetResizing(-1, 4 + 768)

	$Mn = GUICtrlCreateLabel('_', 614, 0, 24, 24, 0x01 + 0x0200)
	GUICtrlSetBkColor(-1, 0x156CFF)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetFont(-1, 15, 100, 0, 'Lucida Console', 5)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetTip(-1, "Thu Nhỏ")
	GUICtrlSetResizing(-1, 4 + 768)

	$Help = GUICtrlCreateLabel('?', 586, 0, 24, 24, 0x01 + 0x0200)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetFont(-1, 15, 100, 0, 'Lucida Console', 5)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetTip(-1, "Help")
	GUICtrlSetResizing(-1, 4 + 768)


	$Fdir = GUICtrlCreateLabel('KyTsPad', 35, 3, 540, 25)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetFont(-1, 15, 100, 0, 'Arial', 5)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetResizing(-1, 2 + 4 + 512)

	$Encode = GUICtrlCreateLabel('Encoding: ' & _Encoding($Encoding),490,30,200,20,0x0002)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetFont(-1, 10, 100, 0, 'Arial', 5)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetResizing(-1, 4 + 32 + 768)

	$Edit = GUICtrlCreateEdit('', 10, 50, 700 - 20, 450 - 50 - 10)
	GUICtrlSetColor(-1, 0x81FF00)
	GUICtrlSetBkColor(-1, 0x0D0D0D)
	GUICtrlSetFont(-1, 13, 100, 0, 'Arial', 5)
	GUICtrlSetState($Edit, 256)
	GUICtrlSetResizing(-1, 32)
	;GUICtrlSetResizing(-1, 32 + 64)       => cái này làm khoảng cách dưới ok :) nhưng hiện tại thì xài cái này chưa ổn lắm

	$SelAll = GUICtrlCreateDummy()
	$Ope = GUICtrlCreateDummy()
	$Sav = GUICtrlCreateDummy()
	$SvA = GUICtrlCreateDummy()
	$Nw = GUICtrlCreateDummy()
	$Tb = GUICtrlCreateDummy()
	$Go = GUICtrlCreateDummy()
	Dim $AccelTable[8][2] = [['^a', $SelAll], ['^o', $Ope], ['^s', $Sav], ['+^s', $SvA], ['^n', $Nw], ['{TAB}', $Tb], ['^e', $Encode], ['{F5}', $Go]]
	GUISetAccelerators($AccelTable)

	WinSetTrans($Tile, '', 0) ;******************

	GUISetState()

	Local $I = GetCmdLine()
	If FileExists($I) Then
		GUICtrlSetData($Fdir, $I)
		Open($I)
	EndIf

	For $I = 0 To 210 Step +15
		WinSetTrans($Tile, '', $I)
		Sleep(15)
	Next
;~ 	GUISetState()
;~ 	Local $I = GetCmdLine()
;~ 	If FileExists($I) Then
;~ 		GUICtrlSetData($Fdir, $I)
;~ 		Open($I)
;~ 	EndIf
EndFunc   ;==>CreateGUI

Func Open($File = '')
	If GUICtrlRead($Edit) <> $OldDAT Then
		If MsgBox(0x4, 'Thông Báo', 'File Chưa Được Lưu, Bạn Có Muốn Lưu?') = 6 Then Save()
	EndIf
	If $File = '' Then $File = FileOpenDialog('Chọn File Cần Mở', '', 'Text (*.txt)|All Files (*.*)', 1 + 4)
	If Not @error Then
		SetEncoding(FileGetEncoding($File))
		FileOpen($File)
		GUICtrlSetData($Edit, FileRead($File))
		FileClose($File)
		SetInfo($File)
	EndIf
EndFunc   ;==>Open

Func Save()
	Local $File
	If $FileName = 'Untitled' Then
		$File = FileSaveDialog('Chọn Nơi Lưu', '', 'Text (*.txt)|All Files (*.*)', 0, '*.txt')
		If Not @error Then
			If FileExists($File) Then
				If MsgBox(0x4, 'Thông Báo', 'Bạn Có Muốn Ghi Đè File?') == 6 Then _Save($File)
			Else
				_Save($File)
			EndIf
		EndIf
	Else
		_Save(GUICtrlRead($Fdir))
	EndIf
EndFunc   ;==>Save
Func SaveAs()
	Local $File = FileSaveDialog('Chọn Nơi Lưu', '', 'Text (*.txt)|All Files (*.*)', 0, '*.txt')
	If Not @error Then
		If FileExists($File) Then
			If MsgBox(0x4, 'Thông Báo', 'Bạn Có Muốn Ghi Đè File?') == 6 Then _Save($File)
		Else
			_Save($File)
		EndIf
	EndIf
EndFunc   ;==>SaveAs
Func _Save($File)
	FileOpen($File, 2 + $Encoding)
	FileWrite($File, GUICtrlRead($Edit))
	FileClose($File)
	SetInfo($File)
EndFunc   ;==>_Save
Func New()
	ShellExecute(@ScriptFullPath)
EndFunc   ;==>New
Func SelectAll()
	_GUICtrlEdit_SetSel($Edit, 0, -1)
EndFunc   ;==>SelectAll
Func _Exit()
	If GUICtrlRead($Edit) <> $OldDAT Then
		Local $F = MsgBox(0x3, 'Thông Báo', 'File Chưa Được Lưu, Bạn Có Muốn Lưu?')
		Switch $F
			Case 6
				Save()
				__Exit()
			Case 7
				__Exit()
		EndSwitch
	Else
		__Exit()
	EndIf
EndFunc   ;==>_Exit
Func __Exit()
	Local $I
	For $I = 200 To 50 Step -15
		WinSetTrans($Tile, '', $I)
		Sleep(15)
	Next
	Exit
EndFunc   ;==>__Exit
Func SetInfo($File = '')
	$FileName = GetNameOfDir($File)
	WinSetTitle($Tile, GUICtrlRead($Edit), $FileName & $AppName)
	$Tile = $FileName & $AppName
	GUICtrlSetData($Fdir, $File)
	$OldDAT = GUICtrlRead($Edit)
EndFunc   ;==>SetInfo
Func GetCmdLine()
	Local $Cmd
	If (StringLeft($CmdLineRaw,1)=='"') And (StringRight($CmdLineRaw,1)=='"') Then
		$Cmd = StringTrimLeft($CmdLineRaw, 1)
		$Cmd = StringTrimRight($Cmd, 1)
	Else
		$Cmd = $CmdLineRaw
	EndIf
	Return $Cmd
EndFunc   ;==>GetCmdLine
Func GetNameOfDir($File = '')
	If $File <> '' Then
		Local $I = StringLen($File), $Name = ''
		While ($I >= 1) And (StringMid($File, $I, 1) <> '\')
			$Name = StringMid($File, $I, 1) & $Name
			$I -= 1
		WEnd
		Return $Name
	EndIf
	Return ''
EndFunc   ;==>GetNameOfDir
Func _Encoding($Code)
	Switch $Code
		Case 0
			Return 'ANSI'
		Case 32
			Return 'UTF16 Little Endian'
		Case 64
			Return 'UTF16 Big Endian'
		Case 128
			Return 'UTF-8 with BOM'
		Case 256
			Return 'UTF-8 without BOM'
	EndSwitch
EndFunc		;Name Of Encoding
Func SetEncoding($Code)
	$Encoding = $Code
	GUICtrlSetData($Encode,'Encoding: ' & _Encoding($Encoding))
	Return $Code
EndFunc		;SetEncoding
Func ChangeEncode()
	Switch $Encoding
		Case 0
			Return SetEncoding(128)
		Case 32
			Return SetEncoding(64)
		Case 64
			Return SetEncoding(256)
		Case 128
			Return SetEncoding(32)
		Case 256
			Return SetEncoding(0)
	EndSwitch
EndFunc		;Change Encoding
#cs
	Func WM_NCHITTEST($HWND, $IMSG, $IWPARAM, $ILPARAM)
	If ($HWND = $GUI) AND ($IMSG = 132) Then Return 2
	EndFunc
#ce
