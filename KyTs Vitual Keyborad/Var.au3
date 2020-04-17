#NoTrayIcon
#Region;------------- Options
Opt("GUIOnEventMode", 1)
Opt("WinWaitDelay",0)
Opt("SendKeyDelay",0)
Opt("SendKeyDownDelay",0)
Opt("SendCapsLockMode",0)
Opt("GUICloseOnESC",0)
#EndRegion
;-------------------------------
#Region;------------- Include UDF
;#include "..\MyUDF\CtrlHotKeySet.au3"
#include "GUICtrlOnHover.au3"
#EndRegion
;-------------------------------
#Region;------------- Main GUI Value
Global Const $Tile = 'Vitural KeyBoard - KyTs'
Global $GUI, $Ex, $Mn, $Help, $nGUICtrl = 7 ; ==> Main Gui Control
Global $gW = 735, $gH = 215
Global $gLeft = Int(@DesktopWidth/2) - Int($gW/2)
Global $gTop = @DesktopHeight - WinGetPos("[CLASS:Shell_TrayWnd]")[3] - $gH
Global $KeyW = 30, $KeyH = 30, $KeyS = 1
Global $KeyL = 10, $KeyT = 20

Global $ShiftState = 0, $CtrlState = 0, $WinState = 0, $AltState = 0 ; Trang thai trong lan nhan phim tiep theo
;Global $rShiftState = 0, $rCtrlState = 0, $rWinState = 0, $rAltState = 0 ; Trang thai trong lan nhan phim tiep theo
;Global $NumLState = GetKeyState(0x90)[0], $ScrollState = GetKeyState(0x91)[0], $CapsState = GetKeyState(0x14)[0]; => Lock Keys
;$VK_NUMLOCK = 0x90
;$VK_SCROLL = 0x91
;$VK_CAPITAL = 0x14
Global $Help_Tile = '[KyTs Tech] KyTs Vitual Keyboard - Software Infomation!'
Global $Help_

$Help_  = 'KHÔNG ĐƯỢC CHỈNH SỬA NHỮNG THÔNG TIN SAU!'
$Help_ &= '>>>Contact me at: fb.com/kytstech | kytstech.blogspot.com' & @CRLF & @CRLF
$Help_ &= '[KyTs Tech] KyTs Vitual Keyboard - Software Infomation!' & @CRLF & @CRLF
$Help_ &= '======================================================' & @CRLF
$Help_ &= 'Tên sản phẩm: KyTs Vitual Keyboard' & @CRLF
$Help_ &= 'Chức năng: Sử dụng khi máy tính không có bàn phím hoặc các máy windows hỗ trợ màn hình cảm ứng' & @CRLF
$Help_ &= 'Lưu ý: Phần mềm chỉ được sử dụng cho mục đích học tập, không được dùng nào bất cứ mục đích cá nhân nào khác' & @CRLF
$Help_ &= '======================================================' & @CRLF
$Help_ &= 'Product name: KyTs Vitual Keyboard' & @CRLF
$Help_ &= 'Features: For computer without keyboard or have touch screen!' & @CRLF
$Help_ &= 'Note: For student and learning only, do not use for any personal purposes!' & @CRLF
$Help_ &= '======================================================' & @CRLF
#EndRegion
;-------------------------------
#Region;------------- Main GUI Color
;~ Global $BkColor = 'Bk.jpg'
Global $BkColor = 'Background.jpg'
;Global $BtColor = 0xFFFFFF, $BtHovColor = 0xFF0000, $BtBkColor = 0x1C1C1C, $BtBkHovColor = -2 ; => Default
Global $BtColor = 0xFFFFFF, $BtHovColor = 0x00FF00, $BtBkColor = -2, $BtBkHovColor = 0x2E2E2E
#EndRegion
;-------------------------------
#Region;------------- Key Value
Global $nKeyChar = 103, $KeyChar[$nkeyChar + 1][5]

#cs Info About 4D Array
$KeyChar[n][0] = Normal Character
$KeyChar[n][1] = Shift Character
$KeyChar[n][2] = Control ID
$KeyChar[n][3] = Send Normal
$KeyChar[n][4] = Send Shift
#ce

