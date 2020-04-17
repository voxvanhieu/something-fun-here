#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         JK. KyTs
 Website:		 kytstech.blogspot.com

 Script Function:
	_vn_Init()						->		Initialization variables
	_vn_RemoveAccents($_String)		->		Remove Vietnamese accents

#ce ----------------------------------------------------------------------------

;~ Auto call _vn_Initialize function to set some variables
_vn_Initialize()

; #FUNCTION# ====================================================================================================================
; Name ..........: _vn_Initialize
; Description ...: Initialization variables
; Syntax ........: _vn_Initialize()
; Parameters ....: 
; Return values .: 
; ===============================================================================================================================
Func _vn_Initialize()
	Global $_vn_utf8[14][2] = [	_
		["0x5BC3A1C3A0E1BAA1E1BAA3C3A3C3A2E1BAA5E1BAA7E1BAADE1BAA9E1BAABC483E1BAAFE1BAB1E1BAB7E1BAB35D","0x61"], _
		["0x5BC381C380E1BAA0E1BAA2C383C382E1BAA4E1BAA6E1BAACE1BAA8E1BAAAC482E1BAAEE1BAB0E1BAB6E1BAB25D","0x41"], _
		["0x5BC3A9C3A8E1BAB9E1BABBE1BABDC3AAE1BABFE1BB81E1BB87E1BB83E1BB855D","0x65"], _
		["0x5BC389C388E1BAB8E1BABAE1BABCC38AE1BABEE1BB80E1BB86E1BB82E1BB845D","0x45"], _
		["0x5BC3B3C3B2E1BB8DE1BB8FC3B5C3B4E1BB91E1BB93E1BB99E1BB95E1BB97C6A1E1BB9BE1BB9DE1BBA3E1BB9F5D","0x6F"], _
		["0x5BC393C392E1BB8CE1BB8EC395C394E1BB90E1BB92E1BB98E1BB94E1BB96C6A0E1BB9AE1BB9CE1BBA2E1BB9E5D","0x4F"], _
		["0x5BC3BAC3B9E1BBA5E1BBA7C5A9C6B0E1BBA9E1BBABE1BBB1E1BBADE1BBAF5D","0x75"], _
		["0x5BC39AC399E1BBA4E1BBA6C5A8C6AFE1BBA8E1BBAAE1BBB0E1BBACE1BBAE5D","0x55"], _
		["0x5BC3ADC3ACE1BB8BE1BB89C4A95D","0x69"], _
		["0x5BC38DC38CE1BB8AE1BB88C4A85D","0x49"], _
		["0x5BC3BDE1BBB3E1BBB5E1BBB7E1BBB95D","0x79"], _
		["0x5BC39DE1BBB2E1BBB4E1BBB6E1BBB85D","0x59"], _
		["0x5BC4915D","0x64"], _
		["0x5BC4905D","0x44"]]
	Local $I
	For $I = 0 To 13
		$_vn_utf8[$I][0] = BinaryToString($_vn_utf8[$I][0], 4)
		$_vn_utf8[$I][1] = BinaryToString($_vn_utf8[$I][1], 4)
	Next
EndFunc

; #FUNCTION# ====================================================================================================================
; Name ..........: _vn_RemoveAccents
; Description ...: Remove Vietnamese accents from string.
;                  "áàạảãâấầậẩẫăắằặẳ" ->   "a"
;                  "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲ" ->   "A"
;                  "éèẹẻẽêếềệểễ"      ->   "e"
;                  "ÉÈẸẺẼÊẾỀỆỂỄ"      ->   "E"
;                  "óòọỏõôốồộổỗơớờợở" ->   "o"
;                  "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞ" ->   "O"
;                  "úùụủũưứừựửữ"      ->   "u"
;                  "ÚÙỤỦŨƯỨỪỰỬỮ"      ->   "U"
;                  "íìịỉĩ"            ->   "i"
;                  "ÍÌỊỈĨ"            ->   "I"
;                  "ýỳỵỷỹ"            ->   "y"
;                  "ÝỲỴỶỸ"            ->   "Y"
;                  "đ"                ->   "d"
;                  "Đ"                ->   "D"
; Syntax ........: _vn_RemoveAccents($_String)
; Parameters ....: $_String             - String to be removed accents
; Return values .: Return a string in ascii only
; ===============================================================================================================================
Func _vn_RemoveAccents($_String = "Đây là đoạn text mẫu!")
	Local $I
	For $I = 0 To 13
		$_String = StringRegExpReplace($_String, $_vn_utf8[$I][0], $_vn_utf8[$I][1])
	Next
	Return $_String
EndFunc