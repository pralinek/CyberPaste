#SingleInstance Force
    #Maxmem

ifExist, %A_ScriptDir%\cyberfiles\clipboards
    FileRemoveDir, %A_WorkingDir%\cyberfiles\clipboards,1

Mainshortarray := []
shortarray := []
Nrshortarray := []
listarray := []
Mainarray := []
Array := []
Nrarray := []
nrshortarray := []
arraytest := []
mailarray := []

CoordMode, tooltip, screen

counttotal = 0
countcontrol = 0
countchange = 0
countchange = 0
countdelete = 0
countminus = 0

FileCreateDir, cyberfiles
FileCreateDir, cyberfiles\clipboards

Fullpre = %A_ScriptDir%\cyberfiles\predefine.ini
Fullpre2 = %A_ScriptDir%\cyberfiles\predefine2.ini
macropre = %A_ScriptDir%\cyberfiles\template.ini
fmailini = %A_ScriptDir%\cyberfiles\fmail.ini
settingsini = %A_ScriptDir%\cyberfiles\settingsini.ini
clipboardsfile = %A_ScriptDir%\cyberfiles\clipboards
macrosfile = %A_ScriptDir%\cyberfiles\macros

ifNotExist, %A_ScriptDir%\cyberfiles\settingsini.ini
{
    fileappend, %settingsini%
    Iniwrite, 1, %settingsini%, Handchoice
    Iniwrite, 0, %settingsini%, ridkeyboard
    Iniwrite, 1, %settingsini%, keyboardcontrol
    Iniwrite, 1, %settingsini%,ctrlright
    Iniwrite, 1, %settingsini%, updownmouse
    Iniwrite, 1, %settingsini%, ctrlc
    Iniwrite, 1, %settingsini%, middlekey
}

brelease = false
ks1 = false
ks3 = false
hide01 = false
cmdvar = false
onvar = true
onvar2 = true
onvar3 = true

wvar7 = 200
hvar7 = 20
wvar1 = 175
hvar1 = 30
xvar1 := A_ScreenWidth - wvar1 - 50
yvar1:= A_Screenheight - hvar1 - 100
xvar2 := A_ScreenWidth - 430
yvar2:= A_Screenheight - 92
xvar4 := A_ScreenWidth - 900
yvar4:= A_Screenheight - 600
xvar5 := A_ScreenWidth - 750
yvar5:= A_Screenheight - 750
xvar6 := A_ScreenWidth - 100
yvar6:= A_Screenheight - 130
xvar7 := A_ScreenWidth - wvar1 - 8
yvar7:= A_Screenheight - hvar1 - 180

;settings__________________________________________________________________________________
Iniread, Handchoice, %settingsini%, Handchoice
Iniread, ridkeyboard, %settingsini%, ridkeyboard 
Iniread, keyboardcontrol, %settingsini%, keyboardcontrol
Iniread, ctrlright, %settingsini%, ctrlright
Iniread, updownmouse, %settingsini%, updownmouse
Iniread, ctrlc, %settingsini%, ctrlc
Iniread, middlekey, %settingsini%, middlekey

;--------------------------------------------------------------------gui;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

gosub, maingui
IniRead, list, %fullpre%
Stringreplace, list2, list, `n, |, all    
Loop, parse, list2, |
{
    
    arraytest.push(A_loopfield)
    }

IniRead, lmacro, %macropre%
Stringreplace, lmacro2, lmacro, `n, |, all
Loop, parse, lmacro2, |
{
    arraymacro.push(A_loopfield)
    }