;---------------- Group 0;
$KeyChar[0][0] = 'ESC'
$KeyChar[0][1] = 'ESC'
$KeyChar[0][3] = '{ESC}'

$KeyChar[1][0] = 'F1'
$KeyChar[1][1] = 'F1'
$KeyChar[1][3] = '{F1}'

$KeyChar[2][0] = 'F2'
$KeyChar[2][1] = 'F2'
$KeyChar[2][3] = '{F2}'

$KeyChar[3][0] = 'F3'
$KeyChar[3][1] = 'F3'
$KeyChar[3][3] = '{F3}'

$KeyChar[4][0] = 'F4'
$KeyChar[4][1] = 'F4'
$KeyChar[4][3] = '{F4}'

$KeyChar[5][0] = 'F5'
$KeyChar[5][1] = 'F5'
$KeyChar[5][3] = '{F5}'

$KeyChar[6][0] = 'F6'
$KeyChar[6][1] = 'F6'
$KeyChar[6][3] = '{F6}'

$KeyChar[7][0] = 'F7'
$KeyChar[7][1] = 'F7'
$KeyChar[7][3] = '{F7}'

$KeyChar[8][0] = 'F8'
$KeyChar[8][1] = 'F8'
$KeyChar[8][3] = '{F8}'

$KeyChar[9][0] = 'F9'
$KeyChar[9][1] = 'F9'
$KeyChar[9][3] = '{F9}'

$KeyChar[10][0] = 'F10'
$KeyChar[10][1] = 'F10'
$KeyChar[10][3] = '{F10}'

$KeyChar[11][0] = 'F11'
$KeyChar[11][1] = 'F11'
$KeyChar[11][3] = '{F11}'

$KeyChar[12][0] = 'F12'
$KeyChar[12][1] = 'F12'
$KeyChar[12][3] = '{F12}'

$KeyChar[13][0] = 'PSc'
$KeyChar[13][1] = 'PSc'
$KeyChar[13][3] = '{PRINTSCREEN}'

$KeyChar[14][0] = 'ScL'
$KeyChar[14][1] = 'ScL'
$KeyChar[14][3] = '{SCROLLLOCK}'

$KeyChar[15][0] = 'Pse'
$KeyChar[15][1] = 'Brk'
$KeyChar[15][3] = '{PAUSE}'
$KeyChar[15][4] = '{BREAK}'
;---------------- Group 1;
$KeyChar[16][0] = '`'
$KeyChar[16][1] = '~'
$KeyChar[16][3] = '{`}'
$KeyChar[16][4] = '{~}'

$KeyChar[17][0] = '1'
$KeyChar[17][1] = '!'
$KeyChar[17][3] = '{1}'
$KeyChar[17][4] = '{!}'

$KeyChar[18][0] = '2'
$KeyChar[18][1] = '@'
$KeyChar[18][3] = '{2}'
$KeyChar[18][4] = '{@}'

$KeyChar[19][0] = '3'
$KeyChar[19][1] = '#'
$KeyChar[19][3] = '{3}'
$KeyChar[19][4] = '{#}'

$KeyChar[20][0] = '4'
$KeyChar[20][1] = '$'
$KeyChar[20][3] = '{4}'
$KeyChar[20][4] = '{$}'

$KeyChar[21][0] = '5'
$KeyChar[21][1] = '%'
$KeyChar[21][3] = '{5}'
$KeyChar[21][4] = '{%}'

$KeyChar[22][0] = '6'
$KeyChar[22][1] = '^'
$KeyChar[22][3] = '{6}'
$KeyChar[22][4] = '{^}'

$KeyChar[23][0] = '7'
$KeyChar[23][1] = '&&'
$KeyChar[23][3] = '{7}'
$KeyChar[23][4] = '{&}'

$KeyChar[24][0] = '8'
$KeyChar[24][1] = '*'
$KeyChar[24][3] = '{8}'
$KeyChar[24][4] = '{*}'

$KeyChar[25][0] = '9'
$KeyChar[25][1] = '('
$KeyChar[25][3] = '{9}'
$KeyChar[25][4] = '{(}'

