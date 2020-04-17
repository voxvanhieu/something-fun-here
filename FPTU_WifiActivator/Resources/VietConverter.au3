#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

Opt(‘MustDeclareVars’, 0)
Opt("TrayMenuMode",1)
_Main()
Func _Main()
$convertitem	= TrayCreateItem("Convert")
$exititem	= TrayCreateItem("Exit")
TraySetState()
While 1
$msg = TrayGetMsg()
Select
Case $msg = 0
ContinueLoop
Case $msg = $convertitem
ConvertClipboard()
Case $msg = $exititem
ExitLoop
EndSelect
WEnd
EndFunc

Func ConvertClipboard()
$s_Text=_ClipBoard_GetData ($CF_UNICODETEXT)
$s_Text=cv2urltitle($s_Text)
$s_Text=StringLower($s_Text)
_ClipBoard_SetData($s_Text)
MsgBox(0,"Thành công","Chuỗi nhận được: " & $s_Text)
EndFunc

Func cv2urltitle($text)
$uni1 = StringSplit("á,à,ạ,ả,ã,â,ấ,ầ,ậ,ẩ,ẫ,ă,ắ,ằ,ặ,ẳ",",",2)
For $i=0 to Ubound($uni1)-1
$text = StringReplace($text,$uni1[$i],"a");
Next

$uni2 = StringSplit("Á,À,Ạ,Ả,Ã,Â,Ấ,Ầ,Ậ,Ẩ,Ẫ,Ă,Ắ,Ằ,Ặ,Ẳ",",",2);
For $i=0 to Ubound($uni2)-1
$text = StringReplace($text,$uni2[$i],"A");
Next

$uni3 = StringSplit("é,è,ẹ,ẻ,ẽ,ê,ế,ề,ệ,ể,ễ",",",2);
For $i=0 to Ubound($uni3)-1
$text = StringReplace($text,$uni3[$i],"e");
Next

$uni4 = StringSplit("É,È,Ẹ,Ẻ,Ẽ,Ê,Ế,Ề,Ệ,Ể,Ễ",",",2);
For $i=0 to Ubound($uni4)-1
$text = StringReplace($text,$uni4[$i],"E");
Next

$uni5 = StringSplit("ó,ò,ọ,ỏ,õ,ô,ố,ồ,ộ,ổ,ỗ,ơ,ớ,ờ,ợ,ở",",",2);
For $i=0 to Ubound($uni5)-1
$text = StringReplace($text,$uni5[$i],"o");
Next

$uni6 = StringSplit("Ó,Ò,Ọ,Ỏ,Õ,Ô,Ố,Ồ,Ộ,Ổ,Ỗ,Ơ,Ớ,Ờ,Ợ,Ở",",",2);
For $i=0 to Ubound($uni6)-1
$text = StringReplace($text,$uni6[$i],"O");
Next

$uni7 = StringSplit("ú,ù,ụ,ủ,ũ,ư,ứ,ừ,ự,ử,ữ",",",2);
For $i=0 to Ubound($uni7)-1
$text = StringReplace($text,$uni7[$i],"u");
Next

$uni8 = StringSplit("Ú,Ù,Ụ,Ủ,Ũ,Ư,Ứ,Ừ,Ự,Ử,Ữ",",",2);
For $i=0 to Ubound($uni8)-1
$text = StringReplace($text,$uni8[$i],"U");
Next

$uni9 = StringSplit("í,ì,ị,ỉ,ĩ",",",2);
For $i=0 to Ubound($uni9)-1
$text = StringReplace($text,$uni9[$i],"i");
Next

$uni10 = StringSplit("Í,Ì,Ị,Ỉ,Ĩ",",",2);
For $i=0 to Ubound($uni10)-1
$text = StringReplace($text,$uni10[$i],"I");
Next

$text = StringReplace($text,"đ","d");
$text = StringReplace($text,"Đ","D")
$uni13 = StringSplit("ý,ỳ,ỵ,ỷ,ỹ",",",2);
For $i=0 to Ubound($uni13)-1
$text = StringReplace($text,$uni13[$i],"y");
Next

$uni14 = StringSplit("Ý,Ỳ,Ỵ,Ỷ,Ỹ",",",2);
For $i=0 to Ubound($uni14)-1
$text = StringReplace($text,$uni14[$i],"Y");
Next
Dim $aArray[26] = [".","!","~","@","#","$","%","^","&","*","(",")","-","=","+","|","\","/","?",",","’","<",">",":","’"," "]
For $i=0 to UBound($aArray)-1
$text = StringReplace($text,$aArray[$i],"-");
Next
return $text;
EndFunc