IniRead, listmail, %fmailsini%
Stringreplace, listmail, listmail, `n, |, all
Loop, parse, listmail, |
{
    arraymails.push(A_loopfield)
    }
return

maingui:
    ;_____________________________________________________________________________________________________________________
    Gui 1: Color, c000515
    Gui 1: Show, x%xvar1%  y%yvar1% w%wvar1% h%hvar1%
    Gui 1: font, bold s9, Segoe UI
    
    Gui 1: Add, button, x155 y0 w25 h20 gmoveon, --
    ;-Gui 1: Add, button, x155 y14 w25 h14 gsplit, S
    Gui 1: Add, button, x155 y20 w25 h20 gpause, | |
    Gui 1: Add, button, x155 y40 w25 h20 gpre, M
    
    Gui 1: font, normal cwhite s9, Segoe UI 
    Gui 1: Add, text, x5 y3 vText1 w140, 
    Gui 1: Add, text, x5 y16 vText2 w140, 
    Gui 1: Add, text, x5 y29 cgreen vVALUE vTextMain gTextmain w140,
    Gui 1: font, cwhite s9, Segoe UI 
    Gui 1: Add, text, x5 y42 vText4 w140, 
    Gui 1:  +lastfound +AlwaysOnTop +ToolWindow -Caption 
    WinSet, TransColor, color 160
    ;---------------------------------------------------------------------------------------------------------------------------
    
    ;-------------------------------------------------------------------------------------------------------------------------
return

pregui:
return
;------------------------------------------predefajn function  -----------------------------------------------------
macrogui:
    ;predefine needed
    
    
    ;general
    Gui 4: color, c000515
    Gui 4: Add, button, x600 y25 w75 h50 gxpredefines, Predefines,
    Gui 4: Add, button, x600 y75 w75 h50 gxtemplates, Templates
    Gui 4: Add, button, x600 y125 w75 h50 gxmails, Mails 
    Gui 4: Add, button, x600 y175 w75 h50 gxsettings, Settings
    Gui 4: Add, button, x600 y225 w75 h50 gblue, Help
    Gui 4: Add, button, x600 y275 w75 h50 gblue, General
    
    Gui 4: Show, x%xvar4%  y%yvar4% w700 h350
    
    
    ;predefines
    Gui 4: Add, edit, x140 y60 vviewp w200 h200
    Gui 4: Add, edit, x360 y60 vView w200 h200
    Gui 4: Add, edit, x380 y270 vPredefajn w100
    Gui 4: Add, button, x500 y270 vcreate gcreate, CREATE
    Gui 4: Add, button, x200 y270 vdeletebutton gdeletebutton, DELETE
    Gui 4: Add, button, x280 y270 vmodifybutton gmodifybutton, MODIFY
    Gui 4: Add, ListBox, vMyListBox1 gMyListBox1 x20 y60 w100 r17
    Gui 4: Add, Edit, x20 y300 w100 vSearch1,
    Gui 4: Add, Button, x130 y300 w120 h20 w50 Default vok gOK, Search
    
    fullview := mainarray[countchange]
    Iniread, fullvar, %fulltext%, %countchange%
    IniRead, list, %fullpre%
    Stringreplace, list, list, `n, |, all
    Stringreplace, searchlist, list, |, ``,, all
    GuiControl, , Mylistbox1,
    GuiControl, 4:, Mylistbox1, %list%
    Guicontrol, 4:, view, %fullview%
    
    ;templates
    Gui 4: Add, edit, x140 y60 vviewp2 w200 h200
    Gui 4: Add, edit, x360 y60 vView2 w200 h100
    Gui 4: Add, edit, x380 y270 vmakros w100
    Gui 4: Add, button, x500 y270 vmcreate gmcreate, CREATE
    Gui 4: Add, button, x200 y270 vdeletebutton2 gdeletebutton2, DELETE
    Gui 4: Add, button, x280 y270 vmodifybutton2 gmodifybutton2, MODIFY
    Gui 4: Add, ListBox, vmylistboxmacro gmylistboxmacro x20 y60 w100 r17
    Gui 4: Add, Edit, x20 y300 w100 vSearch2,
    Gui 4: Add, Button, x130 y300 w120 h20 w50 Default vok2 gOK2, Search
    
    
    IniRead, lmacro, %macropre%
    Stringreplace, lmacro2, lmacro, `n, |, all
    GuiControl, 4:, mylistboxmacro, |
    GuiControl, 4:, mylistboxmacro, %lmacro2%
    
    ;mails
    gui 4: Add, text, x290 y20 vtexto, To
    gui 4: Add, text, x290 y45 vtextcc, CC
    gui 4: Add, text, x290 y70 vtextbcc, BCC
    gui 4: Add, text, x290 y95 vtextsubject, Subject
    Gui 4: Add, Edit, x330 y20 vmailto w200  h20
    Gui 4: Add, Edit, x330 y45 vmailcc w200  h20
    Gui 4: Add, Edit, x330 y70 vmailbcc w200  h20
    Gui 4: Add, Edit, x330 y95 vmailsubject w200  h20
    Gui 4: Add, edit, x230 y120 vmailbody w300 h160
    Gui 4: Add, edit, x230 y300 vmcreation w150 h20
    Gui 4: Add, button, x410 y300 vmailcreate gmailcreate, CREATE
    Gui 4: Add, button, x140 y250 vmaildelete gmaildelete, DELETE
    Gui 4: Add, button, x470 y300 vmailmodify gmailmodify, MODIFY
    Gui 4: Add, ListBox, vmylistboxmail gmylistboxmail x20 y20 w100 r20
    Gui 4: Add, Edit, x20 y300 w100 vSearchMail,
    Gui 4: Add, Button, x130 y300 w120 h20 w50 Default vokmail gOKmail, Search
    
    IniRead, listmail2, %fmailini%
    Stringreplace, listmail2, listmail2, `n, |, all
    GuiControl, 4:, mylistboxmail, |
    GuiControl, 4:, mylistboxmail, %listmail2%
    
    
    ;settings
    Gui 4: font, normal cwhite s9, Segoe UI
    Gui 4: Add, Checkbox, x100 y20 vhandchoice, #Standard controls`n -Copy - Ctrl + left click`n -Paste - Ctrl + right click`n -Change clipboard - ctrl+mouse wheel up/down.`n -Paste All- ctrl plus middle click to see the view then press ctrl + right click to paste all.
    Gui 4: Add, CheckBox, vridkeyboard, #Use only mouse to control the application. `n -Copy with middle mouse key.`n -Choose clipboard by holding left mouse key + mouse wheel up/mouse wheel down.`n -Paste by holding left and clicking right.`n - Paste All - hold left mouse key + click middle key to see the view,`n then paste by clicking right mouse key when still holding left mouse key.
    Gui 4: Add, CheckBox, vkeyboardcontrol, #Keyboard control `n -Change clipboard - Ctrl + up/down arrow `n -Paste - ctrl+spacebar.`n -Paste All - ctrl+shift+spacebar
    ;Gui 4: Add, CheckBox, vctrlright, Paste with control+right mouse button?
    ;Gui 4: Add, CheckBox, vupdownmouse, Change clipboards with CTRL - mouse wheel down/up?
    Gui 4: Add, CheckBox, vctrlc, #Use Ctrl+C with the script. 
    ;Gui 4: Add, CheckBox, vmiddlekey, Copy with middle mouse key?
    Gui 4: font, normal cwhite s12, Segoe UI
    Gui 4: Add, button, x500 y270 vsetapply gsetapply, Apply
    
    
    
    
    
    
    
    
    
    
    
    GuiControl 4: hide, texto
    GuiControl 4: hide, textcc
    GuiControl 4: hide, textbcc
    GuiControl 4: hide, textsubject
    GuiControl 4: hide, mailto
    GuiControl 4: hide, mailcc
    GuiControl 4: hide, mailbcc
    GuiControl 4: hide, mailsubject
    GuiControl 4: hide, mcreation
    GuiControl 4: hide, mailbody
    GuiControl 4: hide, mailcreate
    GuiControl 4: hide, maildelete
    GuiControl 4: hide, mailmodify
        GuiControl 4: hide, mylistboxmail
    GuiControl 4: hide, searchmail
    GuiControl 4: hide, okmail
    
    
    GuiControl 4: hide, viewp2
    GuiControl 4: hide, view2
    GuiControl 4: hide, makros
    GuiControl 4: hide, mcreate
    GuiControl 4: hide, deletebutton2
    GuiControl 4: hide, modifybutton2
        GuiControl 4: hide, mylistboxmacro
    GuiControl 4: hide, search2
    GuiControl 4: hide, ok2
    
    GuiControl 4: hide, hand
    GuiControl 4: hide, Handchoice
    GuiControl 4: hide, ridkeyboard
    GuiControl 4: hide, keyboardcontrol
    GuiControl 4: hide, ctrlright
    GuiControl 4: hide, updownmouse
    GuiControl 4: hide, ctrlc
    GuiControl 4: hide, middlekey
    GuiControl 4: hide, setapply
return

xpredefines:
    
    
    Gui 4: color, c000515
    GuiControl 4: show, viewp
    GuiControl 4: show, view
    GuiControl 4: show, predefajn
    GuiControl 4: show, create
    GuiControl 4: show, deletebutton
    GuiControl 4: show, modifybutton
        GuiControl 4: show, mylistbox1
    GuiControl 4: show, search1
    GuiControl 4: show, ok
    
    
    GuiControl 4: hide, viewp2
    GuiControl 4: hide, view2
    GuiControl 4: hide, makros
    GuiControl 4: hide, mcreate
    GuiControl 4: hide, deletebutton2
    GuiControl 4: hide, modifybutton2
        GuiControl 4: hide, mylistboxmacro
    GuiControl 4: hide, search2
    GuiControl 4: hide, ok2
    
    GuiControl 4: hide, texto
    GuiControl 4: hide, textcc
    GuiControl 4: hide, textbcc
    GuiControl 4: hide, textsubject
    GuiControl 4: hide, mailto
    GuiControl 4: hide, mailcc
    GuiControl 4: hide, mailbcc
    GuiControl 4: hide, mailsubject
    GuiControl 4: hide, mcreation
    GuiControl 4: hide, mailbody
    GuiControl 4: hide, mailcreate
    GuiControl 4: hide, maildelete
    GuiControl 4: hide, mailmodify
        GuiControl 4: hide, mylistboxmail
    GuiControl 4: hide, searchmail
    GuiControl 4: hide, okmail
    
    GuiControl 4: hide, hand
    GuiControl 4: hide, Handchoice
    GuiControl 4: hide, ridkeyboard
    GuiControl 4: hide, keyboardcontrol
    GuiControl 4: hide, ctrlright
    GuiControl 4: hide, updownmouse
    GuiControl 4: hide, ctrlc
    GuiControl 4: hide, middlekey
    GuiControl 4: hide, setapply
