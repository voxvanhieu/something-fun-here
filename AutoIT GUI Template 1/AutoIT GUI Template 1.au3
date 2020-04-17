#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=E:\Icon\LOL Flat.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include "AutoIT GUI Template 1-Var.au3"

LoadUserInfo($TaiKhoan, $MatKhau)
CreateGUI()

Do
	If $iShowMenu Then
		$iShowMenu = False
		_GUICtrlShowMenu($hGUI, $btMenuContext, $hHover_CtrlID)
	EndIf
Until GUIGetMsg() == -3

Func LoadUserInfo($TaiKhoan = '', $MatKhau = '')
	$UserName = 'KyTs Tech'
	$UserWork = 'Admin'
	$UserAvatar = 'Images\Ahri Popstar.png'
EndFunc

Func CreateGUI()
	$hGUI = GUICreate($Tile, $gWidth, $gHeigth, -1, -1, $WS_POPUP)
	GUISetBkColor($Color_White)
	GUISetOnEvent($GUI_EVENT_CLOSE, "_EXIT")
	GUISetOnEvent($GUI_EVENT_PRIMARYDOWN, "_FormMove")
	CreateLogoAndTile()
	CreateUserInfo()
	CreateStatusBar()
	CreateTab()
	_FormShow()
EndFunc

