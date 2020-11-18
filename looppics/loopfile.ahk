#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%


Loop,
{
sleep, 300
x :=    
Loop, Files, %A_scriptDir%\*, R
{
    x := A_index
}   
     
    if (y!=""&&x!=y){
        msgbox, "dupa"
    }
    y = %x%
}

OnClipboardChange("ClipChanged")
return

ClipChanged() {
    ToolTip Clipboard data type: %Type%
    Sleep 1000
    ToolTip  ; Turn off the tip.
}