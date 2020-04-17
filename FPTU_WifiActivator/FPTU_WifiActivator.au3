#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Compile_Both=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;Opt("TrayIconHide", 1)
Opt("GUICloseOnESC", 1)
Opt("GUIOnEventMode", 1)

#include <GUIConstants.au3>
#include <WindowsConstants.au3>
#include <GDIPlus.au3>

Global $_Activated = False

Global $ConfigFile
Switch (@OSVersion)
    Case "WIN_10", "WIN_81"     ; 6.3
        $ConfigFile = @TempDir & "\VER_6.3.xml"
        FileInstall("Resources\VER_6.3.xml", $ConfigFile, 1)
    Case "WIN_8"                ; 6.2
        $ConfigFile = @TempDir & "\VER_6.2.xml"
        FileInstall("Resources\VER_6.2.xml", $ConfigFile, 1)
    Case "WIN_7"                ; 6.1
        $ConfigFile = @TempDir & "\VER_6.1.xml"
        FileInstall("Resources\VER_6.1.xml", $ConfigFile, 1)
    Case Else
        $ConfigFile = False
EndSwitch

If Not $ConfigFile Then
    MsgBox(16, 'Phần mềm không hỗ trợ!', 'Phần mềm này chỉ hỗ trợ từ Windows 7 trở lên.')
    Exit
EndIf

_GDIPlus_Startup()
Global $Tile = "FPTU_WifiActivator"
Global $gWidth = 300, $gHeigth = 420
Global $hGUI = GUICreate($Tile, $gWidth, $gHeigth, -1, -1, BitOR($WS_POPUP, $WS_BORDER))
GUISetBkColor(0xE87C3B)
GUISetIcon(@ScriptFullPath)
GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")

_GDIPlus_CreatePic('Resources\Logo.png', 0, 0, $gWidth, 65)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlSetStyle(-1, -1, $GUI_WS_EX_PARENTDRAG)

GUICtrlCreateLabel("   FPTU Wifi Activator", 0, 65, $gWidth, 35, BitOR($SS_CENTERIMAGE, $SS_CENTER))
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0xD64D12)
GUICtrlSetFont(-1, 16, 600, 0, "Segoe UI", 5)

_GDIPlus_CreatePic("Resources\UserIcon.png", 25, 125, 25, 25)
$inpName = GUICtrlCreateInput("", 55, 125, 225, 25, BitOR($ES_CENTER, $ES_WANTRETURN, $ES_AUTOHSCROLL), $WS_EX_TOOLWINDOW)
GUICtrlSetBkColor(-1, 0xE87C3B)
GUICtrlSendMsg(-1, $EM_SETCUEBANNER, False, "Họ và Tên")
GUICtrlSetFont(-1, 13, 0, 0, "Segoe UI", 5)
GUICtrlCreateLabel("", 25, 155, 250, 3)
GUICtrlSetBkColor(-1, 0x000000)

_GDIPlus_CreatePic("Resources\StdNum.png", 25, 170, 25, 25)
$inpMSSV = GUICtrlCreateInput("", 55, 170, 225, 25, BitOR($ES_CENTER, $ES_WANTRETURN, $ES_AUTOHSCROLL, $ES_UPPERCASE), $WS_EX_TOOLWINDOW)
GUICtrlSetBkColor(-1, 0xE87C3B)
GUICtrlSendMsg(-1, $EM_SETCUEBANNER, False, "Mã số SV")
GUICtrlSetFont(-1, 13, 0, 0, "Segoe UI", 5)
GUICtrlCreateLabel("", 25, 200, 250, 3)
GUICtrlSetBkColor(-1, 0x000000)

_GDIPlus_CreatePic("Resources\UserNameIcon.png", 25, 215, 25, 25)
GUICtrlSetFont(-1, 12, 0, 0, "Segoe UI", 5)
$inpUsername = GUICtrlCreateInput("Tài khoản SV", 55, 215, 225, 25, BitOR($ES_CENTER, $ES_READONLY), $WS_EX_TOOLWINDOW)
GUICtrlSetBkColor(-1, 0xE87C3B)
GUICtrlSetTip(-1, "Student Account")
GUICtrlSetFont(-1, 12, 0, 0, "Segoe UI", 5)
GUICtrlCreateLabel("", 25, 245, 250, 3)
GUICtrlSetBkColor(-1, 0x000000)

_GDIPlus_CreatePic("Resources\MACIcon.png", 25, 260, 25, 25)
GUICtrlSetFont(-1, 12, 0, 0, "Segoe UI", 5)
$inpMACaddress = GUICtrlCreateInput("A0-D3-7A-37-AE-E2", 55, 260, 225, 25, BitOR($ES_CENTER, $ES_UPPERCASE, $ES_READONLY), $WS_EX_TOOLWINDOW)
GUICtrlSetBkColor(-1, 0xE87C3B)
GUICtrlSetTip(-1, "MAC Address")
GUICtrlSetFont(-1, 12, 0, 0, "Segoe UI", 5)
GUICtrlCreateLabel("", 25, 290, 250, 3)
GUICtrlSetBkColor(-1, 0x000000)