#Region			; GUI Design
Func CreateTab()
	Local $NumberOfTab = 6
	Local $iTabHeigth = Int(450/$NumberOfTab) - 1
	Local $iTabWidth = 130
	Local $TapTop = 110
	CreateUsenessLabel(130, 110, 5, 450, $Color_Tab_Click)

	$NowTab = 0
	$btTab_CaNhan = GUICtrlCreateLabel("  📂 Cá nhân", 0, $TapTop + $iTabHeigth*$NowTab + $NowTab, $iTabWidth, $iTabHeigth, $SS_CENTERIMAGE)
	GUICtrlSetColor(-1, $Color_Tab_Text)
	GUICtrlSetBkColor(-1, $Color_Tab_Normal)
	GUICtrlSetFont(-1, 13, 600, 0, "Segoe UI Semibold")
	GUICtrlSetOnEvent(-1, "ActiveTab")
	_GUICtrl_OnHoverRegister(-1, "_Hover_Proc", "_Leave_Hover_Proc")

	$NowTab = 1
	$btTab_KhachHang = GUICtrlCreateLabel("  👨 Khách hàng", 0, $TapTop + $iTabHeigth*$NowTab + $NowTab, $iTabWidth, $iTabHeigth, $SS_CENTERIMAGE)
	GUICtrlSetColor(-1, $Color_Tab_Text)
	GUICtrlSetBkColor(-1, $Color_Tab_Normal)
	GUICtrlSetFont(-1, 13, 600, 0, "Segoe UI Semibold")
	GUICtrlSetOnEvent(-1, "ActiveTab")
	_GUICtrl_OnHoverRegister(-1, "_Hover_Proc", "_Leave_Hover_Proc")

	$NowTab = 2
	$btTab_DonHang = GUICtrlCreateLabel("  ☲ Đơn Hàng", 0, $TapTop + $iTabHeigth*$NowTab + $NowTab, $iTabWidth, $iTabHeigth, $SS_CENTERIMAGE)
	GUICtrlSetColor(-1, $Color_Tab_Text)
	GUICtrlSetBkColor(-1, $Color_Tab_Normal)
	GUICtrlSetFont(-1, 13, 600, 0, "Segoe UI Semibold")
	GUICtrlSetOnEvent(-1, "ActiveTab")
	_GUICtrl_OnHoverRegister(-1, "_Hover_Proc", "_Leave_Hover_Proc")

	$NowTab = 3
	$btTab_TuyChinh = GUICtrlCreateLabel("  ⚙ Tùy chỉnh", 0, $TapTop + $iTabHeigth*$NowTab + $NowTab, $iTabWidth, $iTabHeigth, $SS_CENTERIMAGE)
	GUICtrlSetColor(-1, $Color_Tab_Text)
	GUICtrlSetBkColor(-1, $Color_Tab_Normal)
	GUICtrlSetFont(-1, 13, 600, 0, "Segoe UI Semibold")
	GUICtrlSetOnEvent(-1, "ActiveTab")
	_GUICtrl_OnHoverRegister(-1, "_Hover_Proc", "_Leave_Hover_Proc")

	$NowTab = 4
	$btTab_TroGiup = GUICtrlCreateLabel("  ❓ Trợ giúp", 0, $TapTop + $iTabHeigth*$NowTab + $NowTab, $iTabWidth, $iTabHeigth, $SS_CENTERIMAGE)
	GUICtrlSetColor(-1, $Color_Tab_Text)
	GUICtrlSetBkColor(-1, $Color_Tab_Normal)
	GUICtrlSetFont(-1, 13, 600, 0, "Segoe UI Semibold")
	GUICtrlSetOnEvent(-1, "ActiveTab")
	_GUICtrl_OnHoverRegister(-1, "_Hover_Proc", "_Leave_Hover_Proc")

	$NowTab = 5
	$btTab_AboutUs = GUICtrlCreateLabel("  ⍰ Về chúng tôi", 0, $TapTop + $iTabHeigth*$NowTab + $NowTab, $iTabWidth, $iTabHeigth + 1, $SS_CENTERIMAGE)
	GUICtrlSetColor(-1, $Color_Tab_Text)
	GUICtrlSetBkColor(-1, $Color_Tab_Normal)
	GUICtrlSetFont(-1, 13, 600, 0, "Segoe UI Semibold")
	GUICtrlSetOnEvent(-1, "ActiveTab")
	_GUICtrl_OnHoverRegister(-1, "_Hover_Proc", "_Leave_Hover_Proc")

	$hTab = GUICtrlCreateTab(130, 90, $gWidth - 125, $gHeigth - 110)
		GUICtrlCreateTabItem("CaNhan")

			$picTab1_avatar = _GDIPlus_CreatePic($UserAvatar, 160, 140, 300, 300)
			GUICtrlSetOnEvent(-1, "ChangeAvatar")

			GUICtrlCreateLabel("Đổi ảnh đại diện", 160, 460, 300, 30, BitOR($SS_CENTER,$SS_CENTERIMAGE))
			GUICtrlSetColor(-1, $Color_White)
			GUICtrlSetBkColor(-1, $Color_MainLabel)
			GUICtrlSetCursor(-1, 0)
			GUICtrlSetFont(-1, 13, 600, 0, "Segoe UI Semibold")
			GUICtrlSetOnEvent(-1, "ChangeAvatar")

			GUICtrlCreateLabel("OK", 160, 495, 150, 30, BitOR($SS_CENTER,$SS_CENTERIMAGE))
			GUICtrlSetColor(-1, $Color_White)
			GUICtrlSetBkColor(-1, $Color_btOK_Normal)
			GUICtrlSetCursor(-1, 0)
			GUICtrlSetFont(-1, 13, 600, 0, "Segoe UI Semibold")

			GUICtrlCreateLabel("Hủy", 310,  495, 150, 30, BitOR($SS_CENTER,$SS_CENTERIMAGE))
			GUICtrlSetColor(-1, $Color_White)
			GUICtrlSetBkColor(-1, $Color_btCancel_Normal)
			GUICtrlSetCursor(-1, 0)
			GUICtrlSetFont(-1, 13, 600, 0, "Segoe UI Semibold")

			CreateUsenessLabel(500, 120, 5, 430, $Color_MainLabel)

			GUICtrlCreateLabel("Thông tin nhân viên", 530, 160, 325, 43, BitOR($SS_CENTER,$SS_CENTERIMAGE))
			GUICtrlSetFont(-1, 25, 600, 0, "Segoe UI")
			$a  = "Họ và tên" & @TAB & ":" &@TAB & $UserName & @CRLF & "Sinh ngày" & @TAB & ":" & @TAB & "26/9/1999" & @CRLF & "CMND" & @TAB & @TAB & ":" & @TAB & "123456789"
			$a &= @CRLF & "Địa chỉ" & @TAB & @TAB & ":" &@TAB & "Trái đất Việt Nam"
			GUICtrlCreateLabel($a, 570, 220, 300, 300)
			GUICtrlSetFont(-1, 10, 0, 0, "Segoe UI")

		GUICtrlCreateTabItem("KhachHang")
			GUICtrlCreateLabel("	⏩   Danh sách khách hàng:", 135, 110, $gWidth - 135, 30, $SS_CENTERIMAGE)
			GUICtrlSetColor(-1, $Color_White)
			GUICtrlSetBkColor(-1, $Color_Tab_Click)
			GUICtrlSetFont(-1, 15, 600, 0, "Segoe UI Semibold")

		GUICtrlCreateTabItem("HoaDon")
			GUICtrlCreateLabel("	⏩   Đơn hàng:", 135, 110, $gWidth - 135, 30, $SS_CENTERIMAGE)
			GUICtrlSetColor(-1, $Color_White)
			GUICtrlSetBkColor(-1, $Color_Tab_Click)
			GUICtrlSetFont(-1, 15, 600, 0, "Segoe UI Semibold")

		GUICtrlCreateTabItem("TuyChinh")
			GUICtrlCreateLabel("	⏩   Tùy chỉnh:", 135, 110, $gWidth - 135, 30, $SS_CENTERIMAGE)
			GUICtrlSetColor(-1, $Color_White)
			GUICtrlSetBkColor(-1, $Color_Tab_Click)
			GUICtrlSetFont(-1, 15, 600, 0, "Segoe UI Semibold")

		GUICtrlCreateTabItem("TroGiup")
			GUICtrlCreateLabel("	⏩   Trợ giúp:", 135, 110, $gWidth - 135, 30, $SS_CENTERIMAGE)
			GUICtrlSetColor(-1, $Color_White)
			GUICtrlSetBkColor(-1, $Color_Tab_Click)
			GUICtrlSetFont(-1, 15, 600, 0, "Segoe UI Semibold")

		GUICtrlCreateTabItem("AboutUs")
			GUICtrlCreateLabel("	⏩   Thông tin:", 135, 110, $gWidth - 135, 30, $SS_CENTERIMAGE)
			GUICtrlSetColor(-1, $Color_White)
			GUICtrlSetBkColor(-1, $Color_Tab_Click)
			GUICtrlSetFont(-1, 15, 600, 0, "Segoe UI Semibold")

			GUICtrlCreateInput($inpText, 135, 140, $gWidth - 135, $gHeigth - 180, $ES_MULTILINE)
			GUICtrlSetFont(-1, 15, 0, 0, 'Segoe UI', 5)

	$ActiveTab = $btTab_CaNhan
	GUICtrlSetBkColor($btTab_CaNhan, $Color_Tab_Click)
