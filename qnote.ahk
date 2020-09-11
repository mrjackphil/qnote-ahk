#SingleInstance, force

Gui, -Caption -ToolWindow +AlwaysOnTop +Resize
Gui, font, s16, Callibri
Gui, Add, Text,, Note
Gui, Add, Edit, W600 R15 vBodyText
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
	FileAppend, `n%BodyText%, .\%CurrentDateTime%.md, UTF-8
	FileAppend, `n#qnote, .\%CurrentDateTime%.md, UTF-8
} else {
	FileAppend, `n%BodyText%, .\%Filename%.md, UTF-8
	FileAppend, `n#qnote, .\%Filename%.md, UTF-8
}

GuiControl,, BodyText, 

Gui, Hide
return