$KeyChar[26][0] = '0'
$KeyChar[26][1] = ')'
$KeyChar[26][3] = '{0}'
$KeyChar[26][4] = '{)}'

$KeyChar[27][0] = '-'
$KeyChar[27][1] = '_'
$KeyChar[27][3] = '{-}'
$KeyChar[27][4] = '{_}'

$KeyChar[28][0] = '='
$KeyChar[28][1] = '+'
$KeyChar[28][3] = '{=}'
$KeyChar[28][4] = '{+}'

$KeyChar[29][0] = '<- BS'
$KeyChar[29][1] = '<- BS'
$KeyChar[29][3] = '{BS}'

$KeyChar[30][0] = 'INS'
$KeyChar[30][1] = 'INS'
$KeyChar[30][3] = '{INS}'

$KeyChar[31][0] = 'Home'
$KeyChar[31][1] = 'Home'
$KeyChar[31][3] = '{HOME}'

$KeyChar[32][0] = 'PgUp'
$KeyChar[32][1] = 'PgUp'
$KeyChar[32][3] = '{PGUP}'

$KeyChar[33][0] = 'Num'
$KeyChar[33][1] = 'Num'
$KeyChar[33][3] = '{NUMLOCK}'

$KeyChar[34][0] = '/'
$KeyChar[34][1] = '/'
$KeyChar[34][3] = '{NUMPADDIV}'

$KeyChar[35][0] = '*'
$KeyChar[35][1] = '*'
$KeyChar[35][3] = '{NUMPADMULT}'

$KeyChar[36][0] = '-'
$KeyChar[36][1] = '-'
$KeyChar[36][3] = '{NUMPADSUB}'

;---------------- Group 2;
$KeyChar[37][0] = 'Tab'
$KeyChar[37][1] = 'Tab'
$KeyChar[37][3] = '{TAB}'

$KeyChar[38][0] = 'q'
$KeyChar[38][1] = 'Q'
$KeyChar[38][3] = '{q}'
$KeyChar[38][4] = '{Q}'

$KeyChar[39][0] = 'w'
$KeyChar[39][1] = 'W'
$KeyChar[39][3] = '{w}'
$KeyChar[39][4] = '{W}'

$KeyChar[40][0] = 'e'
$KeyChar[40][1] = 'E'
$KeyChar[40][3] = '{e}'
$KeyChar[40][4] = '{E}'

$KeyChar[41][0] = 'r'
$KeyChar[41][1] = 'R'
$KeyChar[41][3] = '{r}'
$KeyChar[41][4] = '{R}'

$KeyChar[42][0] = 't'
$KeyChar[42][1] = 'T'
$KeyChar[42][3] = '{t}'
$KeyChar[42][4] = '{T}'

$KeyChar[43][0] = 'y'
$KeyChar[43][1] = 'Y'
$KeyChar[43][3] = '{y}'
$KeyChar[43][4] = '{Y}'

$KeyChar[44][0] = 'u'
$KeyChar[44][1] = 'U'
$KeyChar[44][3] = '{u}'
$KeyChar[44][4] = '{U}'

$KeyChar[45][0] = 'i'
$KeyChar[45][1] = 'I'
$KeyChar[45][3] = '{i}'
$KeyChar[45][4] = '{I}'

$KeyChar[46][0] = 'o'
$KeyChar[46][1] = 'O'
$KeyChar[46][3] = '{o}'
$KeyChar[46][4] = '{O}'

$KeyChar[47][0] = 'p'
$KeyChar[47][1] = 'P'
$KeyChar[47][3] = '{p}'
$KeyChar[47][4] = '{P}'

$KeyChar[48][0] = '['
$KeyChar[48][1] = '{'
$KeyChar[48][3] = '{[}'
$KeyChar[48][4] = '{{}'

$KeyChar[49][0] = ']'
$KeyChar[49][1] = '}'
$KeyChar[49][3] = '{]}'
$KeyChar[49][4] = '{}}'

$KeyChar[50][0] = '\'
$KeyChar[50][1] = '|'
$KeyChar[50][3] = '{\}'
$KeyChar[50][4] = '{|}'