EndFunc

Func CreateLogoAndTile()
	CreateUsenessLabel(0, 0, $gWidth, 70, $Color_MainLabel)
	CreateUsenessLabel(0, 70, $gWidth, 40, $Color_UnderLabel)

	_GDIPlus_CreatePic('Images\Logo.png', 10, 10, 90, 90)

	GUICtrlCreateLabel($Tile, 130, 0, 450, 70, $SS_CENTERIMAGE)
	GUICtrlSetColor(-1, $Color_White)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlSetFont(-1, 25, 600, 0, "Segoe UI Semibold")
	GUICtrlSetOnEvent(-1, "_FormMove")
	GUICtrlCreateLabel($Slogant, 130, 70, 450, 40, $SS_CENTERIMAGE)
	GUICtrlSetColor(-1, $Color_White)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
	GUICtrlSetOnEvent(-1, "_FormMove")

	$btMenu = GUICtrlCreateLabel('☰⏷', $gWidth - 50, 70, 50, 40)
	GUICtrlSetColor(-1, $Color_White)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetFont(-1, 20, 600, 0, "Segoe UI Semibold")
	_GUICtrl_OnHoverRegister(-1, "_Hover_Proc", "_Leave_Hover_Proc")

	; Create Context Menu For $btMenu
	$Dummy_Label = GUICtrlCreateLabel("", -100, -100)
	$btMenuDummy = GUICtrlCreateDummy()
	$btMenuContext = GUICtrlCreateContextMenu($btMenuDummy)
	GUICtrlCreateMenuItem("Some Thing Here", $btMenuContext)
	GUICtrlCreateMenuItem("Some thing here", $btMenuContext)
	GUICtrlCreateMenuItem("", $btMenuContext)
	GUICtrlCreateMenuItem("Exit", $btMenuContext)
	GUICtrlSetOnEvent(-1, "_EXIT")
	; Create Context Menu For $btMenu

EndFunc

