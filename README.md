# 16-Bit ALU — Verilog Implementation

A fully combinational **16-bit Arithmetic Logic Unit (ALU)** designed and implemented in Verilog HDL. The design supports a wide range of arithmetic and logical operations, packaged in a clean hierarchical top-block structure.

---

## 📁 Repository Structure

```
ALU_16_bits/
├── ALU_TOP_BLOCK/          # Top-level Verilog source files
│   └── ALU_TOP_BLOCK.v     # Top-level module (and sub-modules)
├── ALU_16_bit.pdf          # Design documentation / report
└── .gitattributes
```

---

## ⚙️ Design Overview

| Parameter     | Value        |
|---------------|--------------|
| Data Width    | 16 bits      |
| Architecture  | Combinational|
| HDL Language  | Verilog      |
| Top Module    | `ALU_TOP_BLOCK` |

The ALU accepts two 16-bit operands (`A`, `B`) and an operation-select signal, producing a result along with status flags.

---

## 🔢 Supported Operations

The ALU is designed to support the following categories of operations:

### Arithmetic
| Operation        | Description                    |
|------------------|--------------------------------|
| `ADD`            | A + B                          |
| `SUB`            | A − B                          |
| `INC`            | A + 1                          |
| `DEC`            | A − 1                          |

### Logical
| Operation | Description     |
|-----------|-----------------|
| `AND`     | A AND B         |
| `OR`      | A OR B          |
| `XOR`     | A XOR B         |
| `NOT`     | NOT A           |
| `NAND`    | A NAND B        |
| `NOR`     | A NOR B         |
| `XNOR`   | A XNOR B        |

### Shift / Rotate
| Operation | Description               |
|-----------|---------------------------|
| `SHL`     | Logical Shift Left        |
| `SHR`     | Logical Shift Right       |
| `ROL`     | Rotate Left               |
| `ROR`     | Rotate Right              |

### Comparison
| Operation | Description               |
|-----------|---------------------------|
| `CMP`     | Compare A and B (via flags)|

> **Note:** Refer to `ALU_16_bit.pdf` for the exact opcode encoding and complete operation set.

---

## 📌 Port Description

| Port     | Direction | Width   | Description                         |
|----------|-----------|---------|-------------------------------------|
| `A`      | Input     | 16-bit  | First operand                       |
| `B`      | Input     | 16-bit  | Second operand                      |
| `opcode` | Input     | N-bit   | Operation select                    |
| `Result` | Output    | 16-bit  | ALU result                          |
| `Zero`   | Output    | 1-bit   | High when result is zero            |
| `Carry`  | Output    | 1-bit   | Carry/borrow from arithmetic ops    |
| `Overflow`| Output   | 1-bit   | Signed overflow flag                |
| `Negative`| Output   | 1-bit   | Sign bit of result                  |

> Port widths and exact names may differ — check the source file for the authoritative interface.

---

## 🛠️ Simulation & Tools

This project was developed and simulated using standard Verilog toolchains:

- **Simulation:** ModelSim / Vivado Simulator / Icarus Verilog
- **Synthesis (optional):** Xilinx ISE / Vivado (targeting Spartan/Artix-7)
- **Linting:** Any standard Verilog linter

### Running with Icarus Verilog (iverilog)

```bash
# Compile
iverilog -o alu_sim ALU_TOP_BLOCK/ALU_TOP_BLOCK.v

# Simulate
vvp alu_sim

# View waveform (if testbench generates a .vcd)
gtkwave dump.vcd
```

---

## 📄 Documentation

A detailed design report is included in the repository:

- [`ALU_16_bit.pdf`](./ALU_16_bit.pdf) — Covers the design specification, block diagram, operation table, and simulation results.

---

## 👤 Author

**yosri227**
- GitHub: [@yosri227](https://github.com/yosri227)

---

## 📜 License

This project is open-source. No explicit license is specified — please contact the author before reusing in commercial or academic work.
