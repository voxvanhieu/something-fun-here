;~ #include "UDF\MetroUI.au3"
#include "UDF\GUICtrlOnHover\GUICtrlOnHover.au3"
#include <GDIPlus.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <TabConstants.au3>
#include <GUIConstantsEx.au3>

Opt("GUICloseOnESC", 0)
Opt("GUIOnEventMode", 1)

Global $Color_White = 0xFFFFFF
Global $Color_MainLabel = 0x008EFF
Global $Color_UnderLabel = 0x4D4D4D
Global $Color_btUserInfo_Hover = 0x006EFF
Global $Color_Tab_Normal = 0x676767
Global $Color_Tab_Hover = 0x3E3E3E
Global $Color_Tab_Click = 0x4283DE
Global $Color_Tab_Text = 0xFFFFFF
Global $Color_btCancel_Normal = 0xFF6700
Global $Color_btCancel_Hover = 0xFF9829
Global $Color_btOK_Normal = 0x00EA05
Global $Color_btOK_Hover = 0x31FF36

Global $iShowMenu = False
Global $hHover_CtrlID = 0

Global Const $gWidth = 900, $gHeigth = 600, $Version = '1.0.0.0'
Global Const $Tile = 'ICE Minimart Manager', $Info = 'Phần mềm quản lý tiệm nước đá' & @TAB & 'Version: ' & $Version
Global Const $Slogant = 'Nước Đá - Mát Lạnh Cho Mọi Nhà'
Global $hGUI, $btMenu, $btExit, $btUserInfo
Global $btMenuDummy, $btMenuContext, $Dummy_Label
Global $hTab, $ActiveTab, $btTab_CaNhan, $btTab_DonHang, $btTab_KhachHang, $btTab_TroGiup, $btTab_TuyChinh, $btTab_AboutUs
Global $picTab1_avatar
Global $TaiKhoan = 'admin', $MatKhau = '123'
Global $UserName, $UserWork, $UserAvatar
Global $inpText = 'Do not delete this from sourcecode|Đề nghị không xóa thông tin này' & @CRLF
$inpText &= 'Giao diện mẫu dành cho các bạn muốn luyện tập về thiết kế giao diện phần mềm với AutoIT.' & @CRLF
$inpText &= 'Bạn có thế tùy ý sử dụng mã nguồn, nhưng khi sử dụng, đề nghị thêm thông tin tác giả bên dưới :D'  & @CRLF
$inpText &= 'Thông tin tác giả:' & @CRLF
$inpText &= '   + Tác giả: KyTs Tech Blog' & @CRLF
$inpText &= '   + Website: kytstech.blogspot.com' & @CRLF
$inpText &= '   + Facebook: www.facebook.com/kytstech' & @CRLF
$inpText &= '   + Email: kytstech@gmail.com' & @CRLF
$inpText &= 'Truy cập: https://kytstech.blogspot.com/p/contact.html để biết thêm thông tin chi tiết' & @CRLF
$inpText &= 'Chân thành cảm ơn!' & @CRLF
