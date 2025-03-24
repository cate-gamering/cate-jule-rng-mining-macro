#SingleInstance, Force
#Persistent

Gui, New, AlwaysOnTop
Gui, Color, 1E1E1E
Gui, Font, S14 Segoe UI cFFFFFF

Gui, Add, Button, x15 y80 h30 w90 -Theme gStart, Start (F1)
Gui, Add, Button, x115 y80 h30 w90 -Theme gStop, Exit (F2)

Gui, Add, Radio, x20 y15 vHP1 gUpdateSelection, no mine yet
Gui, Add, Radio, x20 y45 vHP2 gUpdateSelection, mined

Gui, Add, Button, x140 y15 w50 h50 -Theme gInfo, credit
Gui, Font, cFFFFFF
Gui, Show, w220 h120 x0 y0

global SelectedMode := 1  ; Default to first radio option

Return

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
        if (SelectedMode = 1)
        {
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
            MsgBox, make sure you made the mine flat
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

mine1()
    {
    ; Reset Position
        Send, {Esc}
        Sleep, 100
        Send, {r}
        Sleep, 100
        Send, {Enter}
        Sleep, 3200
	Click, 600 450 Right Down
	Click, 600 950 Right Up
	Send, {w down}
	Sleep, 1600
	Send, {w up}
	Sleep, 50
	Send, {a down}
	Sleep, 1470
	Send, {a up}
	Sleep, 50
    ; mining block below
	Click, 960 540 Left Down
    	Sleep, 1100
    	Click, 960 540 Left Up
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
 	Click, 960 333 Left Up
	Sleep, 50
	Click, 600 450 0
    }
Return
mine2()
    {
    ; Reset Position
        Send, {Esc}
        Sleep, 100
        Send, {r}
        Sleep, 100
        Send, {Enter}
        Sleep, 3700
	Click, 600 450 Right Down
	Click, 600 950 Right Up
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
	Click, 960 540 Left Down
    	Sleep, 1100
    	Click, 960 540 Left Up
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
	Click, 960 333 Left Up
	Sleep, 50
	Click, 600 450 0
    }
Return
MiningForward()
	{
	Send, {w down}
	Click, 960 333 Left Down
	Sleep, 17000
	Send, {w Up}
	Return
	}
MiningRight()
	{
	Click, 1260 540 Left Up
	Sleep, 50
	Send, {d down}
	Sleep, 500
	Send, {d up}
	Send, {d down}
	Click, 1260 540 Left Down
	Sleep, 1500
	Send, {d up}
	Send, {w down}
	Sleep, 50
	Send, {w up}
	Sleep, 50
	Return
	}
MiningBackward()
	{
	Send, {s down}
	Click, 960 810 0
	Sleep, 17000
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
    GuiClose:
Exitapp