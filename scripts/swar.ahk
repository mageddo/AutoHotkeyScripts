#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe ShadowOfWar.exe

OneEighty(x)
{
    DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

global Stealth
Stealth := false

EnterStealth()
{
    global Stealth
    
    if(!Stealth)
    {
        Stealth := true
        Send {Blind}{F10 DownTemp}
    }
}

LeaveStealth()
{
    global Stealth
    
    if(Stealth)
    {
        Stealth := false
        Send {Blind}{F10 up}
    }
}

LeaveRanged()
{
    global Ranged
        
    if(Ranged)
    {
        Ranged := 0
        Send {Click up right}
    }
}

EnterRanged()
{
    global Ranged
        
    if(!Ranged)
    {
        Ranged := true
        Send {Click DownTemp right}
    }
}

~*Home::
LeaveStealth()
Send {Blind}{Esc DownTemp}
return

~*Home up::
Send {Blind}{Esc up}
return

~*Numpad2::
global OneEightyAll
OneEighty(3800)
return

~*NumpadEnter::
global Numpad0Down
sleep_var := 100
if(Numpad0Down)
{
    LeaveStealth()
    Send {Blind}{F10 DownTemp}
    Sleep sleep_var
    Send {Blind}{F10 up}
    Sleep sleep_var
}
EnterStealth()
return

~*LButton up::
LeaveStealth()
return

~*RButton up::
global Numpad0Down
LeaveRanged()
if(Numpad0Down)
{
    return
}
LeaveStealth()
return

~*Numpad0::
global Numpad0Down
Numpad0Down := true
Send {Blind}{Space DownTemp}
return

~*Numpad0 up::
global Numpad0Down
Numpad0Down := false
LeaveStealth()
Send {Blind}{Space up}
return

~*Numpad1 up::
LeaveStealth()
LeaveRanged()
return

~*NumpadMult::x
return

~*NumpadDiv::
LeaveStealth()
EnterRanged()
return

~*XButton1::
sleep_var := 150
Send {Blind}{LShift DownTemp}
Sleep sleep_var
Send {Blind}{Click DownTemp}
Sleep sleep_var
Send {Blind}{Click up}{LShift up}
return

~*XButton2::2
return

~*PgDn::
global Ranged
if(Ranged)
{
    Send {Blind}{z DownTemp}
    return
}
Send {Blind}{LCtrl DownTemp}
return

~*PgDn up::
global Ranged
LeaveStealth()
if(Ranged)
{
    Send {Blind}{z up}
    LeaveRanged()
    return
}
Send {Blind}{LCtrl up}
return

~*m::
LeaveStealth()
LeaveRanged()
return

~*Numpad7::
global Ranged
if(Ranged)
{
    Send {Blind}{x DownTemp}
    return
}
Send {Blind}{e DownTemp}
return

~*Numpad7 up::
global Ranged
LeaveStealth()
if(Ranged)
{
    Send {Blind}{x up}
    LeaveRanged()
    return
}
Send {Blind}{e up}
return

~*Numpad9::
global Ranged
if(Ranged)
{
    Send {Blind}{f DownTemp}
    return
}
return

~*Numpad9 up::
global Ranged
LeaveStealth()
if(Ranged)
{
    Send {Blind}{f up}
    LeaveRanged()
    return
}
return

~*NumpadSub::
SetKeyDelay -1
sub_var := true
sub_sleep_var := 25
while(sub_var)
{		
	Send {Blind}{w DownTemp}{Click DownTemp}
	Sleep sub_sleep_var
	Send {Blind}{w up}{Click up}
	Sleep sub_sleep_var
}
return

~*NumpadSub up::
SetKeyDelay -1
sub_var := false
return
