# Made by 0x85EAF00D
# Tested on macOS 10.14
# v 1.0.2

# enter a file name in a text box
set fileName to the text returned of (display dialog Â
	"Enter File name:" default answer "A name without spaces is recommended, no extensions needed") as text

# get tab count of current front window
tell application "Google Chrome"
	activate
	delay 0.1
	
	# get current window id of chrome window and save as an integer
	set myid to (get id of first window whose visible is true) as integer
	
	# count the number of tabs in the current window and save under tabcount
	set tabcount to number of tabs of window id myid
	
end tell

# Save tabs counts
set the clipboard to tabcount as text

# open current textedit window
tell application "TextEdit"
	
	activate
	make new document
	delay 0.1
	
	# save current tabs as number text
	tell application "System Events"
		keystroke "v" using command down
		
		keystroke " "
		keystroke "T"
		keystroke "A"
		keystroke "B"
		keystroke "S"
		
		keystroke return
		keystroke return
	end tell
	
end tell




# loop through all tabs
repeat tabcount times
	
	#open current chrome window
	tell application "Google Chrome"
		activate
		delay 0.1
		
		# set the URL of current tab to the clipboard
		set the clipboard to URL of active tab of front window as text
		
		# close the tab
		tell application "System Events"
			keystroke "w" using command down
		end tell
		
	end tell
	
	#open current texedit window
	tell application "TextEdit"
		activate
		delay 0.1
		
		#paste url and return twice
		tell application "System Events"
			keystroke "v" using command down
			keystroke return
			keystroke return
		end tell
		
	end tell
	
end repeat

# saves the text file
tell application "TextEdit"
	activate
	tell application "System Events"
		keystroke "s" using command down
		set the clipboard to fileName
		keystroke "v" using command down
	end tell
end tell