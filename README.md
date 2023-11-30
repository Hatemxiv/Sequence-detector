# Sequence-detector
A 16-bit word will be read from a 16x32 ROM, A Parallel-in-serial-out (PISO) block will load the 16-bit word from the ROM in a register and output a single bit every clock cycle. An FSM will detect if the sequence “1011” is received. A counter will count how many “1011” sequences are there in a 16- bit word. An even/odd checker block will output 1 if the number of sequences is odd and will output 0 if it is even. 
Thus it will add two numbers or "and" them.
