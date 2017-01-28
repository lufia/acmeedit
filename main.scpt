on main(argv)
	set editor to path to resource "Scripts/acmeedit.bash"
	set text item delimiters of AppleScript to space
	try
		do shell script quoted form of POSIX path of editor & space & argv & " &>/dev/null &"
	end try
	return text item delimiters
end main

on open argv
	set v to {}
	repeat with i in argv
		set end of v to quoted form of POSIX path of i
	end repeat
	main(v)
end open

on run
	tell application "Finder"
		set dir to home as alias
	end tell
	main(quoted form of POSIX path of dir)
end run