return

xtemplates:
    Gui 4: color, cE82C0C
    GuiControl 4: Hide, viewp
    GuiControl 4: Hide, view
    GuiControl 4: Hide, predefajn
    GuiControl 4: Hide, create
    GuiControl 4: Hide, deletebutton
    GuiControl 4: Hide, modifybutton
        GuiControl 4: Hide, mylistbox1
    GuiControl 4: Hide, search1
    GuiControl 4: Hide, ok
    
    GuiControl 4: show, viewp2
    GuiControl 4: show, view2
    GuiControl 4: show, makros
    GuiControl 4: show, mcreate
    GuiControl 4: show, deletebutton2
    GuiControl 4: show, modifybutton2
        GuiControl 4: show, mylistboxmacro
    GuiControl 4: show, search2
    GuiControl 4: show, ok2
    
    GuiControl 4: hide, texto
    GuiControl 4: hide, textcc
    GuiControl 4: hide, textbcc
    GuiControl 4: hide, textsubject
    GuiControl 4: hide, mailto
    GuiControl 4: hide, mailcc
    GuiControl 4: hide, mailbcc
    GuiControl 4: hide, mailsubject
    GuiControl 4: hide, mcreation
    GuiControl 4: hide, mailbody
    GuiControl 4: hide, mailcreate
    GuiControl 4: hide, maildelete
    GuiControl 4: hide, mailmodify
        GuiControl 4: hide, mylistboxmail
    GuiControl 4: hide, searchmail
    GuiControl 4: hide, okmail
    
    GuiControl 4: hide, hand
    GuiControl 4: hide, Handchoice
    GuiControl 4: hide, ridkeyboard
    GuiControl 4: hide, keyboardcontrol
    GuiControl 4: hide, ctrlright
    GuiControl 4: hide, updownmouse
    GuiControl 4: hide, ctrlc
    GuiControl 4: hide, middlekey
    GuiControl 4: hide, setapply
return
xmails:	
    Gui 4: color, c0173c7
    GuiControl 4: Hide, viewp
    GuiControl 4: Hide, view
    GuiControl 4: Hide, predefajn
    GuiControl 4: Hide, create
    GuiControl 4: Hide, deletebutton
    GuiControl 4: Hide, modifybutton
        GuiControl 4: Hide, mylistbox1
    GuiControl 4: Hide, search1
    GuiControl 4: Hide, ok
    
    GuiControl 4: hide, viewp2
    GuiControl 4: hide, view2
    GuiControl 4: hide, makros
    GuiControl 4: hide, mcreate
    GuiControl 4: hide, deletebutton2
    GuiControl 4: hide, modifybutton2
        GuiControl 4: hide, mylistboxmacro
    GuiControl 4: hide, search2
    GuiControl 4: hide, ok2
    
    GuiControl 4: show, texto
    GuiControl 4: show, textcc
    GuiControl 4: show, textbcc
    GuiControl 4: show, textsubject
    GuiControl 4: show, mailto
    GuiControl 4: show, mailcc
    GuiControl 4: show, mailbcc
    GuiControl 4: show, mailsubject
    GuiControl 4: show, mcreation
    GuiControl 4: show, mailbody
    GuiControl 4: show, mailcreate
    GuiControl 4: show, maildelete
    GuiControl 4: show, mailmodify
        GuiControl 4: show, mylistboxmail
    GuiControl 4: show, searchmail
    GuiControl 4: show, okmail
    
    GuiControl 4: hide, hand
    GuiControl 4: hide, Handchoice
    GuiControl 4: hide, ridkeyboard
    GuiControl 4: hide, keyboardcontrol
    GuiControl 4: hide, ctrlright
    GuiControl 4: hide, updownmouse
    GuiControl 4: hide, ctrlc
    GuiControl 4: hide, middlekey
    GuiControl 4: hide, setapply
return

xsettings:
    
    Iniread, Handchoice, %settingsini%, Handchoice
    Iniread, ridkeyboard, %settingsini%, ridkeyboard 
    Iniread, keyboardcontrol, %settingsini%, keyboardcontrol
    Iniread, ctrlright, %settingsini%, ctrlright
    Iniread, updownmouse, %settingsini%, updownmouse
    Iniread, ctrlc, %settingsini%, ctrlc
    Iniread, middlekey, %settingsini%, middlekey
    
    
    GuiControl, 4:, Handchoice, %Handchoice%
    GuiControl, 4:, ridkeyboard, %ridkeyboard%
    GuiControl, 4:, keyboardcontrol, %keyboardcontrol% 
    GuiControl, 4:, ctrlright, %ctrlright% 
    GuiControl, 4:, updownmouse, %updownmouse% 
    GuiControl, 4:, ctrlc, %ctrlc% 
    GuiControl, 4:, middlekey, %middlekey% 
    
    Gui 4: color, grey
    
    GuiControl 4: show, hand
    GuiControl 4: show, Handchoice
    GuiControl 4: show, ridkeyboard
    GuiControl 4: show, keyboardcontrol
    GuiControl 4: show, ctrlright
    GuiControl 4: show, updownmouse
    GuiControl 4: show, ctrlc
    GuiControl 4: show, middlekey
    GuiControl 4: show, setapply
    
    
    
    GuiControl 4: Hide, viewp
    GuiControl 4: Hide, view
    GuiControl 4: Hide, predefajn
    GuiControl 4: Hide, create
    GuiControl 4: Hide, deletebutton
    GuiControl 4: Hide, modifybutton
        GuiControl 4: Hide, mylistbox1
    GuiControl 4: Hide, search1
    GuiControl 4: Hide, ok
    
    GuiControl 4: hide, viewp2
    GuiControl 4: hide, view2
    GuiControl 4: hide, makros
    GuiControl 4: hide, mcreate
    GuiControl 4: hide, deletebutton2
    GuiControl 4: hide, modifybutton2
        GuiControl 4: hide, mylistboxmacro
    GuiControl 4: hide, search2
    GuiControl 4: hide, ok2
    
    GuiControl 4: hide, texto
    GuiControl 4: hide, textcc
    GuiControl 4: hide, textbcc
    GuiControl 4: hide, textsubject
    GuiControl 4: hide, mailto
    GuiControl 4: hide, mailcc
    GuiControl 4: hide, mailbcc
    GuiControl 4: hide, mailsubject
    GuiControl 4: hide, mcreation
    GuiControl 4: hide, mailbody
    GuiControl 4: hide, mailcreate
    GuiControl 4: hide, maildelete
    GuiControl 4: hide, mailmodify
        GuiControl 4: hide, mylistboxmail
    GuiControl 4: hide, searchmail
    GuiControl 4: hide, okmail
    
    Gui 4: Show, x%xvar4%  y%yvar4% w700 h350
    
    
