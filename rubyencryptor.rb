class Encryptor
	#def cipher
	{"a" => "n","b" => "o","c" => "p","d" => "q",
	 "e" => "r","f" => "s","g" => "t","h" => "u",
	 "i" => "v","j" => "w","k" => "x","l" => "y",
	 "m" => "z","n" => "a","o" => "b","p" => "c",
	 "q" => "d","r" => "e","s" => "f","t" => "g",
	 "u" => "h","v" => "i","w" => "j","x" => "k",
	 "y" => "l","z" => "m"," " => "*"}
	end
	
	def encrypt_letter(letter, rotation)
		lowercase_letter = letter.downcase
		cipher[lowercase_letter]
	end

	def encrypt(string, rotation)
		#1 cut the input string into letters
		letters = string.split("")
	#2Encrypt those letters one at a time
		
		encrypted_letters = letters.collect do |letter|
		 encrypt_letter(letter)
	
	end

	#3join the results back together
		encrypted_letters.join("")
	end

	def cipher(rotation)
  characters = (' '..'z').to_a
  rotated_characters = characters.rotate(rotation)
  Hash[characters.zip(rotated_characters)]
end


end

