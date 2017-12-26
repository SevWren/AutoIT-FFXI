#comments-start
=============================== WARNING ===============================
AUTOIT REQUIRES YOU TO ALWAYS HAVE FFXI VISIBLE ON YOUR SCREEN WHILE
RUNNING THE SCRIPT.  IF FFXI IS MINIMIZED, BEHIND A DIFFERENT PROGRAM,
OR NOT AT THE EXACT CORDINATES DESIGNATED IN THE SCRIPT, THE SCRIPT
WILL NOT FUNCTION CORRECTLY,  OR IF SCRIPT IS RUNNING WITHOUT FFXI
NOT VISIBLE ON THE SCREEN, CURRENTLY YOU WILL HAVE ALL THE KEY PRESSES
INVOLVED IN CATCHING A FISH SENT TO THE WINDOW THAT IS COVERING FFXI.
=============================== WARNING ===============================


***********************************************************************
I recently decided to continue this project as an individual showed
interest. (Dec 26, 2017).  There are more pro's than con's when using
a scripting language relying on color based detection on screen to
determine what actions the script should take.  However on a private
server, there are more pro's that come into play as other fishing
scripts use technology to detect/catch/release fish, that private
servers change, rendering most of the 'advanced' lua / ffxi memory
access / packet extraction / injection techniques to break.  With the
very limited number of working scripts out there even for retail,
there are none as of today that out of the box work with private 
servers that almost, if not all, use the Ashita Program to connect.
***********************************************************************
In addition to private server differences, there are almost 
no coders that are willing to put in additional time required to update
their automatic fishing solution on a different scripting language.  
Also fishing just recently started to grow on private servers that
I know of, which limits ppl willing to do all of the above.
***********************************************************************

***********************************************************************


#comments-end


Opt("MouseClickDelay", 200) ;10 milliseconds
Opt("MouseClickDownDelay", 200) ;10 milliseconds
Opt("MouseClickDragDelay", 2500) ;250 milliseconds
HotKeySet("{ESC}", "_exit")
;~ HotKeySet("{NUMPADADD}", "TogglePause")
Global $iCheckSum = PixelChecksum(753, 408,818, 447)
Global $ffxihandle = "0x00090274"
Global $white = "0xFFFFFF"
Global $green = "0xA0FF47"
Global $readytocatch = "0x797A7C"
while 1 = 1
	Local $text1 = PixelGetColor (109, 742,$ffxihandle) ;first check if caught = white
	Local $text2 = PixelGetColor(311, 741,$ffxihandle) ;2nd check if caught = white
	Local $text3 = PixelGetColor(330, 741,$ffxihandle) ;3rd check of caught = green
	if $text1 = $white Then
		if $text2 = $white Then
			if $text3 <> $green Then
		_showffxi()
		    EndIf
		EndIf
	EndIf
	sleep(1000)
;~ 	Local $text4 = PixelGetColor(624,158,$ffxihandle)
	Global $text4 = PixelSearch (624,625,158,159,$readytocatch,0,0,$ffxihandle)
	If Not @error Then
    _reelinfish()
	EndIf

	if $text4 = $readytocatch Then
		_reelinfish()
	EndIf
sleep(450)
WEnd


Func _showffxi()
WinActivate("title of ashita while logged in here")
;~ Exit
EndFunc

func _reelinfish()
	sleep(2000)
Send("{ENTER}")
sleep(7000)
EndFunc


Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(4500)
        ToolTip('Script is "Paused"',0,0)
		WEnd
    ToolTip("")
EndFunc