return
blue:
return

GuiClose:
    ExitApp
    
    
return
;--------------------------------------------------------------Controls-------------------------------------------------------------
setapply:
    guicontrolget, Handchoice
    guicontrolget, ridkeyboard
    guicontrolget, keyboardcontrol
    guicontrolget, ctrlright
    guicontrolget, updownmouse
    guicontrolget, ctrlc
    guicontrolget, middlekey
    
    
    Inidelete, %settingsini%, Handchoice
    Inidelete, %settingsini%, ridkeyboard
    Inidelete, %settingsini%, keyboardcontrol
    Inidelete, %settingsini%, ctrlright
    Inidelete, %settingsini%, updownmouse
    Inidelete, %settingsini%, ctrlc
    Inidelete, %settingsini%, middlekey
    
    Iniwrite, %Handchoice%, %settingsini%, Handchoice
    Iniwrite, %ridkeyboard%, %settingsini%, ridkeyboard
    Iniwrite, %keyboardcontrol%, %settingsini%, keyboardcontrol
    Iniwrite, %ctrlright%, %settingsini%,ctrlright
    Iniwrite, %updownmouse%, %settingsini%, updownmouse
    Iniwrite, %ctrlc%, %settingsini%, ctrlc
    Iniwrite, %middlekey%, %settingsini%, middlekey
    
    Gui 4: destroy
return

removetooltip:
    tooltip
return

Textmain:
    if onvar2 = true
    {
        Gosub, pregui
        onvar2 = false
    }
    else
    {
        Gui 3: destroy
        onvar2 = true
    }
return
;000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
pre:
    if onvar3 = true
    {
        Gosub, macrogui
        onvar3 = false
    }
    else
    {
        Gui 4: destroy
        onvar3 = true
    }
return
;-----------------------------------------------------------------------------------------------------------------
moveon:
    if onvar = true
    {
        onvar = false
        Gui 1: +caption -toolwindow
        Gui 2: +caption -toolwindow
        Gui 3: +caption
        Settimer, moveoff, 10000
    }
    else
        Gosub, moveoff
return
;;-----------------------------------------------------------------------------------------------------------------
moveoff:
    Gui 1: -caption 
    Gui 2: -caption
    Gui 3: -caption
    onvar = true
return
;--------------------------------------------------------------------------------------------------------
close:
    onvar2 = true
    Gui 3: destroy
return
;---------------------------------------------------------------------------------------------------------

;----------------------------------------------------------------------------------------------------------------------
hide:
    Gui 1: hide
    Gui 2: show
    hide01 = true
return
;--------------------------------------------------------------------------------------------------------------
mainon:
    Gui 1: show
    Gui 2: hide
    hide01 = false
return
;------------------------------------------------------------------------------------
play:
    
    suspend, off
    Gui 7: hide
    if hide01 = false
        Gui 1: show
    else
        Gui 2: show
return

pause:
    Gui 1: hide
    Gui 2: hide
    Gui 7: show
    suspend, on
return
;---------------------------------------

MyListBox1:
    if A_GuiEvent <> click
        GuiControlGet, MyListBox1 
    IniRead, preview, %Fullpre%,%mylistbox1%,
    stringreplace, preview, preview, $enter$,`n,All
    GuiControl,4:, Viewp, %preview%
return

create:
    arraytest := {}
    Guicontrolget, View
    stringreplace, view, view,`n, $enter$, All
    GuiControlGet,predefajn
    stringreplace,predefajn,predefajn,A_space,,All
    Iniread, kontrol, %fullpre%, %predefajn%
    if view !=
        if predefajn !=
        if kontrol =
    {
        Iniwrite, %view%, %Fullpre%, %predefajn%
        
        
        
        IniRead, list, %fullpre%
        Stringreplace, list, list, `n, |, all
        GuiControl, , Mylistbox1, |
        GuiControl, , Mylistbox1, %list%
        
        Loop, parse, list, |
        {
            arraytest.push(A_loopfield)
                Gui +LastFound
            ;GuiControl, Choose, ListBox1, %A_index%
            IniRead, preview, %Fullpre%,%A_loopfield%,
                stringreplace, preview, preview, $enter$,`n,All
            GuiControl,4:, Viewp, %preview%
        }
        
    }
    else
    {
        msgbox, This predefine already exists
    }
return

ok:
    IniRead, list, %fullpre%
    Stringreplace, list, list, `n, |, all
    loop, parse, list, |
    {
        Guicontrolget, search1
        if A_loopfield = %search1%
        {
            Gui +LastFound
            GuiControl, Choose, ListBox1, %A_index%
            IniRead, preview, %Fullpre%,%A_loopfield%,
                stringreplace, preview, preview, $enter$,`n,All
            GuiControl,4:, Viewp, %preview%
            
        }
    }
    
~+*::
    clipstore = %clipboardall%
    clipboard =
    sleep, 20
    input, pred, I V L20, {space},
    loop
    {
        test := arraytest[A_index]
        if test := pred
        {
            
            testLength := StrLen(pred) + 2
            Iniread, pred0, %fullpre%, %pred%
            sleep, 20
            if pred0 !=
            {
                sendinput,{backspace %testlength%}
                stringreplace, pred0, pred0, $enter$, `n,All
                ifWinActive, ahk_class RemoteToolsFrame
                {
                    sendinput, %pred0%
                    return
                }
                IfWinactive, ahk_class ConsoleWindowClass
                {
                    Sendinput, %pred0%
                    return 
                }
                else
                {
                    clipboard = %pred0%
                    send ^v
                    sleep, 500
                    clipboard = %clipstore%
                    clipstore =
                    return
                }
                
                
                
            }
            return
            
        }
        else
            break
    }
return

~;::
clipstore = %clipboardall%
clipboard =
sleep, 20
input, pred, I V L20, {space},
loop
{
    test := arraytest[A_index]
    if test := pred
    {
        
        testLength := StrLen(pred) + 2
        Iniread, pred0, %fullpre%, %pred%
        sleep, 20
        if pred0 !=
        {
            sendinput,{backspace %testlength%}
            stringreplace, pred0, pred0, $enter$, `n,All
            ifWinActive, ahk_class RemoteToolsFrame
            {
                sendinput, %pred0%
                return
            }
            IfWinactive, ahk_class ConsoleWindowClass
            {
                Sendinput, %pred0%
                return 
            }
            else
            {
                clipboard = %pred0%
                send ^v
                sleep, 500
                clipboard = %clipstore%
                clipstore =
                return
            }
            
            
            
        }
        return
        
    }
    else
        break
}
return

