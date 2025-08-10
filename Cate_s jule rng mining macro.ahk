#SingleInstance, Force
#Persistent
#Include, %A_ScriptDir%\lib\Gdip_All.ahk
global ssPath := "ss.jpg"
#Include, %A_ScriptDir%\lib\rescalc.ahk
IniRead, WebhookEnable, %A_ScriptDir%\lib\settings.ini, webhook, webhookenabled, 0
IniRead, WebhookLink, %A_ScriptDir%\lib\settings.ini, webhook, webhooklink, Insert your webhook
IniRead, WebhookCD, %A_ScriptDir%\lib\settings.ini, webhook, webhookCD, 5

Gdip_Startup()

Gui, New, AlwaysOnTop
Gui, Color, 1E1E1E
Gui, Font, S14 Segoe UI cFFFFFF

Gui, Add, Button, x15 y190 h30 w90 -Theme gStart, Start (F1)
Gui, Add, Button, x115 y190 h30 w90 -Theme gStop, Exit (F2)

Gui, Font, cFFFFFF

Gui Add, Tab3, vMainTabs x1 y1 w220 h180 +0x800000, Main|Webhook|Credit

Gui Tab, 1

Gui, Add, Radio, x15 y40 vHP1 gUpdateSelection, Not mined yet
Gui, Add, Radio, x15 y70 vHP2 gUpdateSelection, Already mined
Gui, Add, Picture, x160 y130 h35 w35, %A_ScriptDir%\lib\HIM.png
Gui, Font, c272222
Gui, Add, Text, x15 y115 h20 w140, T A C O . . .
Gui, Font, cFFFFFF

Gui Tab, 2

Gui, Add, CheckBox, gUpdatewebhookenable x15 y35 h30 w150 vWebhookEnable, Enable webhook
Gui, Add, Text, x15 y65 h20 w150, WebHook link
Gui, Add, Edit, gUpdatewebhooklink c000000 x15 y90 h20 w150 vWebhookLink, Insert your webhook
Gui, Add, Text, x15 y120 h20 w190, Send cooldown (Minutes)
Gui, Add, Edit, gUpdatewebhookcd c000000 x15 y145 h20 w150 vWebhookCD, 5

Gui Tab, 3 

Gui, Font, s6.5
Gui, Add, Picture, x160 y50 h35 w35, %A_ScriptDir%\lib\bored.png
Gui, Add, Text, x15 y50 h20 w140, @b0red_man
Gui, Add, Text, x15 y70 h20 w140, helping with code
Gui, Add, Picture, x15 y90 h35 w35, %A_ScriptDir%\lib\justalin.png
Gui, Add, Text, x70 y90 h20 w140, @_justalin
Gui, Add, Text, x70 y105 h30 w140, made the macro base and teaching
Gui, Add, Picture, x160 y130 h35 w35, %A_ScriptDir%\lib\dolphin.png
Gui, Add, Text, x15 y140 h20 w140, @builderdolphin
Gui, Add, Text, x15 y160 h20 w140, inspired by his macro
Gui, Font,s6.5 c2F2929
Gui, Add, Text, x110 y60 h20 w50, i like birds

global SelectedMode := 1  ; Default to first radio option
GuiControl,, WebhookEnable, %WebhookEnable%
GuiControl,, WebhookLink, %WebhookLink%
GuiControl,, WebhookCD, %WebhookCD%

Gui, Show, w220 h230 x0 y0
Return

Updatewebhookcd:
{
	Gui, Submit, NoHide
	IniWrite %WebhookCD%, %A_ScriptDir%\lib\settings.ini, webhook, webhookCD
	Return
}
Updatewebhookenable:
{
	Gui, Submit, NoHide
	IniWrite %WebhookEnable%, %A_ScriptDir%\lib\settings.ini, webhook, webhookenabled
	Return
}

Updatewebhooklink:
{
	global url
	Gui, Submit, NoHide
	IniWrite %WebhookLink%, %A_ScriptDir%\lib\settings.ini, webhook, webhooklink
	url := WebhookLink
	Return
}

