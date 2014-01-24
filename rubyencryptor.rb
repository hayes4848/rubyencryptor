class Encryptor
	#def cipher
	# {"a" => "n","b" => "o","c" => "p","d" => "q",
	# "e" => "r","f" => "s","g" => "t","h" => "u",
	# "i" => "v","j" => "w","k" => "x","l" => "y",
	# "m" => "z","n" => "a","o" => "b","p" => "c",
	# "q" => "d","r" => "e","s" => "f","t" => "g",
	# "u" => "h","v" => "i","w" => "j","x" => "k",
	# "y" => "l","z" => "m"," " => "*"}
	#end
	
	def encrypt_letter(letter,rotation)
		cipher_rotation = cipher(rotation)
		cipher_rotation[letter]
	end

	def encrypt(string,rotation)
		#1 cut the input string into letters
		letters = string.split("")
	#2Encrypt those letters one at a time
		encrypted_letters = letters.collect do |letter|
		 encrypt_letter(letter, rotation)
		end

	#3join the results back together
		encrypted_letters.join("")
	end

	def cipher(rotation)
  		characters = (' '..'z').to_a
  		characters << "\n"
  		rotated_characters = characters.rotate(rotation)
  		Hash[characters.zip(rotated_characters)]
	end

	def encrypt_file(filename, rotation)

    # Create the file handle to the input file
    input = File.open(filename, "r")
    # Read the text of the input file
    text = input.read
    # Encrypt the text
    encrypted_text = encrypt(text,rotation)
    # Create a name for the output file
    new_name = filename + '.encrypted'
    # Create an output file handle
    new_name = File.open(new_name, "w")
    # Write out the text
    new_name.write(encrypted_text)
    # Close the file
    new_name.close
		
	end

	def decrypt_file(filename, rotation)
		# Create the file handle to the input file
    input = File.open(filename, "r")
    # Read the text of the input file
    text = input.read
    # Encrypt the text
    encrypted_text = encrypt(text,rotation)
    # Create a name for the output file
    new_name = filename.gsub('encrypted', 'decrypted')
    # Create an output file handle
    new_name = File.open(new_name, "w")
    # Write out the text
    new_name.write(encrypted_text)
    # Close the file
    new_name.close
	end

	# def crack(string)
		# cipher(1).count.times do |i|
			# puts encrypt
		# end
	# end
end