modifybutton:
    GuiControlGet, ListBox1
    Guicontrolget, viewp
    StringReplace, viewp, viewp,`n,$enter$,All  
    
    IniDelete, %Fullpre%, %listbox1%, 
    
    Iniwrite, %viewp%, %Fullpre%, %listbox1%
    StringReplace, viewp, viewp,$enter$, `n,All
    msgbox, predefined modified to: `n`n%viewp%
return

deletebutton:
    GuiControlGet, ListBox1
    IniDelete, %Fullpre%, %listbox1%, 
    IniRead, list, %fullpre%
    Stringreplace, list, list, `n, |, all
    GuiControl, , Mylistbox1, |
    GuiControl,, mylistbox1, %list%
    guicontrol,, viewp,
    
return

;------------------------------------------------------------------MACROS----------------------------------------------------------------------

mcreate:
    arraymacro := {}
    Guicontrolget, view2
    GuiControlGet,makros
    Iniread, mkontrol, %macropre%, %makros%
    if view2 !=
        if makros !=
        if mkontrol =
    {
        stringreplace,view2, view2, `n, $enter$, All
        Iniwrite, %view2%, %macropre%, %makros%,
        
        IniRead, lmacro, %macropre%
        Stringreplace, lmacro2, lmacro, `n, |, all
        GuiControl, , mylistboxmacro, |
        GuiControl, , mylistboxmacro, %lmacro2%
        
        Loop, parse, lmacro2, |
        {
            arraymacro.push(A_loopfield)
                Gui +LastFound
            ;GuiControl, Choose, mylistboxmacro, %A_index%
            IniRead, preview2, %macropre%,%A_loopfield%,
                stringreplace, preview2, preview2, $enter$,`n,All
            GuiControl,4:, viewp2, %preview2%
        }
        
    }
    else
    {
        msgbox, This macro shortcut already exists
    }
return

