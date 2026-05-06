# 🚀 NovaLang Compiler

![Language](https://img.shields.io/badge/Language-C-blue)
![Tool](https://img.shields.io/badge/Tools-Flex%20%7C%20Bison-green)
![Status](https://img.shields.io/badge/Status-Completed-success)
![Project](https://img.shields.io/badge/Project-Compiler%20Design-orange)

---

## 👨‍💻 Developed By

**Addhyan Bhardwaj**

---

## 📌 Project Overview

NovaLang is a **custom programming language and compiler** built using **Lex (Flex)** and **Yacc (Bison)**.

This project demonstrates the core phases of compiler design by creating a language from scratch and implementing its execution pipeline.

---

## 🧠 NovaLang Syntax

```plaintext
letz a!
letz b!

a <- 5!
b <- 10!

when (a < b) {
    echoz a!
} otherwise {
    echoz b!
}

repeat (a < 8) {
    a <- a + 1!
    echoz a!
}
```

---

## ⚙️ Features

* ✔ Custom language (NovaLang)
* ✔ Lexical Analysis (Flex)
* ✔ Syntax Analysis (Bison/Yacc)
* ✔ Symbol Table
* ✔ Expression evaluation
* ✔ If–Else control flow
* ✔ Loop support (repeat)
* ✔ Output execution

---

## 🧱 Compiler Pipeline

```text
Source Code (NovaLang)
        ↓
Lexical Analysis (Flex)
        ↓
Token Stream
        ↓
Syntax Analysis (Yacc)
        ↓
Parse Tree
        ↓
Semantic Handling
        ↓
Execution / Output
```

---

## 📂 Project Structure

```text
novalang-compiler/
│
├── lexer.l        # Lexical Analyzer
├── parser.y       # Syntax Analyzer
├── sample.txt     # Sample Input
├── README.md      # Documentation
└── .gitignore
```

---

## ⚙️ How to Run

### 🔧 Requirements

* Flex (Lex)
* Bison (Yacc)
* GCC Compiler

---

### 🛠️ Compilation

```bash
win_bison -d parser.y
win_flex lexer.l
gcc lex.yy.c parser.tab.c -o compiler.exe
```

---

### ▶️ Run

```bash
.\compiler.exe
```

Then enter code and press:

```
Ctrl + Z + Enter
```

---

## 📄 Sample Input

```plaintext
letz a!
letz b!

a <- 5!
b <- 10!

when (a < b) {
    echoz a!
} otherwise {
    echoz b!
}
```

---

## 📌 Sample Output

```text
5
```

---

## ⚠️ Limitations

* Loop execution is simplified
* No AST (Abstract Syntax Tree)
* No optimization phase
* No machine code generation

---

## 🔮 Future Improvements

* AST-based execution
* Full loop handling
* Function support
* Optimization phase
* Code generation

---

## 🎯 Learning Outcomes

* Understanding compiler phases
* Working with Flex & Bison
* Grammar design
* Symbol table implementation
* Execution flow handling

---

## 💡 Important Note

This project follows a **hybrid approach**:

* Parsing → Lex & Yacc
* Execution → Integrated interpreter logic

---

## ⭐ Conclusion

NovaLang Compiler is a practical implementation of compiler design concepts, demonstrating how a custom programming language can be created and executed.

---

🔥 *A complete academic project showcasing real compiler concepts.*

---