UpdateSelection:
{
    Gui, Submit, NoHide
    if (HP1)
        SelectedMode := 1
    else if (HP2)
        SelectedMode := 2
}
Return

Start:
    {
        webhookCD := % webhookCD * 60 * 1000
        SetTimer, gemSSloop, %webhookCD%
        if (SelectedMode = 1)
        {
            MsgBox, if the macro doesnt walk forward after pressing ok then please exit and run the macro again
            WinActivate, ahk_exe RobloxPlayerBeta.exe
	    Send, {i Down}
	    Sleep, 1300
	    Send, {i Up}
	    Sleep, 50
	    zoom()
	    mine1()
            Loop
            {
                mine2()
                Sleep, 500
            }
        }
        else if (SelectedMode = 2)
        {
            MsgBox, if the macro doesnt walk forward after pressing ok then please exit and run the macro again also make sure you made the mine flat
            WinActivate, ahk_exe RobloxPlayerBeta.exe
	    Send, {i Down}
	    Sleep, 1300
	    Send, {i Up}
	    Sleep, 50
	    zoom()
            Loop
            {
                mine2()
                Sleep, 500
            }
        }
    }
Return

Info:
    {
        MsgBox, thank you allan (@_justalin on discord) for the base macro. (originally this macro was made for crafting potions on sols rng) macro modded by cate (@sploinker on discord)
    }
Return


    Stop:
    Reload
    Return

    F1::
    Gosub, Start
    Return
    F2::ExitApp
    Return
	F3::Reload
	Return
	F9::gemss()

mine1()
    {
	Global NewDX
	Global NewDY
	Global NewFY
	Global NewFX
	Global RNewU
	Global RNewD
	Global RNewX
    ; Reset Position
        Send, {Esc}
        Sleep, 100
        Send, {r}
        Sleep, 100
        Send, {Enter}
        Sleep, 3200
	Click, %RNewX% %RNewU% Right Down
	Click, %RNewX% %RNewD% Right Up
	Send, {w down}
	Sleep, 1600
	Send, {w up}
	Sleep, 50
	Send, {a down}
	Sleep, 1470
	Send, {a up}
	Sleep, 50
    ; mining block below
	Click, %NewDX% %NewDY% Left Down
    	Sleep, 800
    	Click, %NewDX% %NewDY% Left Up
    	Sleep, 100
    	Loop, 6
    	{
        	MiningForward()
        	Sleep, 50
        	MiningRight()
        	Sleep, 50
        	MiningBackward()
        	Sleep, 50
        	MiningRight()
        	Sleep, 50
    	}
    	MiningForward()
 	Click, %NewFX% %NewFY% Left Up
	Sleep, 50
	Click, 600 450 0
    }
Return
mine2()
    {
	Global NewDX
	Global NewDY
	Global NewFY
	Global NewFX
	Global RNewU
	Global RNewD
	Global RNewX
    ; Reset Position
        Send, {Esc}
        Sleep, 100
        Send, {r}
        Sleep, 100
        Send, {Enter}
        Sleep, 3700
	Click, %RNewX% %RNewU% Right Down
	Click, %RNewX% %RNewD% Right Up
	Send, {w down}
	Sleep, 1800
	Send, {w up}
	Sleep, 50
	Send, {a down}
	Sleep, 1600
	Send, {a up}
	Sleep, 50
	Send, {s down}
	Sleep, 1600
	Send, {s up}
	Sleep, 50
	Send, {w down}
	Sleep, 50
	Send, {w up}
	Sleep, 6000
    ; mining block below
	Click, %NewDX% %NewDY% Left Down
    	Sleep, 800
    	Click, %NewDX% %NewDY% Left Up
    	Sleep, 100
    	Loop, 6
    	{
        	MiningForward()
        	Sleep, 50
        	MiningRight()
        	Sleep, 50
        	MiningBackward()
        	Sleep, 50
        	MiningRight()
        	Sleep, 50
    	}
    	MiningForward()
	Click, %NewFX% %NewFY% Left Up
	Sleep, 50
	Click, 600 450 0
    }