~.::
    Nrvarmacro := nrshortarray[countchange]
    nrvarmacro1 := nrvarmacro - 1
    nrvarmacro2 := nrvarmacro - 2
    nrvarmacro3 := nrvarmacro - 3
    nrvarmacro4 := nrvarmacro - 4
    nrvarmacro5 := nrvarmacro - 5
    nrvarmacro6 := nrvarmacro - 6
    nrvarmacro7 := nrvarmacro - 7
    nrvarmacro8 := nrvarmacro - 8
    nrvarmacro9 := nrvarmacro - 9
    
    clip0 := Mainarray[countchange]
    clip1 := mainarray[countchange - nrvarmacro1]
    clip2 := mainarray[countchange - nrvarmacro2]
    clip3 := mainarray[countchange - nrvarmacro3]
    clip4 := mainarray[countchange - nrvarmacro4]
    clip5 := mainarray[countchange - nrvarmacro5]
    clip6 := mainarray[countchange - nrvarmacro6]
    clip7 := mainarray[countchange - nrvarmacro7]
    clip8 := mainarray[countchange - nrvarmacro8]
    clip9 := mainarray[countchange - nrvarmacro9]
    arraylines := []
    fullmacro :=
    loop
    {
        input, mark, I V L20, {space}
        test := arraymacro[A_index],
        if test := mark
        {
            testLength := StrLen(mark) + 2
            Iniread, markmacro, %macropre%, %mark%,
            if markmacro !=
            {
                StringReplace, markmacro, markmacro,$enter$,`n,All
                stringreplace, markmacro, markmacro, clip0, %clip0%, All	
                stringreplace, markmacro, markmacro, clip1, %clip1%, All
                stringreplace, markmacro, markmacro, clip2, %clip2%, All
                stringreplace, markmacro, markmacro, clip3, %clip3%, All
                stringreplace, markmacro, markmacro, clip4, %clip4%, All
                stringreplace, markmacro, markmacro, clip5, %clip5%, All
                stringreplace, markmacro, markmacro, clip6, %clip6%, All
                stringreplace, markmacro, markmacro, clip7, %clip7%, All
                stringreplace, markmacro, markmacro, clip8, %clip8%, All
                stringreplace, markmacro, markmacro, clip9, %clip9%, All
                
               sendinput,{backspace %testlength%}
               clipboard = %markmacro%
               ClipWait, [2, 1]
               send ^v
            }
            return
        }
        else
        {
            break
        }
    }
    
return

deletebutton2:
    GuiControlGet, ListBox2
    IniDelete, %macropre%, %listbox2%, 
    IniRead, lmacro2, %macropre%
    Stringreplace, lmacro2, lmacro2, `n, |, all
    GuiControl,4:, Mylistboxmacro, |
    GuiControl,4:, mylistboxmacro, %lmacro2%
    guicontrol,4:, viewp2,
return

modifybutton2:
    GuiControlGet, ListBox2
    Guicontrolget, viewp2
    
    IniDelete, %macropre%, %listbox2%, 
    stringreplace,viewp2, viewp2, !,{!}
    stringreplace,viewp2, viewp2, `n,$enter$,All
    Iniwrite, %viewp2%, %macropre%, %listbox2%
    
    msgbox, environemntal predefine modified to: `n`n%viewp2%
return

mylistboxmacro:
    if A_GuiEvent <> click
        GuiControlGet, mylistboxmacro 
    IniRead, preview2, %macropre%,%mylistboxmacro%,
    stringreplace, preview2, preview2, $enter$,`n,All
    GuiControl,4:, viewp2, %preview2%
return
return

ok2:
    IniRead, lmacro2, %macropre%
    Stringreplace, lmacro2, lmacro2, `n, |, all
    loop, parse, lmacro2, |
    {
        Guicontrolget, search2
        if A_loopfield = %search2%
        {
            Gui +LastFound
            GuiControl, Choose, mylistboxmacro, %A_index%
            IniRead, preview2, %macropre%,%A_loopfield%,
                stringreplace, preview2, preview2, $enter$,`n,All
            GuiControl,4:, viewp2, %preview2%
            
        }
    }
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MAils;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~+@::
    
    Nrvarmacro := nrshortarray[countchange]
    nrvarmacro1 := nrvarmacro - 1
    nrvarmacro2 := nrvarmacro - 2
    nrvarmacro3 := nrvarmacro - 3
    nrvarmacro4 := nrvarmacro - 4
    nrvarmacro5 := nrvarmacro - 5
    nrvarmacro6 := nrvarmacro - 6
    nrvarmacro7 := nrvarmacro - 7
    nrvarmacro8 := nrvarmacro - 8
    nrvarmacro9 := nrvarmacro - 9
    clip0 := Mainarray[countchange]
    clip1 := mainarray[countchange - nrvarmacro1]
    clip2 := mainarray[countchange - nrvarmacro2]
    clip3 := mainarray[countchange - nrvarmacro3]
    clip4 := mainarray[countchange - nrvarmacro4]
    clip5 := mainarray[countchange - nrvarmacro5]
    clip6 := mainarray[countchange - nrvarmacro6]
    clip7 := mainarray[countchange - nrvarmacro7]
    clip8 := mainarray[countchange - nrvarmacro8]
    clip9 := mainarray[countchange - nrvarmacro9]
    
    input, xmailx, V T5 L20, {space},
    loop
    {
        test := arraymails[A_index]
        if test := xmailx
        {
            testLength := StrLen(pred) + 2
            Iniread, controlmail, %fmailini%, %xmailx%
            if controlmail !=
            {
                sendinput,{backspace %testlength%}
                IniRead, mailto, %fmailini%,%xmailx%, to
                iniread, mailcc, %fmailini%, %xmailx%, cc
                iniread, mailbcc, %fmailini%, %xmailx%, bcc
                iniread, mailsubject, %fmailini%, %xmailx%, subject
                iniread, mailbody, %fmailini%, %xmailx%, mailbody
                stringreplace, mailbody, mailbody, $enter$,`n,All
                stringreplace, mailbody, mailbody, clip1, %clip1%, All
                stringreplace, mailbody, mailbody, clip2, %clip2%, All
                stringreplace, mailbody, mailbody, clip3, %clip3%, All
                stringreplace, mailbody, mailbody, clip4, %clip4%, All
                stringreplace, mailbody, mailbody, clip5, %clip5%, All
                stringreplace, mailbody, mailbody, clip6, %clip6%, All
                stringreplace, mailbody, mailbody, clip7, %clip7%, All
                stringreplace, mailbody, mailbody, clip8, %clip8%, All
                stringreplace, mailbody, mailbody, clip9, %clip9%, All
                stringreplace, mailbody, mailbody, clip0, %clip0%, All
                
                stringreplace, mailto, mailto, clip1, %clip1%, All
                stringreplace, mailto, mailto, clip2, %clip2%, All
                stringreplace, mailto, mailto, clip3, %clip3%, All
                stringreplace, mailto, mailto, clip4, %clip4%, All
                stringreplace, mailto, mailto, clip5, %clip5%, All
                stringreplace, mailto, mailto, clip6, %clip6%, All
                stringreplace, mailto, mailto, clip7, %clip7%, All
                stringreplace, mailto, mailto, clip8, %clip8%, All
                stringreplace, mailto, mailto, clip9, %clip9%, All
                stringreplace, mailto, mailto, clip0, %clip0%, All
                
                stringreplace, mailcc, mailcc, clip1, %clip1%, All
                stringreplace, mailcc, mailcc, clip2, %clip2%, All
                stringreplace, mailcc, mailcc, clip3, %clip3%, All
                stringreplace, mailcc, mailcc, clip4, %clip4%, All
                stringreplace, mailcc, mailcc, clip5, %clip5%, All
                stringreplace, mailcc, mailcc, clip6, %clip6%, All
                stringreplace, mailcc, mailcc, clip7, %clip7%, All
                stringreplace, mailcc, mailcc, clip8, %clip8%, All
                stringreplace, mailcc, mailcc, clip9, %clip9%, All
                stringreplace, mailto, mailto, clip0, %clip0%, All
                
                stringreplace, mailbcc, mailbcc, clip1, %clip1%, All
                stringreplace, mailbcc, mailbcc, clip2, %clip2%, All
                stringreplace, mailbcc, mailbcc, clip3, %clip3%, All
                stringreplace, mailbcc, mailbcc, clip4, %clip4%, All
                stringreplace, mailbcc, mailbcc, clip5, %clip5%, All
                stringreplace, mailbcc, mailbcc, clip6, %clip6%, All
                stringreplace, mailbcc, mailbcc, clip7, %clip7%, All
                stringreplace, mailbcc, mailbcc, clip8, %clip8%, All
                stringreplace, mailbcc, mailbcc, clip9, %clip9%, All
                stringreplace, mailbcc, mailbcc, clip0, %clip0%, All
                
                stringreplace, mailsubject, mailsubject, clip1, %clip1%, All
                stringreplace, mailsubject, mailsubject, clip2, %clip2%, All
                stringreplace, mailsubject, mailsubject, clip3, %clip3%, All
                stringreplace, mailsubject, mailsubject, clip4, %clip4%, All
                stringreplace, mailsubject, mailsubject, clip5, %clip5%, All
                stringreplace, mailsubject, mailsubject, clip6, %clip6%, All
                stringreplace, mailsubject, mailsubject, clip7, %clip7%, All
                stringreplace, mailsubject, mailsubject, clip8, %clip8%, All
                stringreplace, mailsubject, mailsubject, clip9, %clip9%, All
                stringreplace, mailsubject, mailsubject, clip0, %clip0%, All
                
                try
                {
                    tomApp := ComObjActive("Outlook.Application")
                    tomMailItem := tomApp.CreateItem(0) ;  tomMailItem := 0
                    tomMailItem.display
                    tomMailItem.TO := mailto
                    tomMailItem.CC :=  mailcc
                    tomMailItem.bcc := mailbcc
                    tomMailItem.Subject := mailsubject
                    tomMailItem.body := mailbody
                    
                }
                catch e
                {
                    msgbox, please open outlook `nor close any outlook'error messages to use this function
                    
                }
                
            }
            
            return
        }
        else
            break
    }
return

