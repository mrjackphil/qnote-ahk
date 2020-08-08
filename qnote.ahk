#SingleInstance, force

Gui, -Caption -ToolWindow +AlwaysOnTop +Resize
Gui, Add, Text,, Note
Gui, Add, Edit, W600 R20 vBodyText
Gui, Add, Text,, Filename
Gui, Add, Edit, vFilename, 

^j::
Gui, Show,,
return

^k::
Gui, Submit
if (BodyText == "") {
	return
}

if (Filename == "") {
	FormatTime, CurrentDateTime,, yyMMddHHmmss
	FileAppend, `n%BodyText%, .\%CurrentDateTime%.md
	FileAppend, `n#qnote, .\%CurrentDateTime%.md
} else {
	FileAppend, `n%BodyText%, .\%Filename%.md
	FileAppend, `n#qnote, .\%Filename%.md
}

GuiControl,, BodyText, 

Gui, Hide
return