Func CreateUserInfo()
	$btUserInfo = GUICtrlCreateLabel('',$gWidth - 255, 5, 250, 60)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetOnEvent(-1, "_btUserInfo_Pressed")
	_GUICtrl_OnHoverRegister(-1, "_Hover_Proc", "_Leave_Hover_Proc")

	_GDIPlus_CreatePic($UserAvatar, $gWidth - 70, 5, 70, 70)
	GUICtrlCreateLabel($UserName, $gWidth - 250, 10, 170, 35, $SS_RIGHT)
	GUICtrlSetColor(-1, $Color_White)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlSetFont(-1, 15, 600, 0, "Segoe UI Semibold")
	GUICtrlCreateLabel($UserWork, $gWidth - 250, 40, 170, 25, $SS_RIGHT)
	GUICtrlSetColor(-1, $Color_White)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
EndFunc

Func CreateStatusBar()
	CreateUsenessLabel(0, $gHeigth - 40,$gWidth, 40, $Color_MainLabel)
	GUICtrlCreateLabel($Info, 20,$gHeigth - 25, 325)
	GUICtrlSetColor(-1, $Color_White)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlSetFont(-1, 9, 600, 0, "Segoe UI Semibold")
	GUICtrlSetOnEvent(-1, "_FormMove")

	$btExit = GUICtrlCreateLabel("❎ Exit", $gWidth - 75, $gHeigth - 35, 75, 30, BitOR($SS_CENTER,$SS_CENTERIMAGE))
	GUICtrlSetColor(-1, $Color_White)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetTip(-1, "Thoát")
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetOnEvent(-1, "_EXIT")
	_GUICtrl_OnHoverRegister(-1, "_Hover_Proc", "_Leave_Hover_Proc")
EndFunc

Func CreateUsenessLabel($Left, $Top, $Width, $Heigth, $Color = $Color_White)
	GUICtrlCreateLabel('', $Left, $Top, $Width, $Heigth)
	GUICtrlSetStyle(-1, $SS_LEFT)
	GUICtrlSetBkColor(-1, $Color)
EndFunc

Func _GDIPlus_CreatePic($FileName, $Left, $Top, $Width, $Heigth)
	Local $hPicCtrl, $hImage, $iHeight, $hGDIBitmap
	_GDIPlus_Startup()
	$hImage = _GDIPlus_ImageResize(_GDIPlus_ImageLoadFromFile($FileName), $Width, $Heigth)
		$iWidth = _GDIPlus_ImageGetWidth($hImage)
		$iHeight = _GDIPlus_ImageGetHeight($hImage)
		$hGDIBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)
		_GDIPlus_ImageDispose($hImage)
	$hPicCtrl = GUICtrlCreatePic('', $Left, $Top, $Width, $Heigth)
	_WinAPI_DeleteObject(GUICtrlSendMsg($hPicCtrl, 0x0172, $IMAGE_BITMAP, $hGDIBitmap)) ;$STM_SETIMAGE = 0x0172
    _WinAPI_DeleteObject($hGDIBitmap)
    _GDIPlus_Shutdown()
	Return $hPicCtrl
EndFunc			;~	Using GDIPlus to create Picture
Func _GDIPlus_SetImagePic($FileName, $iCtrlID)
	Local $hImage, $iHeight, $hGDIBitmap, $Pos = ControlGetPos($hGUI,'', $iCtrlID)
	_GDIPlus_Startup()
	$hImage = _GDIPlus_ImageResize(_GDIPlus_ImageLoadFromFile($FileName), $Pos[2], $Pos[3])
		$iWidth = _GDIPlus_ImageGetWidth($hImage)
		$iHeight = _GDIPlus_ImageGetHeight($hImage)
		$hGDIBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)
		_GDIPlus_ImageDispose($hImage)
	_WinAPI_DeleteObject(GUICtrlSendMsg($iCtrlID, 0x0172, $IMAGE_BITMAP, $hGDIBitmap)) ;$STM_SETIMAGE = 0x0172
    _WinAPI_DeleteObject($hGDIBitmap)
    _GDIPlus_Shutdown()
EndFunc
#EndRegion		; GUI Design

#Region			;Events
Func ChangeAvatar()
	Local $FileName = FileOpenDialog("Chọn file ảnh",'',"Images (*.jpg;*.bmp;*.png)|All Files (*.*)")
	If Not @error Then _GDIPlus_SetImagePic($FileName, $picTab1_avatar)