mailcreate:
    guicontrolget, mailto
    guicontrolget, mailcc
    guicontrolget, mailbcc
    guicontrolget, mailsubject
    guicontrolget, mailbody
    guicontrolget, mcreation
    Iniread, mailcontrol, %fmailini%, %mcreation%
    if mkontrol =
        if mcreation !=
    {
        stringreplace,mailbody, mailbody, !, {!}
        stringreplace,mailbody, mailbody, `n, $enter$, All
        
        
        Iniwrite, %mailto%, %fmailini%, %mcreation%, to
        Iniwrite, %mailcc%, %fmailini%, %mcreation%, cc
        Iniwrite, %mailbcc%, %fmailini%, %mcreation%, bcc
        Iniwrite, %mailsubject%, %fmailini%, %mcreation%, subject
        Iniwrite, %mailbody%, %fmailini%, %mcreation%, mailbody 
        
        Iniread, listmail, %fmailini%
        Stringreplace, listmail, listmail, `n, |, all
        GuiControl, , mylistboxmail, |
        GuiControl, , mylistboxmail, %listmail%
        
        Loop, parse, listmail, |
        {
            arraymails.push(A_loopfield)
                Gui +LastFound
            GuiControl, Choose, mylistboxmail, %A_index%
            IniRead, mailto2, %fmailini%,%A_loopfield%, to
                iniread, mailcc2, %fmailini%, %A_loopfield%, cc
                iniread, mailbcc2, %fmailini%, %A_loopfield%, bcc
                iniread, mailsubject, %fmailini%, %A_loopfield%, subject
                iniread, mailbody2, %fmailini%, %A_loopfield%, mailbody, 
                
            stringreplace, mailbody2, mailbody2, $enter$,`n,All
            GuiControl,4:, mailto, %mailto2%
            GuiControl,4:, mailcc, %mailcc2%
            GuiControl,4:, mailbcc, %mailbcc2%
            GuiControl,4:, mailsubect, %mailsubject2%
            GuiControl,4:, mailbody, %mailbody2%
        }
        
    }
    else
    {
        msgbox, this mail shortcut already exists
    }
return

return
mailmodify:
    GuiControlGet, MyListBoxmail 
    guicontrolget, mailto
    guicontrolget, mailcc
    guicontrolget, mailbcc
    guicontrolget, mailsubject
    guicontrolget, mailbody
    guicontrolget, mcreation
    StringReplace, mailbody, mailbody,`n,$enter$,All  
    
    IniDelete, %fmailini%, %mylistboxmail%, 
    
    Iniwrite, %mailto%, %fmailini%, %mcreation%, to
    Iniwrite, %mailcc%, %fmailini%, %mcreation%, cc
    Iniwrite, %mailbcc%, %fmailini%, %mcreation%, bcc
    Iniwrite, %mailsubject%, %fmailini%, %mcreation%, subject
    Iniwrite, %mailbody%, %fmailini%, %mcreation%, mailbody 
    
    msgbox, your mail template was successfully modified
return

maildelete:
    GuiControlGet, MyListBoxmail 
    IniDelete, %fmailini%, %mylistboxmail%, 
    IniRead, list, %fmailini%
    Stringreplace, list, list, `n, |, all
    GuiControl,, Mylistboxmail, |
    GuiControl,, mylistboxmail, %list%
    guicontrol,, mailto,
    guicontrol,, mailcc,
    guicontrol,, mailbcc,
    guicontrol,, mailsubject,
    guicontrol,, mailbody,
    guicontrol,, mcreation,
    msgbox, Mail template deletion success
return

mylistboxmail:
    if A_GuiEvent <> click
        GuiControlGet, MyListBoxmail 
    iniread, mailto, %fmailini%, %mylistboxmail%, to
    iniread, mailcc, %fmailini%, %mylistboxmail%, cc
    iniread, mailbcc, %fmailini%, %mylistboxmail%, bcc
    iniread, mailsubject, %fmailini%, %mylistboxmail%, subject
    iniread, mailbody, %fmailini%, %mylistboxmail%, mailbody 
    stringreplace, mailbody, mailbody, $enter$,`n,All
    GuiControl,4:, mailto, %mailto%
    GuiControl,4:, mailcc, %mailcc%
    GuiControl,4:, mailbcc, %mailbcc%
    GuiControl,4:, mailsubject, %mailsubject%
    GuiControl,4:, mailbody, %mailbody%
    Guicontrol,4:, mcreation, %mylistboxmail%
return
okmail:
return

fmail:
    
    
return

;--------------------------------------------------------functions functions---------------------------------------------------

split:
    countcontrol = 0
    splitvar := Mainarray[countchange]
    StringReplace, splitvar, splitvar, `r,,All
    loop, parse, splitvar, `n
    {
        sleep, 20
        splitobj := A_loopfield
        if splitobj !=
        {
            counttotal := counttotal + 1
            countcontrol := countcontrol + 1
            countchange := countchange + 1
            countdelete := countchange + 1
            countminus := countchange + 1
            count2 := counttotal - 1
            count1 := count2 - 1
            
            Mainarray.push(splitobj)
            shortclip := substr(splitobj, 1, 60)
            StringReplace, shortclip, shortclip, `r`n,,All
            shortarray.push(shortclip)
            Nrshortarray.push(countcontrol)
            Nrvar1 := Nrshortarray[counttotal]
            Nrvar2 := Nrshortarray[count1]
            Nrvar3 := Nrshortarray[count2]
            nrvarminus := Nrarray[countminus]
            linevar1 := shortarray[counttotal]
            linevar2 := shortarray[count1]
            linevar3 := shortarray[count2]
            
            Guicontrol, 2: ,Textmain, %linevar1%
            Guicontrol, 1: ,TextMain, %nrvar1%.%linevar1%
            Guicontrol, 1: ,Text1, %nrvar2%.%linevar2%
            Guicontrol, 1: ,Text2, %nrvar3%.%linevar3%
            Guicontrol, 1: ,Text4, 
        }
        
        
    }
    countcontrol = 0
    
    
return

;---------------------------------------------------------Functions controls----------------------------------------------------------- */

fcopy:
    gui, font, bold cyellow
    GuiControl, Font, Textmain
    
    
    countchange := counttotal
    clipboard :=
    
    
    Send ^c
    clipwait, 2, 1
    
    
    if clipboard !=
    {
        loop, 1
        {
            counttotal := counttotal + 1
            countcontrol := countcontrol + 1
            countchange := countchange + 1
            countdelete := countchange + 1
            countminus := countchange + 1
            count2 := counttotal - 1
            count1 := count2 - 1
        }
        clip1 := clipboard
        Mainarray.push(clip1)
        
        shortclip := substr(clip1, 1, 60)
        shortclip:=RegExReplace(shortclip,"^\R|\R>\d*$")
        shortclip:=RegExReplace(shortclip, "\R+\R", "`r`n") 
        
        
        
        shortarray.push(shortclip)
        Nrshortarray.push(countcontrol)
        
        
        
        
        
        Nrvar1 := Nrshortarray[counttotal]
        Nrvar2 := Nrshortarray[count1]
        Nrvar3 := Nrshortarray[count2]
        nrvarminus := Nrarray[countminus]
        linevar1 := shortarray[counttotal]
        linevar2 := shortarray[count1]
        linevar3 := shortarray[count2]
        
        
        
        Guicontrol, 2: ,Textmain, %linevar1%
        Guicontrol, 1: ,TextMain, %nrvar1%.%linevar1%
        Guicontrol, 1: ,Text1, %nrvar2%.%linevar2%
        Guicontrol, 1: ,Text2, %nrvar3%.%linevar3%
        Guicontrol, 1: ,Text4, 
        sleep 10
        tooltip, %Nrvar1%. %linevar1%
        SetTimer, RemoveToolTip, -1000
        
        FileAppend,%ClipboardAll%,cyberfiles\clipboards\%counttotal%.clip,
        
        if onvar2 = false
        {
            fullview := mainarray[countchange]
            Guicontrol, 3:, view, %fullview%
        }
        
        
        clipchange = false
        return
    }
    else
    { 
        return
    }
    
    
    ;Delete;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Fdelete:
    sleep, 50
    gui, font, s8 cyellow bold
    GuiControl, Font, Textmain
    
    RemovedValue := Mainarray.RemoveAt(counttotal)
    RemovedValue := Nrshortarray.RemoveAt(counttotal)
    RemovedValue := shortarray.Removeat(counttotal)
    
    if countchange > 0
    {
        counttotal := counttotal - 1
        
        countchange := countchange - 1
        countminus := countchange + 1
        count2 := counttotal - 1
        count1 := count2 - 1
        
        if countcontrol > 0
            countcontrol := countcontrol - 1
        else
            countcontrol = 0
    }
    
    Nrvar1 := nrshortarray[countchange]
    Nrvar2 := nrshortarray[count1]
    Nrvar3 := nrshortarray[count2]
    Nrvarminus := nrshortarray[countminus]
    linevar1 := shortarray[countchange]
    linevar2 := shortarray[count1]
    linevar3 := shortarray[count2]
    linevarminus := shortarray[countminus]
    
    Guicontrol, 2: ,Textmain, %linevar1%
    Guicontrol, 1: ,TextMain, %nrvar1%.%linevar1%
    Guicontrol, 1: ,Text1, %nrvar2%.%linevar2%
    Guicontrol, 1: ,Text2, %nrvar3%.%linevar3%
    Guicontrol, 1: ,Text4, 
    
    Guicontrol, 3:, view, %fullview%
    
    tooltip, %Nrvar1%. "%linevar1%"
    SetTimer, RemoveToolTip, -1000
    
    
return

;upupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupup
Fup:
    gui, font, cYELLOW bold
    GuiControl, Font, Textmain
    if countchange > 1
    {
        countcontrol = 0
        
        Loop, 1
        {
            countchange := countchange - 1
            countdelete := countchange + 1
            countminus := countchange + 1
            count2 := countchange - 1
            count1 := count2 - 1	
            
            
        }
        
        
        sleep 50
        
        Nrvar1 := nrshortarray[countchange]
        Nrvar2 := nrshortarray[count1]
        Nrvar3 := nrshortarray[count2]
        Nrvarminus := nrshortarray[countminus]
        linevar1 := shortarray[countchange]
        linevar2 := shortarray[count1]
        linevar3 := shortarray[count2]
        linevarminus := shortarray[countminus]
        
        Guicontrol, 2: ,Textmain, %linevar1%
        Guicontrol, 1: ,TextMain, %nrvar1%.%linevar1%
        Guicontrol, 1: ,Text1, %nrvar2%.%linevar2%
        Guicontrol, 1: ,Text2, %nrvar3%.%linevar3%
        Guicontrol, 1: ,Text4, %nrvarminus%.%linevarminus%
        fullview := mainarray[countchange]
        Guicontrol, 3:, view, %fullview%
        
        tooltip, %Nrvar1%. "%linevar1%"
        SetTimer, RemoveToolTip, -1000
        return
    }
    else
    {
        return
    }
    
    ;downdowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndown
Fdown:
    gui, font, cyellow bold
    GuiControl, Font, Textmain
    countcontrol = 0
    if countchange < %counttotal%
        
    Loop, 1
    {
        countchange := countchange + 1
        countdelete := countchange + 1
        countminus := countchange + 1
        count2 := countchange - 1
        count1 := count2 - 1
    }
    
    
    sleep 50
    
    Nrvar1 := nrshortarray[countchange]
    Nrvar2 := nrshortarray[count1]
    Nrvar3 := nrshortarray[count2]
    nrvarminus := nrshortarray[countminus]
    linevar1 := shortarray[countchange]
    shortvar1 := shortshortarray[countchange]
    linevar2 := shortarray[count1]
    linevar3 := shortarray[count2]
    linevarminus := shortarray[countminus]
    
    
    Guicontrol, 2: ,Textmain, %linevar1%
    Guicontrol, 1: ,TextMain, %nrvar1%.%linevar1%
    Guicontrol, 1: ,Text1, %nrvar2%.%linevar2%
    Guicontrol, 1: ,Text2, %nrvar3%.%linevar3%
    
    Guicontrol, 1: ,Text4, %nrvarminus%.%linevarminus%
    fullview := mainarray[countchange]
    Guicontrol, 3:, view, %fullview%
    
    
    
    
    tooltip, %Nrvar1%. "%linevar1%"
    SetTimer, RemoveToolTip, -1000
return

;releaseall-------------------------------------------------------------------------------------------------------------

releaseall8:
    gui, font, s9 cRed bold
    GuiControl, Font, Textmain
    
    nrvarallview =
    linevarall =
    countcontrol = 0
    brelease = true
    Nrvar2 := Nrshortarray[countchange]
    Varstart := countchange - Nrvar2 + 1
    linevar0 := shortarray[varstart]
    
    varenter = `n
    
    
    loop, %Nrvar2%
    {
        linevarall%A_index% := mainarray[varstart]
        IfWinActive, ahk_class XLMAIN ahk_exe EXCEL.EXE
        {
            StringReplace,linevarall%A_index%,linevarall%A_index%,`n,,L
        }
        linevarall%A_index% .= varenter
        Nrvarall%A_index% := Nrshortarray[varstart]
        dot = ._
        Nrvarall%A_index% .= dot
        Nrvarall%A_index% .= linevarall%A_index%
        Nrvarall%A_index% := substr(Nrvarall%A_index%, 1, 150)
        Nrvarall%A_index% .= varenter
        Nrvarallview .= Nrvarall%A_index%
        linevarall .= linevarall%A_index%
        varstart++
    }
    CoordMode, tooltip,
    tooltip, %Nrvarallview%
    SetTimer, RemoveToolTip, -2000
    Settimer, release00, -2000
