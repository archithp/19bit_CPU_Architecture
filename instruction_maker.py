# Define opcode mappings
opcodes = {
    'ART': '00000', 'LOG': '00001', 'JMP': '00010', 'BEQ': '00011', 'BNE': '00100',
    'CALL': '00101', 'RET': '00110', 'LD': '00111', 'ST': '01000',
    'CRY': '01001', 'IMM': '01010'
}

# Define function codes for R-type instructions
funct_codes = {
    'ADD': '00000', 'SUB': '00001', 'MUL': '00010', 'DIV': '00011',
    'INC': '00100', 'DEC': '00101', 'AND': '00110', 'OR': '00111',
    'XOR': '01000', 'NOT': '01001', 'ENCRY': '01010', 'DECRY': '01011',
}

# Define register mappings
registers = {
    'r0': '000', 'r1': '001', 'r2': '010', 'r3': '011',
    'r4': '100', 'r5': '101', 'r6': '110', 'r7': '111'
}

# Function to convert a decimal number to a binary string with a fixed length
def dec_to_bin(value, bits):
    return format(int(value), f'0{bits}b')

# Function to encode R-type instructions
def encode_r_type(opcode, rs, rt, rd, funct):
    return f"{opcode}{rs}{rt}{rd}{funct}"

# Function to encode I-type instructions
def encode_i_type(opcode, rs, rt, imm):
    return f"{opcode}{rs}{rt}{imm}"

# Function to encode J-type instructions
def encode_j_type(opcode, addr):
    return f"{opcode}{addr}"

# Function to convert assembly code to binary
def assemble(instruction):
    parts = instruction.split()
    inst_type = parts[0]

    # Remove trailing commas and spaces from operands
    parts = [part.strip(',') for part in parts]

    if inst_type in funct_codes:  # R-type instruction
        if inst_type in ['ENCRY', 'DECRY']:
            opcode = opcodes['CRY']
            rs = registers[parts[2]]
            rt = registers[parts[1]]
            rd = '000'  # No rd for ENCRY/DECRY
            funct = funct_codes[inst_type]
            return encode_r_type(opcode, rs, rt, rd, funct)

        elif inst_type in ['INC', 'DEC']:
            opcode = opcodes['ART']
            rs = registers[parts[1]]  # Use r1 for both rs and rd
            rd = registers[parts[1]]
            rt = '000'  # No rt for INC/DEC
            funct = funct_codes[inst_type]
            return encode_r_type(opcode, rs, rt, rd, funct)

        elif inst_type == 'NOT':
            opcode = opcodes['LOG']
            rs = registers[parts[2]]
            rt = '000'  # NOT does not use rd
            rd =  registers[parts[1]]
            funct = funct_codes[inst_type]
            return encode_r_type(opcode, rs, rt, rd, funct)

        else:
            opcode = opcodes['ART']
            rd = registers[parts[1]]
            rs = registers[parts[2]]
            rt = registers[parts[3]]
            funct = funct_codes[inst_type]
            return encode_r_type(opcode, rs, rt, rd, funct)

    elif inst_type == 'LD':  # Handle LD as I-type
        opcode = opcodes[inst_type]
        rt = registers[parts[1]]  # Set rt as the destination register (e.g., r3)
        imm = dec_to_bin(parts[2], 8)  # Immediate value for the offset
        rs = '000'  # No rs used for LD
        return encode_i_type(opcode, rs, rt, imm)


    elif inst_type in ['BEQ', 'BNE', 'ST', 'IMM']:  # I-type instruction
        opcode = opcodes[inst_type]
        if inst_type == 'ST':  # Handle ST as I-type
            imm = dec_to_bin(parts[1], 8)
            rt = registers[parts[2]]
            rs = '000'  # No rs for ST
        elif inst_type == 'IMM':  # Handle IMM as I-type
            rs = registers[parts[1]]
            rt = rs  # rt is the same as rs for IMM
            imm = dec_to_bin(parts[2], 8)
            return encode_i_type(opcode, rs, rt, imm)

        else:
            rs = registers[parts[1]]
            if inst_type in ['BEQ', 'BNE']:
                rt = registers[parts[2]]
                imm = dec_to_bin(parts[3], 8)
            elif inst_type == 'LD':
                imm = dec_to_bin(parts[2], 8)
                rt = '000'  # No rt for LD
            else:
                rt = '000'
                imm = '0' * 8
        return encode_i_type(opcode, rs, rt, imm)

    elif inst_type in ['JMP', 'CALL']:  # J-type instruction
        opcode = opcodes[inst_type]
        addr = dec_to_bin(parts[1], 14)
        return encode_j_type(opcode, addr)

    elif inst_type == 'RET':  # Special case for RET
        opcode = opcodes[inst_type]
        return f"{opcode}" + '0' * 14  # RET doesn't require operands

    else:
        raise ValueError("Unknown instruction type")

# add instruction here
assembly_code = [
    "ADD r1, r2, r3",
    "SUB r1, r2, r3",
    "MUL r1, r2, r3",
    "DIV r1, r2, r3",
    "INC r1",
    "DEC r1",
    "AND r1, r2, r3",
    "OR r1, r2, r3",
    "XOR r1, r2, r3",
    "NOT r1, r2",
    "JMP 255",
    "BEQ r1, r2, 15",
    "BNE r1, r2, 15",
    "CALL 15",
    "RET",
    "LD r1, 5",
    "ST 5, r1",
    "ENCRY r1, r2",
    "DECRY r1, r2",
    "IMM r1 8"
]

i=0
for instruction in assembly_code:
  binary_code = assemble(instruction)
  binary_code = binary_code.ljust(19, '0')  # Adjust length to 19 bits
  print(f"memory[{i}] =","19'b"f"{binary_code}; //{instruction}")
  i += 1

