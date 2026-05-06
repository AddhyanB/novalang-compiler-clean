# 🚀 NovaLang Compiler & Interpreter

A custom programming language and compiler/interpreter project built using **Flex**, **Bison/Yacc**, and **C**.

NovaLang is designed as an educational compiler project that demonstrates the complete workflow of a programming language, including:

* Lexical Analysis
* Syntax Analysis
* Abstract Syntax Tree (AST)
* Intermediate Representation
* Runtime Execution
* Direct Output Generation
* Control Flow Handling
* Expression Evaluation
* User Input Support

---

# 📌 Features

## ✅ Lexical Analysis

* Tokenization using Flex
* Custom NovaLang keywords
* Operator recognition
* Identifier and number handling

## ✅ Parsing & Grammar Handling

* Implemented using Bison/Yacc
* Expression parsing
* Operator precedence
* Nested statements
* Block handling

## ✅ AST (Abstract Syntax Tree)

* Expression tree generation
* Arithmetic operation nodes
* Condition nodes
* Loop and statement nodes

## ✅ Runtime Interpreter

* Direct NovaLang execution
* Variable storage and evaluation
* Arithmetic expression execution
* Conditional execution
* Loop execution

## ✅ Supported Language Features

* Integer variables
* Arithmetic operations
* If–Else conditions
* Loops
* User input
* String output

---

# 🧠 NovaLang Syntax

## Variable Declaration

```novalang
letz a!
letz b!
```

## Assignment

```novalang
a <- 10!
b <- 20!
```

## Output

```novalang
echoz a!
echoz "Hello World"!
```

## Input

```novalang
inputz a!
```

## If–Else

```novalang
when (a < b) {

    echoz a!

} otherwise {

    echoz b!
}
```

## Loop

```novalang
repeat (a < 5) {

    echoz a!

    a <- a + 1!
}
```

---

# ⚙️ Technologies Used

| Technology   | Purpose                               |
| ------------ | ------------------------------------- |
| Flex         | Lexical Analysis                      |
| Bison/Yacc   | Parsing & Grammar                     |
| C Language   | Compiler & Interpreter Implementation |
| GCC          | Compilation                           |
| Git & GitHub | Version Control                       |

---

# 📂 Project Structure

| File             | Purpose                    |
| ---------------- | -------------------------- |
| `lexer.l`        | Lexical Analyzer           |
| `parser.y`       | Parser & Grammar Rules     |
| `ast.h`          | AST Node Structures        |
| `executor.h`     | Runtime Execution Engine   |
| `codegen.h`      | C Code Generation          |
| `symboltable.h`  | Symbol Table Management    |
| `intermediate.h` | Intermediate Code Handling |
| `README.md`      | Documentation              |
| `sample.txt`     | Sample NovaLang Programs   |

---

# 🔄 Compiler Workflow

```text
NovaLang Code
      ↓
Lexer
      ↓
Parser
      ↓
AST
      ↓
Intermediate Representation
      ↓
Interpreter / Execution
      ↓
Direct Output
```

---

# ▶️ Compilation Commands

## Generate Parser

```bash
win_bison -d parser.y
```

## Generate Lexer

```bash
win_flex lexer.l
```

## Compile Project

```bash
gcc lex.yy.c parser.tab.c -o compiler.exe
```

## Run Compiler

```bash
.\compiler.exe
```

---

# 🧪 Sample Program

```novalang
letz a!
letz b!

a <- 10!
b <- 20!

echoz a + b!
```

## ✅ Output

```text
30
```

---

# 🧪 Sample Program — Table Printing

```novalang
letz n!
letz i!

echoz "Enter Number:"!

inputz n!

i <- 1!

repeat (i <= 10) {

    echoz n * i!

    i <- i + 1!
}
```

## ✅ Output

```text
5
10
15
20
25
30
35
40
45
50
```

---

# 🧪 Sample Program — Print Name N Times

```novalang
letz n!
letz i!

echoz "Enter Number of Times:"!

inputz n!

i <- 1!

repeat (i <= n) {

    echoz "Addhyan"!

    i <- i + 1!
}
```

---

# 🎯 Project Highlights

* Custom programming language creation
* Complete compiler/interpreter workflow
* Runtime execution engine
* Control-flow support
* Expression evaluation
* Educational compiler architecture
* Beginner-friendly syntax design

---

# 🚀 Future Improvements

* String variable support
* Float execution support
* Functions
* Arrays
* File handling
* Better error handling
* IDE/Web editor for NovaLang
* Bytecode virtual machine
* Syntax highlighting

---

# 📸 Example Execution

```text
Enter Number:
5
5
10
15
20
25
30
35
40
45
50
```

---

# 🏆 Project Type

Educational Compiler & Interpreter Project

---

# 👨‍💻 Developed By

Addhyan Bhardwaj

---

# ⭐ GitHub Repository

If you like this project, consider giving it a ⭐ on GitHub.