return

pasteClip2:	
    gui, font, s9 cRed bold
    GuiControl, Font, Textmain									
    countcontrol = 0
    linevar1 := Mainarray[countchange]
    if brelease = true
        clipboard = %linevarall%
    else
        FileRead,Clipboard,*c %clipboardsfile%\%countchange%.clip
    clipwait, 2, 1
    Send, ^v
return

release00:
    brelease = false
    Inidelete, %releaseini%, alllines
return

#if ctrlc
{
$^c::
    gosub, fcopy
return
}
#if
    

#if ridkeyboard
{
~Lbutton & wheelup::
    Gosub, Fup
return
~Lbutton & wheeldown::
    Gosub, Fdown
return
~$mbutton::
    gosub, fcopy
return
#If GetKeyState("LButton", "P")
RButton::
gosub, pasteclip2
return
~Lbutton & mbutton::
    gosub, releaseall8
return
}
#if
    

#if keyboardcontrol
{
$^Up::
    Gosub, Fup
return
$^down::
    Gosub, Fdown
return
^+space::
    Gosub, releaseall8
    gosub, pasteclip2
return
^space::
    Gosub, pasteClip2
return
}
#if
    

#if handchoice
{
^Lbutton::
    gosub, fcopy
return

$^wheelup::
    Gosub, Fup
return

$^wheeldown::
    Gosub, Fdown
return

$^mbutton::
    Gosub, releaseall8
return
$^Rbutton::
    Gosub, pasteClip2
return
}
#if
    

$^+backspace::
    Gosub, fdelete
return