$KeyChar[51][0] = 'Del'
$KeyChar[51][1] = 'Del'
$KeyChar[51][3] = '{DEL}'

$KeyChar[52][0] = 'End'
$KeyChar[52][1] = 'End'
$KeyChar[52][3] = '{END}'

$KeyChar[53][0] = 'PgDn'
$KeyChar[53][1] = 'PgDn'
$KeyChar[53][3] = '{PGDN}'

$KeyChar[54][0] = '7'
$KeyChar[54][1] = 'Home'
$KeyChar[54][3] = '{NUMPAD7}'
$KeyChar[54][4] = '{HOME}'

$KeyChar[55][0] = '8'
$KeyChar[55][1] = 'Up'
$KeyChar[55][3] = '{NUMPAD8}'
$KeyChar[55][4] = '{UP}'

$KeyChar[56][0] = '9'
$KeyChar[56][1] = 'PgUp'
$KeyChar[56][3] = '{NUMPAD9}'
$KeyChar[56][4] = '{PGUP}'

$KeyChar[57][0] = '+'
$KeyChar[57][1] = '+'
$KeyChar[57][3] = '{NUMPADADD}'

;---------------- Group 3;
$KeyChar[58][0] = 'CapsLock'
$KeyChar[58][1] = 'CapsLock'
$KeyChar[58][3] = '{CAPSLOCK}'

$KeyChar[59][0] = 'a'
$KeyChar[59][1] = 'A'
$KeyChar[59][3] = '{a}'
$KeyChar[59][4] = '{A}'

$KeyChar[60][0] = 's'
$KeyChar[60][1] = 'S'
$KeyChar[60][3] = '{s}'
$KeyChar[60][4] = '{S}'

$KeyChar[61][0] = 'd'
$KeyChar[61][1] = 'D'
$KeyChar[61][3] = '{d}'
$KeyChar[61][4] = '{D}'

$KeyChar[62][0] = 'f'
$KeyChar[62][1] = 'F'
$KeyChar[62][3] = '{f}'
$KeyChar[62][4] = '{F}'

$KeyChar[63][0] = 'g'
$KeyChar[63][1] = 'G'
$KeyChar[63][3] = '{g}'
$KeyChar[63][4] = '{G}'

$KeyChar[64][0] = 'h'
$KeyChar[64][1] = 'H'
$KeyChar[64][3] = '{h}'
$KeyChar[64][4] = '{H}'

$KeyChar[65][0] = 'j'
$KeyChar[65][1] = 'J'
$KeyChar[65][3] = '{j}'
$KeyChar[65][4] = '{J}'

$KeyChar[66][0] = 'k'
$KeyChar[66][1] = 'K'
$KeyChar[66][3] = '{k}'
$KeyChar[66][4] = '{K}'

$KeyChar[67][0] = 'l'
$KeyChar[67][1] = 'L'
$KeyChar[67][3] = '{l}'
$KeyChar[67][4] = '{L}'

$KeyChar[68][0] = ';'
$KeyChar[68][1] = ':'
$KeyChar[68][3] = '{;}'
$KeyChar[68][4] = '{:}'

$KeyChar[69][0] = "'"
$KeyChar[69][1] = '"'
$KeyChar[69][3] = "{'}"
$KeyChar[69][4] = '{"}'

$KeyChar[70][0] = 'Enter'
$KeyChar[70][1] = 'Enter'
$KeyChar[70][3] = '{Enter}'

$KeyChar[71][0] = '4'
$KeyChar[71][1] = 'Left'
$KeyChar[71][3] = '{NUMPAD4}'
$KeyChar[71][4] = '{LEFT}'

$KeyChar[72][0] = '5'
$KeyChar[72][1] = '5'
$KeyChar[72][3] = '{NUMPAD5}'

$KeyChar[73][0] = '6'
$KeyChar[73][1] = 'Right'
$KeyChar[73][3] = '{NUMPAD6}'
$KeyChar[73][4] = '{RIGHT}'

;---------------- Group 4;
$KeyChar[74][0] = 'Shift'
$KeyChar[74][1] = 'Shift'
$KeyChar[74][3] = '{LShift}'