$btnActivate = GUICtrlCreateLabel("Activate Now", 90, 310, 120, 35, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x007CFF)
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 12, 0, 0, "Segoe UI", 5)
GUICtrlSetOnEvent(-1, "_StartActivate")

GUICtrlCreateLabel("Exit", 110, 350, 80, 30, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0xCB1515)
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 12, 0, 0, "Segoe UI", 5)
GUICtrlSetOnEvent(-1, "_Exit")

$StatusBar = GUICtrlCreateLabel("", 0, $gHeigth-25, $gWidth, 25, $SS_CENTERIMAGE)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x0078D7)
GUICtrlSetFont(-1, 10, 0, 0, "Segoe UI", 5)

WinSetTrans($hGUI, "", 0)
GUISetState(@SW_SHOW)
_ShowForm()
AdlibRegister("_VerifyInfo")

While 1
    Sleep(100)
WEnd

Func _Exit()
    _HideForm()
    _GDIPlus_Shutdown()
    Exit
EndFunc
Func _ShowForm()
	Local $I
	For $I = 0 To 255 Step +15
		WinSetTrans($hGUI,'', $I)
		Sleep(10)
	Next
EndFunc
Func _HideForm()
	Local $I
	For $I = 255 To 0 Step -15
		WinSetTrans($hGUI,'', $I)
		Sleep(10)
	Next
EndFunc

Func _GDIPlus_CreatePic($FileName, $Left, $Top, $Width, $Heigth)
	Local $hPicCtrl, $hImage, $iHeight, $hGDIBitmap
	$hImage = _GDIPlus_ImageResize(_GDIPlus_ImageLoadFromFile($FileName), $Width, $Heigth)
		$iWidth = _GDIPlus_ImageGetWidth($hImage)
		$iHeight = _GDIPlus_ImageGetHeight($hImage)
		$hGDIBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)
		_GDIPlus_ImageDispose($hImage)
	$hPicCtrl = GUICtrlCreateLabel('', $Left, $Top, $Width, $Heigth, $SS_BITMAP)
	_WinAPI_DeleteObject(GUICtrlSendMsg($hPicCtrl, 0x0172, $IMAGE_BITMAP, $hGDIBitmap)) ;$STM_SETIMAGE = 0x0172
    _WinAPI_DeleteObject($hGDIBitmap)
	Return $hPicCtrl
EndFunc

Func _StartActivate()
    Switch GUICtrlRead($btnActivate)
        Case "Activate Now"
            If Not $_Activated Then
                $_Activated = True
                GUICtrlSetBkColor($StatusBar, 0xDEA700)
                GUICtrlSetData($StatusBar, " Activating, please wait...")
                If @Compiled Then
                    Local $Command = "netsh wlan add profile " & $ConfigFile
                    ProcessWaitClose(Run(@ComSpec & " /c " & $Command, "", @SW_HIDE))
                    FileDelete($ConfigFile)
                EndIf
                GUICtrlSetBkColor($StatusBar, 0x0078D7)
                GUICtrlSetData($StatusBar, " Activate done! Mail ... file in desktop to Mr. Vinh!")
                GUICtrlSetBkColor($btnActivate, 0xDEA700)
                GUICtrlSetData($btnActivate, "Restart Now")
            EndIf
        Case "Restart Now"
            If @Compiled Then Shutdown(6)
    EndSwitch 
EndFunc

Func _Get_WifiMACAddress()
    Local $TmpMACInf = @TempDir & "\netinfo.info"
    Local $Command = "ipconfig /all"
    ProcessWaitClose(Run(@ComSpec & " /c " & $Command & " > " & $TmpMACInf, "", @SW_HIDE))
    Local $NetInfoData = FileRead($TmpMACInf)
    FileDelete($TmpMACInf)
EndFunc

Func _VerifyInfo()
    If (GUICtrlRead($inpName) <> "") And (StringLen(GUICtrlRead($inpMSSV)) == 8) Then
        Local $StdID, $I, $arrName = StringSplit(GUICtrlRead($inpName), " ")
        $StdID =  $arrName[$arrName[0]]
        For $I = 1 To $arrName[0]-1
            $StdID &= StringLeft($arrName[$I], 1)
        Next
        $StdID &= GUICtrlRead($inpMSSV)
        GUICtrlSetData($inpUsername, $StdID)
    Else
        GUICtrlSetData($inpUsername, "Tài khoản SV")
    EndIf
EndFunc