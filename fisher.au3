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
This is the most current version I personally used before doing a 
hotfix to a windower script.  I intend to make this one ultimately
be able to either configure itself or have the end user be given
easy walkthrough steps to tweak it to how their individual pc display
is setup.
***********************************************************************


#comments-end





HotKeySet("+d", "_exit")
Global $ffxihandle = "0x006E02A6"
Global $leftwhite = "0xF3F8FE"
Global $rightwhite = "0xF3F8FE"
Global $white = "0xFFFFFF"
Global $gold = "0xFFBC4F"
Global $drainedorange = "0xFF9898" ;orange color in stamina bar
Global $drainedcolor = "0x726643" ; color at 624, 165 after drained
Global $drainedloc[2] = [624, 165]
Global $hasstam = "0xFF9B9B"
Global $drainedcolor = "0x726643" ; color at 624, 165 after drained
Global $drainedloc[2] = [624, 165]
Global $SciTE = "[Class:SciTEWindow]"
Global $ffxi = "[Class:FFXiClass]"
Global $intown = InputBox("","Inside town 1 outside down 0","","","","",5,5)
Global $releasemonster = InputBox("","1 to release monster","","","","",5,5)
WinSetState($SciTE,"",@SW_MINIMIZE)

while 1 = 1
		_detectleft()
		_detectright()
	if $intown = 1 Then
		_detectdrained()
	EndIf
     if $releasemonster = 1 Then
		 _detectmonster()
	 EndIf
WEnd



Func _detectleft()
	Local $text4 = PixelSearch (385,325,383,310,$leftwhite,2,0,$ffxihandle)
	If Not @error Then
		WinActivate($ffxihandle)
		_catchleft()
	EndIf

	Local $text3 = PixelSearch (360,325,390,310,$gold,2,0,$ffxihandle)
	If Not @error Then
		WinActivate($ffxihandle)
		_catchleft()
	EndIf
EndFunc

func _detectright()
	Local $text4 = PixelSearch (975, 270,979, 275,$rightwhite,2,0,$ffxihandle)
		If Not @error Then
		;WinActivate($ffxihandle)
			_catchright()
		EndIf
	Local $text3 = PixelSearch (975, 270,979, 275,$gold,2,0,$ffxihandle)
	If Not @error Then
		_catchright()
	EndIf
EndFunc


func _detectdrained() ;detect fish stamina drained
Local $text6 = PixelSearch (624, 165,624, 165,$drainedcolor,2,0,$ffxihandle)
	If Not @error Then
		Local $text6 = PixelSearch (626, 164,626, 164,$hasstam,1,0,$ffxihandle)
			if @error Then
				_realin()
			EndIf
	EndIf
EndFunc


func _catchleft()
sleep(50)
WinWaitActive($ffxi,"")
send("a")
EndFunc

func _catchright()
Sleep(50)
WinWaitActive($ffxi,"")
send("d")
EndFunc

func _realin()
WinWaitActive($ffxi,"")
Sleep(200)
	send("{ENTER}")
	sleep(200)
EndFunc


func _detectmonster() ;detect 3 !!! in chat and send escape if detected.  do not use with a lure bait

Local $text6 = PixelSearch (332, 731,334, 729,$white,2,0,$ffxihandle)
	if Not @error Then
	 Local $text7 = PixelSearch (325, 731,327, 728,$white,2,0,$ffxihandle)
		if Not @error Then
			WinWaitActive($ffxi,"")
			Local $text8 = PixelSearch (339, 729,341, 728,$white,2,0,$ffxihandle)
				if Not @error Then
					WinWaitActive($ffxi,"")
					Send("{ESC}")
				EndIf
		EndIf
	EndIf

EndFunc

func _exit()
Exit
EndFunc

#cs
gold colors
0xFFBC4F
0xD49876
0xFFBC4F
0xFFF69A
0xFFBC4B
#ce