$KeyChar[75][0] = 'z'
$KeyChar[75][1] = 'Z'
$KeyChar[75][3] = '{z}'
$KeyChar[75][4] = '{Z}'

$KeyChar[76][0] = 'x'
$KeyChar[76][1] = 'X'
$KeyChar[76][3] = '{x}'
$KeyChar[76][4] = '{X}'

$KeyChar[77][0] = 'c'
$KeyChar[77][1] = 'C'
$KeyChar[77][3] = '{c}'
$KeyChar[77][4] = '{C}'

$KeyChar[78][0] = 'v'
$KeyChar[78][1] = 'V'
$KeyChar[78][3] = '{v}'
$KeyChar[78][4] = '{V}'

$KeyChar[79][0] = 'b'
$KeyChar[79][1] = 'B'
$KeyChar[79][3] = '{b}'
$KeyChar[79][4] = '{B}'

$KeyChar[80][0] = 'n'
$KeyChar[80][1] = 'N'
$KeyChar[80][3] = '{n}'
$KeyChar[80][4] = '{N}'

$KeyChar[81][0] = 'm'
$KeyChar[81][1] = 'M'
$KeyChar[81][3] = '{m}'
$KeyChar[81][4] = '{M}'

$KeyChar[82][0] = ','
$KeyChar[82][1] = '<'
$KeyChar[82][3] = '{,}'
$KeyChar[82][4] = '{<}'

$KeyChar[83][0] = '.'
$KeyChar[83][1] = '>'
$KeyChar[83][3] = '{.}'
$KeyChar[83][4] = '{>}'

$KeyChar[84][0] = '/'
$KeyChar[84][1] = '?'
$KeyChar[84][3] = '{/}'
$KeyChar[84][4] = '{?}'

$KeyChar[85][0] = 'Shift'
$KeyChar[85][1] = 'Shift'
$KeyChar[85][3] = '{RSHIFT}'

$KeyChar[86][0] = '^'
$KeyChar[86][1] = '^'
$KeyChar[86][3] = '{UP}'

$KeyChar[87][0] = '1'
$KeyChar[87][1] = 'End'
$KeyChar[87][3] = '{NUMPAD1}'
$KeyChar[87][4] = '{End}'

$KeyChar[88][0] = '2'
$KeyChar[88][1] = 'Down'
$KeyChar[88][3] = '{NUMPAD2}'
$KeyChar[88][4] = '{DOWN}'

$KeyChar[89][0] = '3'
$KeyChar[89][1] = 'PgDn'
$KeyChar[89][3] = '{NUMPAD3}'
$KeyChar[89][4] = '{PGDN}'

$KeyChar[90][0]	= 'Enter'
$KeyChar[90][1]	= 'Enter'
$KeyChar[90][3]	= '{NUMPADENTER}'

;---------------- Group 5;
$KeyChar[91][0] = 'Ctrl'
$KeyChar[91][1] = 'Ctrl'
$KeyChar[91][3] = '{LCTRL}'

$KeyChar[92][0] = 'Win'
$KeyChar[92][1] = 'Win'
$KeyChar[92][3] = '{LWIN}'

$KeyChar[93][0] = 'Alt'
$KeyChar[93][1] = 'Alt'
$KeyChar[93][3] = '{LALT}'

$KeyChar[94][0] = 'Space'
$KeyChar[94][1] = 'Space'
$KeyChar[94][3] = '{SPACE}'

$KeyChar[95][0] = 'Alt'
$KeyChar[95][1] = 'Alt'
$KeyChar[95][3] = '{RALT}'

$KeyChar[96][0] = 'Win'
$KeyChar[96][1] = 'Win'
$KeyChar[96][3] = '{RWIN}'

$KeyChar[97][0] = 'App'
$KeyChar[97][1] = 'App'
$KeyChar[97][3] = '{APPSKEY}'

$KeyChar[98][0] = 'Ctrl'
$KeyChar[98][1] = 'Ctrl'
$KeyChar[98][3] = '{RCTRL}'

