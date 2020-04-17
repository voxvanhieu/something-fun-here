#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\..\Icon_Files\1479308384_desktop.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Comment=Tool tắt màn hình nhanh - Hiếu Võ Văn | fb.com/hieuvovan143
#AutoIt3Wrapper_Res_Description=Screen Off - KyTs
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=KyTs - Hw
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****


;~ Khi bạn đọc những dòng code xinh đẹp này, hãy nhớ đến tên mình, hãy nhớ đến người đẹp trai đã tặng nó này cho bạn!
;~ Tên người đẹp trai đó là: Hiếu Võ Văn | fb.com/hieuvovan143
;~ Author:		http://kytstech.blogspot.com
;~ MoreInfo:	https://msdn.microsoft.com/en-us/library/windows/desktop/ms646360(v=vs.85).aspx

Global Const $WM_SYSCOMMAND = 0x112
Global Const $SC_MONITORPOWER = 0xF170

DllCall("user32.dll", "int", "SendMessage", "HWND", -1, "int", $WM_SYSCOMMAND, "int", $SC_MONITORPOWER, "int", 2)