EndFunc
Func _btUserInfo_Pressed()
	ShellExecute('https://www.facebook.com/kytstech')
EndFunc

Func _FormMove()
	DllCall('user32.dll', 'int', 'SendMessage', 'HWND', $hGUI, 'int', 0x0112, 'int', 0xF012, 'int', 0)
EndFunc

Func _FormShow()
	Local $I
	WinSetTrans($hGUI,'', 0)
	GUISetState()
	For $I = 0 To 255 Step +15
		WinSetTrans($hGUI,'', $I)
		Sleep(20)
	Next
EndFunc

Func _EXIT()
	Local $I
	For $I = 255 To 0 Step -15
		WinSetTrans($hGUI,'', $I)
		Sleep(20)
	Next
	Exit
EndFunc

Func ActiveTab()
	Local $iTabID = @GUI_CtrlId - $btTab_CaNhan

	GUICtrlSetBkColor($ActiveTab, $Color_Tab_Normal)
	GUICtrlSetBkColor(@GUI_CtrlId, $Color_Tab_Click)

	GUICtrlSendMsg($hTab, $TCM_SETCURFOCUS, $iTabID, 0)
	$ActiveTab = @GUI_CtrlId
EndFunc

Func _GUICtrlShowMenu($hWnd, $nContextID, $nContextControlID, $iMouse=0)
	Local $hMenu = GUICtrlGetHandle($nContextID)
    Local $iCtrlPos = ControlGetPos($hWnd, "", $nContextControlID)

	Local $iX = $iCtrlPos[0]
	Local $iY = $iCtrlPos[1] + $iCtrlPos[3]

	; Convert the client (GUI) coordinates to screen (desktop) coordinates
	;ClientToScreen
	Local $stPoint = DllStructCreate("int;int")

    DllStructSetData($stPoint, 1, $iX)
    DllStructSetData($stPoint, 2, $iY)

    DllCall("user32.dll", "int", "ClientToScreen", "hwnd", $hWnd, "ptr", DllStructGetPtr($stPoint))

    $iX = DllStructGetData($stPoint, 1)
    $iY = DllStructGetData($stPoint, 2)
	;ClientToScreen

	If $iMouse Then
		$iX = MouseGetPos(0)
		$iY = MouseGetPos(1)
	EndIf

	DllCall("user32.dll", "int", "TrackPopupMenuEx", "hwnd", $hMenu, "int", 0, "int", $iX, "int", $iY, "hwnd", $hWnd, "ptr", 0)
EndFunc
#EndRegion

#Region			;Hover
Func _Hover_Proc($iCtrlID)
	$hHover_CtrlID = $iCtrlID
	Switch $iCtrlID
		Case $btExit
			GUICtrlSetColor($iCtrlID, 0x1A004D)
		Case $btUserInfo
			GUICtrlSetBkColor($iCtrlID, $Color_btUserInfo_Hover)
		Case $btMenu
			GUICtrlSetColor($iCtrlID, 0xFF5F00)
			$iShowMenu = True
		Case $btTab_CaNhan, $btTab_DonHang, $btTab_KhachHang, $btTab_TroGiup, $btTab_TuyChinh, $btTab_AboutUs
			If $iCtrlID <> $ActiveTab Then GUICtrlSetBkColor($iCtrlID, $Color_Tab_Hover)
	EndSwitch
EndFunc

Func _Leave_Hover_Proc($iCtrlID, $iHoverMode, $hWnd_Hovered)
	$hHover_CtrlID = $iCtrlID
	Switch $iCtrlID
		Case $btExit
			GUICtrlSetColor($iCtrlID, $Color_White)
		Case $btUserInfo
			GUICtrlSetBkColor($iCtrlID, -2)
		Case $btMenu
			GUICtrlSetColor($iCtrlID, $Color_White)
			If $hWnd_Hovered = $hGUI Then ControlClick($hGUI, "", $Dummy_Label)
		Case $btTab_CaNhan, $btTab_DonHang, $btTab_KhachHang, $btTab_TroGiup, $btTab_TuyChinh, $btTab_AboutUs
			If $iCtrlID <> $ActiveTab Then GUICtrlSetBkColor($iCtrlID, $Color_Tab_Normal)
	EndSwitch
EndFunc
#EndRegion