$KeyChar[99][0] = '<'
$KeyChar[99][1] = '<'
$KeyChar[99][3] = '{LEFT}'

$KeyChar[100][0] = 'v'
$KeyChar[100][1] = 'v'
$KeyChar[100][3] = '{DOWN}'

$KeyChar[101][0] = '>'
$KeyChar[101][1] = '>'
$KeyChar[101][3] = '{RIGHT}'

$KeyChar[102][0] = '0'
$KeyChar[102][1] = 'Ins'
$KeyChar[102][3] = '{NUMPAD0}'
$KeyChar[102][4] = '{INS}'

$KeyChar[103][0] = '.'
$KeyChar[103][1] = 'Del'
$KeyChar[103][3] = '{NUMPADDOT}'
$KeyChar[103][4] = '{DEL}'
#EndRegion
;-------------------------------
#Region;------------- Support GUI
Func CreateButton($iLeft, $iTop, $iW = 1, $iH = 1)
	Local $iCtrlID
	If $iH == -1 Then
		$iCtrlID = GUICtrlCreateLabel('', $iLeft, $iTop, Calc($iW) -1 , Calc(1), 0x01 + 0x0200, 0x00020000)
	Else
		$iCtrlID = GUICtrlCreateLabel('', $iLeft, $iTop, Calc($iW), Calc($iH), 0x01 + 0x0200, 0x00020000)
	EndIf
	GUICtrlSetColor(-1, $BtColor)
	GUICtrlSetBkColor(-1, $BtBkColor)
	GUICtrlSetFont(-1, 10, 900, 0,'Segoe UI Light',5)
	GUICtrlSetOnEvent($iCtrlID, '_Send') ;~~~~~~~~
	_GUICtrl_OnHoverRegister(-1, "_Hover_Func", "_Hover_Func");, "PrimaryDown_Proc")
	Return $iCtrlID
EndFunc

Func ActivateLastGUI()
	WinWaitActive($Tile)
	Local $iLastGUI = WinList(), $I = 0
	While $I <= $iLastGUI[0][0]
		$I += 1
		If ($iLastGUI[$I][0] <> "") And ($iLastGUI[$I][0] <> $Tile) And (BitAND(WinGetState($iLastGUI[$I][1]), 2)) Then
			WinActivate($iLastGUI[$I][0])
			ExitLoop
		EndIf
	WEnd
EndFunc

Func _SetBkColor($BkColor)
	If $BkColor = '' Then
		GUISetBkColor(0xFFFFFF)
	ElseIf FileExists($BkColor) Then
		GUICtrlCreatePic($BkColor, 0, 0, $gW, $gH, 128)
	Else
		GUISetBkColor($BtBkHovColor)
	EndIf
EndFunc
Func _SetAllChar($CaseID)
	Local $I
	For $I=0 To $nkeyChar
		_SetChar($I, $CaseID)
	Next
EndFunc
Func _SetChar($iCharID, $CaseID = 0)
	GUICtrlSetData($KeyChar[$iCharID][2], $KeyChar[$iCharID][$CaseID])
	;CtrlHotKeySet($KeyChar[$CharID][2], '{' & $KeyChar[$CharID][0] & '}')
EndFunc

Func WM_NCHITTEST($HWND, $iMsg, $iwParam, $Ilparam)
	;If ($HWND = $GUI) AND ($iMsg = 0x0084) Then
	Return 2
EndFunc
#EndRegion
;-------------------------------
#Region;------------- Support Hover
Func _Hover_Func($iCtrlID, $iParam)
;~ 	S: 74 85
;~ 	C: 91 98
;~ 	W: 92 96
;~ 	A: 93 95
	If $iParam == 2 Then
		GUICtrlSetColor($iCtrlID, $BtColor)
		GUICtrlSetBkColor($iCtrlID, $BtBkColor)
	Else
		GUICtrlSetColor($iCtrlID, $BtHovColor)
		GUICtrlSetBkColor($iCtrlID, $BtBkHovColor)
	EndIf
EndFunc