Return
MiningForward()
	{
	Global NewFY
	Global NewFX
	Send, {w down}
	Click, %NewFX% %NewFY% Left Down
	Sleep, 10000
	Send, {w Up}
	Return
	}
MiningRight()
	{
	Global NewRY
	Global NewRX
	Click, %NewRX% %NewRY% Left Up
	Sleep, 50
	Send, {d down}
	Sleep, 500
	Send, {d up}
	Send, {d down}
	Click, %NewRX% %NewRY% Left Down
	Sleep, 800
	Click, %NewRX% %NewRY% Left Up
	Sleep, 1000
	Send, {d up}
	Click, %NewRX% %NewRY% Left Down
	Send, {w down}
	Sleep, 50
	Send, {w up}
	Sleep, 50
	Return
	}
MiningBackward()
	{
	Global NewBY
	Global NewBX
	Send, {s down}
	Click, %NewBX% %NewBY% 0
	Sleep, 10000
	Send, {s up}
	Return
	}
zoom()
	{
	Loop, 7
		{
		Send, {WheelDown 1}
		Sleep, 50
		}
	}
gemss()
{
global WebhookLink
Gui, Submit, NoHide
Time := A_NowUTC
EnvSub, Time, 19700101000000, Seconds
ssMap := Gdip_BitmapFromScreen(NewTLX . "|" . NewTLY . "|" . NewBRX . "|" . NewBRY)
    Gdip_SaveBitmapToFile(ssMap,ssPath)
    Gdip_DisposeBitmap(ssMap)
    try webhookPost({files:[ssPath],embedimage:"attachment://ss.jpg",embedTitle:"total gems mined",content:"Last updated <t:" . Time . ":R>"}, WebhookLink)
    FileDelete, %ssPath%
}

; CreateFormData() by tmplinshi, AHK Topic: https://autohotkey.com/boards/viewtopic.php?t=7647
; Thanks to Coco: https://autohotkey.com/boards/viewtopic.php?p=41731#p41731
; Modified version by SKAN, 09/May/2016

CreateFormData(ByRef retData, ByRef retHeader, objParam) {
	New CreateFormData(retData, retHeader, objParam)
}

