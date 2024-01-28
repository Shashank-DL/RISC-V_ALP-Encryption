.data
msg: .string "Hello, world!\0" # The string to be encrypted or decrypted
key: .byte 0x42 # The encryption/decryption key

.text

encrypt:
    la a0, msg # Load the address of the string into a0
    la x21, key
    lbu a1,0(x21) # Load the key into a1
enc_loop:
    lbu a2, 0(a0) # Load a byte of the string into a2
    beqz a2, enc_done # If the byte is zero, end the loop
    xor a2, a2, a1 # XOR the byte with the key
    sb a2, 0(a0) # Store the result back in the same location
    addi a0, a0, 1 # Increment the address pointer
    j enc_loop # Jump to the next iteration
enc_done:
    nop # Exit the program
    
decrypt:
    la a0, msg # Load the address of the string into a0
    la x21, key
    lbu a1,0(x21) # Load the key into a1
dec_loop:
    lbu a2, 0(a0) # Load a byte of the string into a2
    beqz a2, dec_done # If the byte is zero, end the loop
    xor a2, a2, a1 # XOR the byte with the key
    sb a2, 0(a0) # Store the result back in the same location
    addi a0, a0, 1 # Increment the address pointer
    j dec_loop # Jump to the next iteration
dec_done:
    nop # Exit the program
