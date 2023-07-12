# Made by 0x85EAF00D
# Tested on macOS 10.14
# v 1.0.0

# get number of URLs
tell application "TextEdit"
	activate
	set par1 to (get paragraph 1 of text of first document) # gets number of tabs
	set tabcount to (text 1 thru -7 of par1) as integer # parses number of tabs to a integer
end tell

# opens chrome where URLs will be entered
tell application "Google Chrome"
	make new window # opens a new chrome instance for urls
	activate
end tell

# copy URLs to the new Chrome window
tell application "TextEdit"
	activate
	delay 0.1
	set parcount to 3 # start paragraph parsing on first url line
	repeat (tabcount - 1) times # loop through all tabs but last
		
		set URLpara to (get paragraph (parcount) of text of first document) # set URLpara to the next paragraph
		set the clipboard to URLpara as text # copy URLpara to clipboard
		delay 1
		tell application "Google Chrome"
			activate
			tell application "System Events" # paste url and return, create new tab for next url
				keystroke "v" using command down
				keystroke return
				keystroke "t" using command down
			end tell
		end tell
		set parcount to (parcount + 2) # add 2 to get next url paragraph
	end repeat
end tell

# copy last URL to the new Chrome window
tell application "TextEdit"
	delay 0.1
	set URLpara to (get paragraph (parcount) of text of first document) # set URLpara to the next paragraph
	set the clipboard to URLpara as text # copy URLpara to clipboard
	delay 1
	tell application "Google Chrome"
		activate
		tell application "System Events" # paste url and return
			keystroke "v" using command down
			keystroke return
		end tell
	end tell
end tell