;~ Func PrimaryDown_Proc($iCtrlID)
;~ 	msgbox(0,'th�ng b�o','PrimaryDown_Proc')
;~ 	_Send($iCtrlID)
;~ EndFunc
#EndRegion
;-------------------------------
#Region;------------- Caculate/Activitive
Func Calc($I)
	Return Round(($KeyW+$KeyS) * $I) -$KeyS
EndFunc

Func _Send()
	Local $iCharID = @GUI_CtrlId - $nGUICtrl
	Switch $iCharID
		Case 13
			GUISetState(@SW_DISABLE)
			GUISetState(@SW_HIDE)
			Send($KeyChar[$iCharID][3])
			GUISetState(@SW_Enable)
			GUISetState(@SW_SHOW)
		Case 74, 85
			Switch $ShiftState
				Case 0
					$ShiftState = 1
					GUICtrlSetColor($KeyChar[74][2], $BtHovColor)
					GUICtrlSetBkColor($KeyChar[74][2], $BtBkHovColor)
					GUICtrlSetColor($KeyChar[85][2], $BtHovColor)
					GUICtrlSetBkColor($KeyChar[85][2], $BtBkHovColor)
					_SetAllChar(1)
					Send('{SHIFTDOWN}')
				Case 1
					$ShiftState = 0
					GUICtrlSetColor($KeyChar[74][2], $BtColor)
					GUICtrlSetBkColor($KeyChar[74][2], $BtBkColor)
					GUICtrlSetColor($KeyChar[85][2], $BtColor)
					GUICtrlSetBkColor($KeyChar[85][2], $BtBkColor)
					_SetAllChar(0)
					Send('{SHIFTUP}')
			EndSwitch
		Case 93, 95
			Switch $AltState
				Case 0
					$AltState = 1
					GUICtrlSetColor($KeyChar[93][2], $BtHovColor)
					GUICtrlSetBkColor($KeyChar[93][2], $BtBkHovColor)
					GUICtrlSetColor($KeyChar[95][2], $BtHovColor)
					GUICtrlSetBkColor($KeyChar[95][2], $BtBkHovColor)
					Send('{ALTDOWN}')
				Case 1
					$AltState = 0
					GUICtrlSetColor($KeyChar[93][2], $BtColor)
					GUICtrlSetBkColor($KeyChar[93][2], $BtBkColor)
					GUICtrlSetColor($KeyChar[95][2], $BtColor)
					GUICtrlSetBkColor($KeyChar[95][2], $BtBkColor)
					Send('{ALTUP}')
			EndSwitch
		Case 91, 98
			Switch $CtrlState
				Case 0
					$CtrlState = 1
					GUICtrlSetColor($KeyChar[91][2], $BtHovColor)
					GUICtrlSetBkColor($KeyChar[91][2], $BtBkHovColor)
					GUICtrlSetColor($KeyChar[98][2], $BtHovColor)
					GUICtrlSetBkColor($KeyChar[98][2], $BtBkHovColor)
					Send('{CTRLDOWN}')
				Case 1
					$CtrlState = 0
					GUICtrlSetColor($KeyChar[91][2], $BtColor)
					GUICtrlSetBkColor($KeyChar[91][2], $BtBkColor)
					GUICtrlSetColor($KeyChar[98][2], $BtColor)
					GUICtrlSetBkColor($KeyChar[98][2], $BtBkColor)
					Send('{CTRLUP}')
			EndSwitch
		Case 92, 96
			Switch $WinState
				Case 0
					$WinState = 1
					GUICtrlSetColor($KeyChar[92][2], $BtHovColor)
					GUICtrlSetBkColor($KeyChar[92][2], $BtBkHovColor)
					GUICtrlSetColor($KeyChar[96][2], $BtHovColor)
					GUICtrlSetBkColor($KeyChar[96][2], $BtBkHovColor)
					Send('{LWINDOWN}')
				Case 1
					$WinState = 0
					GUICtrlSetColor($KeyChar[92][2], $BtColor)
					GUICtrlSetBkColor($KeyChar[92][2], $BtBkColor)
					GUICtrlSetColor($KeyChar[96][2], $BtColor)
					GUICtrlSetBkColor($KeyChar[96][2], $BtBkColor)
					Send('{LWINUP}')
			EndSwitch
		Case Else
			If ($ShiftState == 1) And ($KeyChar[$iCharID][0]<>$KeyChar[$iCharID][1]) Then
				Send($KeyChar[$iCharID][4])
				;_UpAll()
			Else
				Send($KeyChar[$iCharID][3])
				;_UpAll()
			EndIf
	EndSwitch
