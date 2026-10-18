# Verilog Adder and Subtractor

## Overview

This project implements binary addition and subtraction circuits using **Verilog HDL**. The objective is to explore the design of combinational arithmetic circuits, understand carry and borrow propagation, and practice hierarchical hardware design.

The project includes half adders, full adders, a 4-bit ripple-carry adder, and subtractor circuits. Each circuit is implemented using Boolean logic and verified through simulation with Icarus Verilog.

These designs serve as foundational building blocks for more complex digital systems, including Arithmetic Logic Units (ALUs) and processors.


## Adder Circuits

### 1. Half Adder

A half adder is a combinational logic circuit that adds two single-bit binary inputs and produces a sum and carry-out.

**Inputs:**
- `a` — First binary input
- `b` — Second binary input

**Outputs:**
- `sum` — Sum bit
- `c_out` — Carry-out bit

**Boolean expressions:**

- Sum = A XOR B
- Carry = A AND B

**Truth Table:**

| A | B | Sum | Carry |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

### 2. Full Adder

A full adder extends the half adder by introducing a carry-in input, allowing binary addition across multiple bit positions.

**Inputs:** `a`, `b`, `cin`

**Outputs:** `sum`, `cout`

**Boolean expressions:**

- Sum = A XOR B XOR Cin
- Cout = (A AND B) OR (Cin AND (A XOR B))

The full adder is implemented using continuous assignments in Verilog.

### 3. 4-Bit Ripple-Carry Adder

The 4-bit ripple-carry adder is constructed by connecting four instances of the 1-bit full-adder module.

Each full adder performs addition on one bit position, with its carry-out connected to the carry-in of the next stage.

**Operation:**

```text
FA0 → FA1 → FA2 → FA3
```

Carry propagation begins at the least significant bit and continues through the most significant bit.

**Example:**

```text
    0101   (5)
  + 0011   (3)
  ------
    1000   (8)
```

The circuit produces a 4-bit sum and a final carry-out.

## Subtractor Circuits

### 4. Full Subtractor

A full subtractor performs binary subtraction using three inputs: two operand bits and a borrow-in.

**Inputs:** `a`, `b`, `bin`

**Outputs:** `diff`, `bout`

**Boolean expressions:**

- Difference = A XOR B XOR Bin
- Borrow-out = (NOT A AND B) OR (Bin AND NOT (A XOR B))

The borrow-out indicates whether the subtraction at the current bit position requires borrowing from the next higher bit.

### 5. 4-Bit Ripple-Borrow Subtractor

The 4-bit subtractor is constructed using four instances of the full-subtractor module.

Each stage receives the borrow-out from the previous stage, allowing subtraction across a 4-bit binary number.

**Operation:**

```text
FS0 → FS1 → FS2 → FS3
```

**Example:**

```text
    1000   (8)
  - 0001   (1)
  ------
    0111   (7