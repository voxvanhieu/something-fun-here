#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Vcferreira-Firefox-Os-Keyboard.ico
#AutoIt3Wrapper_Outfile=D:\AutoIT\MyCode\OnScrKeyBoard\Vitual Keyboard.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Comment=Phan Mem Ban Phim Ao Duoc Viet Boi KyTs Tech. Khong duoc su dung cho bat ky muc dich nao khac ngoai nghien cuu, hoc tap!
#AutoIt3Wrapper_Res_Description=KyTs Vitual Keyboard
#AutoIt3Wrapper_Res_Fileversion=1.5.0.0
#AutoIt3Wrapper_Res_LegalCopyright=KyTs Tech
#AutoIt3Wrapper_Res_Language=1066
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include "Var.au3"
If _Singleton($Tile, 1) = 0 Then _Exit()
CreateGUI()
ActivateLastGUI()

;------------- Vong Doi Gui
While 1
	Sleep(1000)
WEnd

;------------- Tao Gui
Func CreateGUI()
	$GUI = GUICreate($Tile, $gW, $gH, $gLeft, $gTop, 0x80000000 , 0x08040108)
	;$GUI = GUICreate($Tile, $gW, $gH, -1, @DesktopHeight - 40 - $gH, 0x14CA0000, 0x08040108) ; => Default Windows
	GUISetOnEvent(-3, "_Exit")
	GUIRegisterMsg(0x0084, "WM_NCHITTEST")

	_SetBkColor($BkColor)

	$Ex = GUICtrlCreateLabel('X', $gW - 5 - 24, 0, 24, 24, 0x01 + 0x0200)
	GUICtrlSetBkColor(-1, 0xBC0000)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetFont(-1, 15, 100, 0, 'Lucida Console', 5)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetTip(-1, "Close")
	GUICtrlSetOnEvent($Ex, '_Exit') ;~~~~~~~~

	$Mn = GUICtrlCreateLabel('_', $gW - 5 -4 - 24*2, 0, 24, 24, 0x01 + 0x0200)
	GUICtrlSetBkColor(-1, 0x156CFF)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetFont(-1, 15, 100, 0, 'Lucida Console', 5)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetTip(-1, "Minimize")
	GUICtrlSetOnEvent($Mn, '_Mini') ;~~~~~~~~

	$Help = GUICtrlCreateLabel('?', $gW - 5 -4*2 - 24*3, 0, 24, 24, 0x01 + 0x0200)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlSetFont(-1, 15, 100, 0, 'Lucida Console', 5)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetTip(-1, "Help")
	GUICtrlSetOnEvent($Help, '_Help') ;~~~~~~~~

	$KeyChar[0][2] = CreateButton(10, 10)
	$KeyChar[1][2] = CreateButton(72, 10)
	$KeyChar[2][2] = CreateButton(103, 10)
	$KeyChar[3][2] = CreateButton(134, 10)
	$KeyChar[4][2] = CreateButton(165, 10)
	$KeyChar[5][2] = CreateButton(212, 10)
	$KeyChar[6][2] = CreateButton(243, 10)
	$KeyChar[7][2] = CreateButton(274, 10)
	$KeyChar[8][2] = CreateButton(305, 10)
	$KeyChar[9][2] = CreateButton(351, 10)
	$KeyChar[10][2] = CreateButton(382, 10)
	$KeyChar[11][2] = CreateButton(413, 10)
	$KeyChar[12][2] = CreateButton(444, 10)
	$KeyChar[13][2] = CreateButton(491, 10)
	$KeyChar[14][2] = CreateButton(522, 10)
	$KeyChar[15][2] = CreateButton(553, 10)

	$KeyChar[16][2] = CreateButton(10, 50)
	$KeyChar[17][2] = CreateButton(41, 50)
	$KeyChar[18][2] = CreateButton(72, 50)
	$KeyChar[19][2] = CreateButton(103, 50)
	$KeyChar[20][2] = CreateButton(134, 50)
	$KeyChar[21][2] = CreateButton(165, 50)
	$KeyChar[22][2] = CreateButton(196, 50)
	$KeyChar[23][2] = CreateButton(227, 50)
	$KeyChar[24][2] = CreateButton(258, 50)
	$KeyChar[25][2] = CreateButton(289, 50)
	$KeyChar[26][2] = CreateButton(320, 50)
	$KeyChar[27][2] = CreateButton(351, 50)
	$KeyChar[28][2] = CreateButton(382, 50)
	$KeyChar[29][2] = CreateButton(413, 50, 2)
	$KeyChar[30][2] = CreateButton(491, 50)
	$KeyChar[31][2] = CreateButton(522, 50)
	$KeyChar[32][2] = CreateButton(553, 50)
	$KeyChar[33][2] = CreateButton(599, 50)
	$KeyChar[34][2] = CreateButton(630, 50)
	$KeyChar[35][2] = CreateButton(661, 50)
	$KeyChar[36][2] = CreateButton(692, 50)

	$KeyChar[37][2] = CreateButton(10, 81, 1.5)
	$KeyChar[38][2] = CreateButton(57, 81)
	$KeyChar[39][2] = CreateButton(88, 81)
	$KeyChar[40][2] = CreateButton(119, 81)
	$KeyChar[41][2] = CreateButton(150, 81)
	$KeyChar[42][2] = CreateButton(181, 81)
	$KeyChar[43][2] = CreateButton(212, 81)
	$KeyChar[44][2] = CreateButton(243, 81)
	$KeyChar[45][2] = CreateButton(274, 81)
	$KeyChar[46][2] = CreateButton(305, 81)
	$KeyChar[47][2] = CreateButton(336, 81)
	$KeyChar[48][2] = CreateButton(367, 81)
	$KeyChar[49][2] = CreateButton(398, 81)
	$KeyChar[50][2] = CreateButton(429, 81, 1.5, -1)
	$KeyChar[51][2] = CreateButton(491, 81)
	$KeyChar[52][2] = CreateButton(522, 81)
	$KeyChar[53][2] = CreateButton(553, 81)
	$KeyChar[54][2] = CreateButton(599, 81)
	$KeyChar[55][2] = CreateButton(630, 81)
	$KeyChar[56][2] = CreateButton(661, 81)
	$KeyChar[57][2] = CreateButton(692, 81, 1, 2)

	$KeyChar[58][2] = CreateButton(10, 112, 2)
	$KeyChar[59][2] = CreateButton(72, 112)
	$KeyChar[60][2] = CreateButton(103, 112)
	$KeyChar[61][2] = CreateButton(134, 112)
	$KeyChar[62][2] = CreateButton(165, 112)
	$KeyChar[63][2] = CreateButton(196, 112)
	$KeyChar[64][2] = CreateButton(227, 112)
	$KeyChar[65][2] = CreateButton(258, 112)
	$KeyChar[66][2] = CreateButton(289, 112)
	$KeyChar[67][2] = CreateButton(320, 112)
	$KeyChar[68][2] = CreateButton(351, 112)
	$KeyChar[69][2] = CreateButton(382, 112)
	$KeyChar[70][2] = CreateButton(413, 112, 2)
	$KeyChar[71][2] = CreateButton(599, 112)
	$KeyChar[72][2] = CreateButton(630, 112)
	$KeyChar[73][2] = CreateButton(661, 112)

	$KeyChar[74][2] = CreateButton(10, 143, 2.5)
	$KeyChar[75][2] = CreateButton(88, 143)
	$KeyChar[76][2] = CreateButton(119, 143)
	$KeyChar[77][2] = CreateButton(150, 143)
	$KeyChar[78][2] = CreateButton(181, 143)
	$KeyChar[79][2] = CreateButton(212, 143)
	$KeyChar[80][2] = CreateButton(243, 143)
	$KeyChar[81][2] = CreateButton(274, 143)
	$KeyChar[82][2] = CreateButton(305, 143)
	$KeyChar[83][2] = CreateButton(336, 143)
	$KeyChar[84][2] = CreateButton(367, 143)
	$KeyChar[85][2] = CreateButton(398, 143, 2.5, -1)
	$KeyChar[86][2] = CreateButton(522, 143)
	$KeyChar[87][2] = CreateButton(599, 143)
	$KeyChar[88][2] = CreateButton(630, 143)
	$KeyChar[89][2] = CreateButton(661, 143)
	$KeyChar[90][2] = CreateButton(692, 143, 1, 2)

	$KeyChar[91][2] = CreateButton(10, 174, 1.5)
	$KeyChar[92][2] = CreateButton(57, 174)
	$KeyChar[93][2] = CreateButton(88, 174)
	$KeyChar[94][2] = CreateButton(119, 174, 7)
	$KeyChar[95][2] = CreateButton(336, 174)
	$KeyChar[96][2] = CreateButton(367, 174)
	$KeyChar[97][2] = CreateButton(398, 174)
	$KeyChar[98][2] = CreateButton(429, 174, 1.5, -1)
	$KeyChar[99][2] = CreateButton(491, 174)
	$KeyChar[100][2] = CreateButton(522, 174)
	$KeyChar[101][2] = CreateButton(553, 174)
	$KeyChar[102][2] = CreateButton(599, 174)
	$KeyChar[103][2] = CreateButton(630, 174, 2)

	_SetAllChar(0)

	WinSetTrans($Gui, '', 0)
	GUISetState()
	_ShowGUI()
EndFunc

;------------- Thoat
Func _ShowGUI()
	Local $X, $S=@DesktopHeight - $gTop
	For $X = @DesktopHeight To $gTop Step -5
		WinMove($GUI, '', $gLeft, $X)
		WinSetTrans($GUI, '', Int($X/$S)*100)
		Sleep(1)
	Next
	WinMove($GUI, '', $gLeft, $gTop)
	WinSetTrans($Gui, '', 255)
EndFunc
Func _HideGUI()
	Local $X, $S=@DesktopHeight - $gTop
	For $X = $gTop To @DesktopHeight Step 5
		WinMove($GUI, '', $gLeft, $X)
		WinSetTrans($GUI, '', Int($X/$S)*100)
		Sleep(1)
	Next
EndFunc
Func _Mini()
	GUISetState(6)
EndFunc
Func _Exit()
	Send('{Shiftup}')
	Send('{Ctrlup}')
	Send('{AltUp}')
	Send('{RWinUp}')
	Send('{LWinUp}')
	_HideGUI()
	Exit
EndFunc
Func _Help()
	msgbox(0, $Help_Tile,$Help_)
EndFunc