Class CreateFormData {

    __New(ByRef retData, ByRef retHeader, objParam) {

        Local CRLF := "`r`n", i, k, v, str, pvData
        ; Create a random Boundary
        Local Boundary := this.RandomBoundary()
        Local BoundaryLine := "------------------------------" . Boundary

        this.Len := 0 ; GMEM_ZEROINIT|GMEM_FIXED = 0x40
        this.Ptr := DllCall( "GlobalAlloc", "UInt",0x40, "UInt",1, "Ptr" ) ; allocate global memory

        ; Loop input paramters
        For k, v in objParam
        {
            If IsObject(v) {
                For i, FileName in v
                {
                    str := BoundaryLine . CRLF
                    . "Content-Disposition: form-data; name=""" . k . """; filename=""" . FileName . """" . CRLF
                    . "Content-Type: " . this.MimeType(FileName) . CRLF . CRLF
                    this.StrPutUTF8( str )
                    this.LoadFromFile( Filename )
                    this.StrPutUTF8( CRLF )
                }
            } Else {
                str := BoundaryLine . CRLF
                . "Content-Disposition: form-data; name=""" . k """" . CRLF . CRLF
                . v . CRLF
                this.StrPutUTF8( str )
            }
        }

        this.StrPutUTF8( BoundaryLine . "--" . CRLF )

        ; Create a bytearray and copy data in to it.
        retData := ComObjArray( 0x11, this.Len ) ; Create SAFEARRAY = VT_ARRAY|VT_UI1
        pvData := NumGet( ComObjValue( retData ) + 8 + A_PtrSize )
        DllCall( "RtlMoveMemory", "Ptr",pvData, "Ptr",this.Ptr, "Ptr",this.Len )

        this.Ptr := DllCall( "GlobalFree", "Ptr",this.Ptr, "Ptr" ) ; free global memory 

        retHeader := "multipart/form-data; boundary=----------------------------" . Boundary
    }

    StrPutUTF8( str ) {
        Local ReqSz := StrPut( str, "utf-8" ) - 1
        this.Len += ReqSz ; GMEM_ZEROINIT|GMEM_MOVEABLE = 0x42
        this.Ptr := DllCall( "GlobalReAlloc", "Ptr",this.Ptr, "UInt",this.len + 1, "UInt", 0x42 ) 
        StrPut( str, this.Ptr + this.len - ReqSz, ReqSz, "utf-8" )
    }

    LoadFromFile( Filename ) {
        Local objFile := FileOpen( FileName, "r" )
        this.Len += objFile.Length ; GMEM_ZEROINIT|GMEM_MOVEABLE = 0x42 
        this.Ptr := DllCall( "GlobalReAlloc", "Ptr",this.Ptr, "UInt",this.len, "UInt", 0x42 )
        objFile.RawRead( this.Ptr + this.Len - objFile.length, objFile.length )
        objFile.Close() 
    }

    RandomBoundary() {
        str := "0|1|2|3|4|5|6|7|8|9|a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z"
        Sort, str, D| Random
        str := StrReplace(str, "|")
        Return SubStr(str, 1, 12)
    }

    MimeType(FileName) {
        n := FileOpen(FileName, "r").ReadUInt()
        Return (n = 0x474E5089) ? "image/png"
        : (n = 0x38464947) ? "image/gif"
        : (n&0xFFFF = 0x4D42 ) ? "image/bmp"
        : (n&0xFFFF = 0xD8FF ) ? "image/jpeg"
        : (n&0xFFFF = 0x4949 ) ? "image/tiff"
        : (n&0xFFFF = 0x4D4D ) ? "image/tiff"
        : "application/octet-stream"
    }

}

webhookPost(data := 0, url := ""){
  data := data ? data : {}

  if (data.pings){
      data.content := data.content ? data.content " <@nonotyet>" : "<@nonotyet>"
  }

  payload_json := "
  (LTrim Join
  {
    ""content"": """ data.content """,
    ""embeds"": [{
              " (data.embedAuthor ? """author"": {""name"": """ data.embedAuthor """" (data.embedAuthorImage ? ",""icon_url"": """ data.embedAuthorImage """" : "") "}," : "") "
              " (data.embedTitle ? """title"": """ data.embedTitle """," : "") "
      ""description"": """ data.embedContent """,
              " (data.embedThumbnail ? """thumbnail"": {""url"": """ data.embedThumbnail """}," : "") "
              " (data.embedImage ? """image"": {""url"": """ data.embedImage """}," : "") "
              " (data.embedFooter ? """footer"": {""text"": """ data.embedFooter """}," : "") "
      ""color"": """ (data.embedColor ? data.embedColor : 0) """
    }]
  }
  )"

  if ((!data.embedContent && !data.embedTitle) || data.noEmbed)
      payload_json := RegExReplace(payload_json, ",.*""embeds.*}]", "")
  

  objParam := {payload_json: payload_json}

  for i,v in (data.files ? data.files : []) {
      objParam["file" i] := [v]
  }

  CreateFormData(postdata,hdr_ContentType,objParam)

  WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
  WebRequest.Open("POST", url, true)
  WebRequest.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko")
  WebRequest.SetRequestHeader("Content-Type", hdr_ContentType)
  WebRequest.SetRequestHeader("Pragma", "no-cache")
  WebRequest.SetRequestHeader("Cache-Control", "no-cache, no-store")
  WebRequest.SetRequestHeader("If-Modified-Since", "Sat, 1 Jan 2000 00:00:00 GMT")
  WebRequest.Send(postdata)
  WebRequest.WaitForResponse()
}
gemSSloop:
{
    gemss()
}
Return
    GuiClose:
Exitapp