EndFunc
Func _UpAll()
	Send('{RWINUP}')
	Send('{RALT UP}')
	Send('{RCTRL UP}')
	Send('{RSHIFT UP}')

	GUICtrlSetColor($KeyChar[96][2], $BtColor)
	GUICtrlSetBkColor($KeyChar[96][2], $BtBkColor)

	GUICtrlSetColor($KeyChar[95][2], $BtColor)
	GUICtrlSetBkColor($KeyChar[95][2], $BtBkColor)

	GUICtrlSetColor($KeyChar[98][2], $BtColor)
	GUICtrlSetBkColor($KeyChar[98][2], $BtBkColor)

	GUICtrlSetColor($KeyChar[85][2], $BtColor)
	GUICtrlSetBkColor($KeyChar[85][2], $BtBkColor)
EndFunc
#EndRegion
;-------------------------------
#Region;------------- Key Function
Func GetKeyState($VK_KEY)
	Return DllCall("user32.dll","long","GetKeyState","long",$VK_KEY)
EndFunc
#EndRegion
;-------------------------------
Global Const $tagSECURITY_ATTRIBUTES = "dword Length;ptr Descriptor;bool InheritHandle"
Func _Singleton($sOccurenceName, $iFlag = 0)
	Local Const $ERROR_ALREADY_EXISTS = 183
	Local Const $SECURITY_DESCRIPTOR_REVISION = 1
	Local $tSecurityAttributes = 0

	If BitAND($iFlag, 2) Then
		; The size of SECURITY_DESCRIPTOR is 20 bytes.  We just
		; need a block of memory the right size, we aren't going to
		; access any members directly so it's not important what
		; the members are, just that the total size is correct.
		Local $tSecurityDescriptor = DllStructCreate("byte;byte;word;ptr[4]")
		; Initialize the security descriptor.
		Local $aRet = DllCall("advapi32.dll", "bool", "InitializeSecurityDescriptor", _
				"struct*", $tSecurityDescriptor, "dword", $SECURITY_DESCRIPTOR_REVISION)
		If @error Then Return SetError(@error, @extended, 0)
		If $aRet[0] Then
			; Add the NULL DACL specifying access to everybody.
			$aRet = DllCall("advapi32.dll", "bool", "SetSecurityDescriptorDacl", _
					"struct*", $tSecurityDescriptor, "bool", 1, "ptr", 0, "bool", 0)
			If @error Then Return SetError(@error, @extended, 0)
			If $aRet[0] Then
				; Create a SECURITY_ATTRIBUTES structure.
				$tSecurityAttributes = DllStructCreate($tagSECURITY_ATTRIBUTES)
				; Assign the members.
				DllStructSetData($tSecurityAttributes, 1, DllStructGetSize($tSecurityAttributes))
				DllStructSetData($tSecurityAttributes, 2, DllStructGetPtr($tSecurityDescriptor))
				DllStructSetData($tSecurityAttributes, 3, 0)
			EndIf
		EndIf
	EndIf

	Local $aHandle = DllCall("kernel32.dll", "handle", "CreateMutexW", "struct*", $tSecurityAttributes, "bool", 1, "wstr", $sOccurenceName)
	If @error Then Return SetError(@error, @extended, 0)
	Local $aLastError = DllCall("kernel32.dll", "dword", "GetLastError")
	If @error Then Return SetError(@error, @extended, 0)
	If $aLastError[0] = $ERROR_ALREADY_EXISTS Then
		If BitAND($iFlag, 1) Then
			DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $aHandle[0])
			If @error Then Return SetError(@error, @extended, 0)
			Return SetError($aLastError[0], $aLastError[0], 0)
		Else
			Exit -1
		EndIf
	EndIf
	Return $aHandle[0]
EndFunc   ;==>_Singleton
;-------------------------------