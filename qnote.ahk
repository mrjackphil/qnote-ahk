Gui, Destroy
#SingleInstance, force

Gui, -Caption -ToolWindow +AlwaysOnTop +Resize
Gui, font, s16, Callibri
Gui, Add, Text,, Note
Gui, Add, Edit, W600 R15 vBodyText
Gui, Add, Text,, Filename
Gui, Add, Edit, vFilename, 

isDisplayed := false

^j::
if(!isDisplayed){
Gui, Show,,
isDisplayed := true
}else{
isDisplayed := false

Gui, Submit
if (BodyText == "") {
	return
}

if (Filename == "") {
	FormatTime, CurrentDateTime,, yyMMddHHmmss
	FileAppend, %BodyText%, .\%CurrentDateTime%.md, UTF-8-RAW
	FileAppend, `n#qnote, .\%CurrentDateTime%.md, UTF-8-RAW
} else {
	FileAppend, %BodyText%, .\%Filename%.md, UTF-8-RAW
	FileAppend, `n#qnote, .\%Filename%.md, UTF-8-RAW
}

GuiControl,, BodyText, 

Gui, Hide
return
}

return
