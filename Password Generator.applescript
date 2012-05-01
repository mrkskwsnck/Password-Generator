(* Simple GUI Password Generator for Mac *)

property allowedCharacters : {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122}
property givenPasswordLength : 8

repeat while true
	try
		display dialog "Wanted password length?" with title "Password Generator" default answer givenPasswordLength
		set givenPasswordLength to text returned of result
		givenPasswordLength as integer
		exit repeat
	on error number -1700
		-- Repeat again on coercion error
	end try
end repeat

repeat while true
	try
		set generatedPassword to generatePassword()
		display dialog "New generated password:" with title "Password Generator" default answer generatedPassword buttons {"New", "OK"} default button "New" cancel button "OK"
	on error number -128
		exit repeat
	end try
end repeat

on generatePassword()
	set generatedPassword to ""
	repeat givenPasswordLength times
		set randomCharacterPosition to random number from 1 to count allowedCharacters
		set generatedPassword to generatedPassword & (ASCII character item randomCharacterPosition of allowedCharacters)
	end repeat
	return generatedPassword
end generatePassword

(* EOF *)
