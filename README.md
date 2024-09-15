# 19-bit CPU Architecture

## Environment Setup and Installation (Ubuntu)
```bash
sudo apt install iverilog gtkwave
https://github.com/archithp/vicharak_cpu.git
```
## Running the model
- To compile and run the Verilog files
```bash
make run
```
- To view output in gtkwave
```bash
make view
```
## Create Instruction 
- To create 19 bit binary instruction from assembly code use the instruction_maker.py file.
- Add the assemble code inside it and run the file, Copy the output as instruction to the inst_mem.v module

## Architecture
![architecture](https://github.com/user-attachments/assets/87024c0b-88e0-4f69-96eb-8d50a39abb51)
![instruction_type](https://github.com/user-attachments/assets/70c320c1-d83d-4a46-982e-3a9da31d9ec7)

## Instruction Supported
### Arithmetic Instructions    
#### ADD r1, r2, r3
- **Description:** Add the values in registers `r2` and `r3`, and store the result in `r1`.
- **Operation:** `r1 = r2 + r3`
#### SUB r1, r2, r3
- **Description:** Subtract the value in register `r3` from the value in register `r2`, and store the result in `r1`.
- **Operation:** `r1 = r2 - r3` 
#### MUL r1, r2, r3
- **Description:** Multiply the values in registers `r2` and `r3`, and store the result in `r1`.
- **Operation:** `r1 = r2 * r3`
#### DIV r1, r2, r3
- **Description:** Divide the value in register `r2` by the value in register `r3`, and store the result in `r1`.
- **Operation:** `r1 = r2 / r3`
#### INC r1
- **Description:** Increment the value in register `r1` by 1.
- **Operation:** `r1 = r1 + 1`
#### DEC r1
- **Description:** Decrement the value in register `r1` by 1.
- **Operation:** `r1 = r1 - 1`

### Logical Instructions    
#### AND r1, r2, r3
- **Description:** Perform a bitwise AND on the values in registers `r2` and `r3`, and store the result in `r1`.
- **Operation:** `r1 = r2 & r3`
#### OR r1, r2, r3
- **Description:** Perform a bitwise OR on the values in registers `r2` and `r3`, and store the result in `r1`.
- **Operation:** `r1 = r2 | r3`
#### XOR r1, r2, r3
- **Description:** Perform a bitwise XOR on the values in registers `r2` and `r3`, and store the result in `r1`.
- **Operation:** `r1 = r2 ^ r3`
#### NOT r1, r2
- **Description:** Perform a bitwise NOT on the value in register `r2`, and store the result in `r1`.
- **Operation:** `r1 = ~r2`

### Control Flow Instructions    
#### JMP addr
- **Description:** Jump to the specified address.
- **Operation:** `PC = addr`
#### BEQ r1, r2, addr
- **Description:** Branch to the specified address if the values in registers `r1` and `r2` are equal.
- **Operation:** `if (r1 == r2) PC = addr`
#### BNE r1, r2, addr
- **Description:** Branch to the specified address if the values in registers `r1` and `r2` are not equal.
- **Operation:** `if (r1 != r2) PC = addr`
#### CALL addr
- **Description:** Call a subroutine at the specified address.
- **Operation:** `stack[SP] = PC + 1; SP = SP - 1; PC = addr`
####  RET
- **Description:** Return from a subroutine.
- **Operation:** `SP = SP + 1; PC = stack[SP]`

### Memory Access Instructions    
#### LD r1, addr
- **Description:** Load the value from the specified memory address into register `r1`.
- **Operation:** `r1 = memory[addr]`
####  ST addr, r1
- **Description:** Store the value in register `r1` to the specified memory address.
- **Operation:** `memory[addr] = r1`
####  IMM r1, constant
- **Description:** Store the constant value in register `r1`.
- **Operation:** `r1 = constant`

### Custom Instructions (for specialized applications)    
#### ENC r1, r2
- **Description:** Encrypt the data at address `r2` using a predefined encryption algorithm, and store the result in `r1`.
- **Operation:** `r1 = Encrypt(r2)`
#### DEC r1, r2
- **Description:** Decrypt the data at address `r2` using a predefined decryption algorithm, and store the result in `r1`.
- **Operation:** `r1 = Decrypt(r2)`

### Key Feature    
- **Forwarding Unit Present**
- **Stalling Present**
- **Data Hazard Module Present**
- **Data Hazard for Branch not covered**

