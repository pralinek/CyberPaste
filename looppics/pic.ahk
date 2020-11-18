Pics := []
; Find some pictures to display.
Loop, Files, %A_scriptDir%
{
    ; Load each picture and add it to the array.
    Pics.Push(LoadPicture(A_LoopFileFullPath))
}
if !Pics.Length()
{
    ; If this happens, edit the path on the Loop line above.
    MsgBox, No pictures found!  Try a different directory.
    ExitApp
}
; Add the picture control, preserving the aspect ratio of the first picture.
Gui, Add, Pic, w600 h-1 vPic +Border, % "HBITMAP:*" Pics.1
Gui, Show
Loop 
{
    ; Switch pictures!
    GuiControl, , Pic, % "HBITMAP:*" Pics[Mod(A_Index, Pics.Length())+1]
    Sleep 3000
}
return
GuiClose:
GuiEscape:


Loop, Files, %A_scriptDir%
{
    ; Load each picture and add it to the array.
    Pics.Push(LoadPicture(A_LoopFileFullPath))
}


ExitApp