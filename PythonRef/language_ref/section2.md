# Python Language Reference - Lexical Analysis

## Line Structure

### 2.1.1 Logical Lines vs. 2.1.2 Physical Lines

In Python, what you see on the screen (Physical Lines) isn't always what the parser sees (Logical Lines). Distinguishing between these two is crucial for understanding how Python interprets statements.

#### 1. Physical Lines

A **Physical Line** is what you see in your text editor. It is a sequence of characters terminated by an end-of-line sequence.

* **Source:** Depending on your operating system, this end-of-line sequence might be different:
* **Unix/Linux:** `LF` (Linefeed)
* **Windows:** `CR LF` (Carriage Return + Linefeed)
* **Mac (old):** `CR` (Carriage Return)


* **Normalization:** The Lexical Analyzer makes life easy for the parser. Regardless of the platform you are on, Python replaces all of these variations with a **single standard ASCII LF (linefeed) character**.

#### 2. Logical Lines

A **Logical Line** is a complete "sentence" of code that the Python parser processes.

* **The Token:** The end of a logical line is marked by the `NEWLINE` token.
* **Relationship:** A logical line is constructed from one or more physical lines.
* Usually, 1 Physical Line = 1 Logical Line.
* However, using **Line Joining** rules (which we will cover next), multiple Physical Lines can be combined into a single Logical Line.

#### Comparison Summary

| Feature | Physical Line | Logical Line |
| --- | --- | --- |
| **Definition** | A sequence of characters ending with a return/enter key press. | A complete Python statement ending with the `NEWLINE` token. |
| **Visual vs. Parser** | Visual (Editor view). | Structural (Parser view). |
| **Cardinality** | Can be joined together. | Cannot cross boundaries (mostly). |

---

### Key Takeaway

The Python parser does not read your file line-by-line as *you* see it. It reads **Logical Lines**.

> **Example:**
> If you write a long mathematical equation across three lines in your editor (3 Physical Lines), Python joins them together to process them as one single statement (1 Logical Line).

---

### 2.1.4 Encoding Declarations

Before Python parses tokens, it must decode the source file bytes into characters.

* **Default:** UTF-8.
* **Customization:** You can specify a different encoding by placing a special comment in the **first or second line** of the script.

The comment must match the pattern `coding[=:]\s*([-\w.]+)`. Here are the recommended formats:

```python
# -*- coding: utf-8 -*-
# OR
# vim:fileencoding=latin-1
```

If this isn't found, Python assumes UTF-8. If decoding fails, a `SyntaxError` is raised.

---

### 2.1.3 Comments & 2.1.7 Blank Lines

Before we join lines, we must handle "noise":

* **Comments:** Start with `#` (unless inside a string). They end at the end of the *physical* line.
* **Blank Lines:** A logical line containing only spaces, tabs, formfeeds, or comments is **ignored**. No `NEWLINE` token is generated for these.

---

### Line Joining Rules

This is how Python constructs a single Logical Line from multiple Physical Lines. There are two ways to do this: **Explicit** and **Implicit**.

#### 1. Explicit Line Joining (2.1.5)

You force the join using a backslash `\` at the very end of the physical line.

* **Mechanism:** Python deletes the backslash *and* the following newline character, treating the text as a continuous stream.
* **Restrictions:**
* The backslash must be the **last** character. You cannot put a comment after it.
* A backslash cannot continue a comment.



**Example:**

```python
# Valid Explicit Joining
if 1900 < year < 2100 and 1 <= month <= 12 \
   and 1 <= day <= 31 and 0 <= hour < 24 \
   and 0 <= minute < 60 and 0 <= second < 60:
       return 1
```

#### 2. Implicit Line Joining (2.1.6)

This is the preferred, "Pythonic" way. Expressions inside parentheses `()`, square brackets `[]`, or curly braces `{}` can be split across lines naturally.

* **Benefits:**
* No backslashes required.
* **Comments are allowed** on continuation lines.
* Indentation of continuation lines does not affect the program structure (it's purely for readability).



**Example:**

```python
# Valid Implicit Joining
month_names = ['Januar', 'Februar', 'Marz',       # These are the
               'April',   'Mai',     'Juni',       # German names
               'Juli',    'August',  'September',  # for the months
               'Oktober', 'November','Dezember']   # of the year

```

#### Comparison Table

| Feature | Explicit Joining (`\`) | Implicit Joining `(...)` |
| --- | --- | --- |
| **Trigger** | Backslash at end of line | Open parentheses, brackets, or braces |
| **Comments allowed?** | **No** (SyntaxError if placed after `\`) | **Yes** (anywhere in the list) |
| **Indentation** | Visual alignment only | Not important to parser |
| **Preference** | Use strictly when necessary | Preferred |

---

### 2.1.8 Indentation

The lexical analyzer tracks indentation using a **stack** of numbers.

* **Leading Whitespace:** Spaces and tabs at the start of a logical line determine the indentation level.
* **Tabs:** Replaced by 1-8 spaces (always expands to the next tab stop).
* **The Golden Rule:** The indentation level of a line is compared to the **top** of the stack.

#### The Algorithm

1. **Initialize:** Before the first line is read, push `0` onto the stack. Stack = `[0]`.
2. **Compare:** At the start of each logical line, calculate indentation `n`:
    * **If `n > stack.top**`: Push `n`. Generate **INDENT**.
    * **If `n == stack.top**`: Do nothing.
    * **If `n < stack.top**`:
    * Pop numbers off the stack until you find one equal to `n`.
    * For every number popped, generate **DEDENT**.
    * *Note: If you pop everything and don't find `n`, it's an IndentationError.*
3. **Cleanup:** At the end of the file, generate a **DEDENT** token for every number remaining on the stack greater than 0.

### Visual Deep Dive: The Stack in Action

Let's trace a piece of code to see exactly how tokens are born.

**The Code:**

```python
def foo():          # Line 1 (Level 0)
    if True:        # Line 2 (Level 4)
        x = 1       # Line 3 (Level 8)
    print("done")   # Line 4 (Level 4)
                    # Line 5 (End of File)

```

**The Step-by-Step Execution:**

| Line | Code Content | Indent Level (`n`) | Comparison Action | Stack State (After Action) | Tokens Generated |
| --- | --- | --- | --- | --- | --- |
| **Start** | *(Initialization)* | - | Push 0 | `[0]` | - |
| **1** | `def foo():` | **0** | `0 == 0` (Top) | `[0]` | - |
| **2** | `    if True:` | **4** | `4 > 0` (Top) | `[0, 4]` | **INDENT** |
| **3** | `        x = 1` | **8** | `8 > 4` (Top) | `[0, 4, 8]` | **INDENT** |
| **4** | `    print...` | **4** | `4 < 8` (Top) | Pop 8. Top is now 4. Match found. | **DEDENT** |
|  |  |  | `4 == 4` (Stop popping) | `[0, 4]` | - |
| **EOF** | *(End of File)* | - | Cleanup Stack | `[0]` | **DEDENT** (for the 4) |

**Resulting Token Stream:**
`def`, `foo`, `()`, `:`, `NEWLINE`, **`INDENT`**, `if`, `True`, `:`, `NEWLINE`, **`INDENT`**, `x`, `=`, `1`, `NEWLINE`, **`DEDENT`**, `print`, `(`, `"done"`, `)`, `NEWLINE`, **`DEDENT`**, `ENDMARKER`.

---

### 2.1.9 Whitespace & 2.1.10 End Marker

* **Whitespace between tokens:** Once the indentation is handled at the start of the line, spaces/tabs between words (like `x = 1`) are ignored. They just separate tokens.
* **End Marker:** When the input finishes, the analyzer generates one final token: `ENDMARKER`.

## 2.2 Other Tokens

We have focused heavily on structure, but the content of the lines matters too. The Lexical Analyzer categorizes the actual text into:

1. **Identifiers & Keywords** (`NAME`): e.g., `def`, `foo`, `if`, `x`.
2. **Literals**:
* `NUMBER`: `1`, `3.14`
* `STRING`: `"done"`, `'hello'`


3. **Operators & Delimiters** (`OP`): `+`, `=`, `(`, `)`, `:`, `.`.

## 2.3 Names (identifiers and keywords)

### 1. Identifiers (Names)

In Python, a **NAME token** represents identifiers. These are the user-defined names you give to variables, functions, classes, modules, and other objects.

#### **The Rules of Construction**

To create a valid identifier in Python 3.14.3, you must follow these specific character rules:

* **Allowed Characters:**
* Uppercase and lowercase letters (`A-Z`, `a-z`).
* The underscore character (`_`).
* Digits (`0-9`).
* Non-ASCII characters (e.g., `ñ`, `β`, `字`).

*Note: While allowed, Python normalizes these using NFKC normalization to ensure characters that look alike are treated consistently.*


* **The Golden Rule:** An identifier **cannot** start with a digit.
* ✅ `variable_1`
* ❌ `1_variable`


* **Length:** There is **no upper length limit**.
* **Case Sensitivity:** Python is case-sensitive.
* `myVariable`, `MyVariable`, and `MYVARIABLE` are three completely different names.



---

### 2. Hard Keywords

Python reserves certain words for its own syntax. These are often called **"Hard Keywords"**.

#### **The Restriction**

You **cannot** use these words as ordinary identifiers. You cannot name a variable, function, or class any of the names listed below. If you try (e.g., `class = 5`), Python will raise a `SyntaxError`.

#### **The List**

These must be spelled **exactly** as written (case matters):

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| `False` | `await` | `else` | `import` | `pass` |
| `None` | `break` | `except` | `in` | `raise` |
| `True` | `class` | `finally` | `is` | `return` |
| `and` | `continue` | `for` | `lambda` | `try` |
| `as` | `def` | `from` | `nonlocal` | `while` |
| `assert` | `del` | `global` | `not` | `with` |
| `async` | `elif` | `if` | `or` | `yield` |

> **Note:** `True`, `False`, and `None` are capitalized. All others are strictly lowercase.

---

### 3. Soft Keywords

Unlike "Hard Keywords" (which are forbidden as names everywhere), **Soft Keywords** are identifiers that are reserved only in specific **contexts**.

#### **The Core Concept**

You **can** use these words as variable names, function names, or class names in your code. The Python parser only treats them as keywords when they appear in specific grammatical structures.

This distinction is made at the **parser level**, not during tokenization (the initial text processing).

#### **The List of Soft Keywords**

There are currently four soft keywords:

1. `match`
2. `case`
3. `type`
4. `_` (underscore)

#### **How They Work (Contexts)**

* **`match`, `case`, and `_`**:
* These act as keywords within a **`match` statement** (Python's structural pattern matching).
* Outside of a match statement, they are just regular names.


* **`type`**:
* This acts as a keyword in a **`type` statement** (introduced in Python 3.12 for defining type aliases).
* Otherwise, it is just a name (usually referring to the built-in `type()` function).

#### **Example: Variable vs. Keyword**

Because they are "soft," you can write valid code that looks like this:

```python
# Here, 'match' and 'type' are used as variable names (Valid!)
match = "Tennis"
type = "Clay Court"

# Here, 'match' and 'case' are used as keywords (Valid!)
match type:
    case "Clay Court":
        print("Slow surface")
    case "Grass":
        print("Fast surface")

```

This flexibility prevents old code (which might have used `match` or `type` as variable names) from breaking when these new features were added to the language.

---

### 4. Reserved Classes (Underscore Patterns)

These rules define how names with leading or trailing underscores are handled.

#### **A. Single Leading Underscore (`_variable`)**

* **The Rule:** Names starting with one underscore are **not imported** when someone uses `from module import *`.
* **Meaning:** This effectively marks the variable or function as "internal" or "private" to that module, though you can still import it explicitly if you try hard enough.

#### **B. The Lone Underscore (`_`)**

The single underscore by itself has two distinct behaviors depending on context:

1. **In a `match` statement:** It acts as a **soft keyword** denoting a wildcard (matches anything).
2. **In the Interactive Interpreter:** It stores the **result of the last executed expression**.
* *Example:* If you type `10 + 5`, the result `15` is stored in `_`.

#### **C. Double Leading and Trailing Underscores (`__name__`)**

* **Common Name:** "Dunder" names (Double UNDERscore).
* **Meaning:** These are **System-Defined Names**. They are reserved for the interpreter and standard library.
* **Usage:** You should generally *never* invent your own dunder names. You only use the ones Python provides (like `__init__` for class initialization or `__add__` for operator overloading).

#### **D. Double Leading Underscore (`__private`)**

* **The Rule:** Names with at least two leading underscores and *at most* one trailing underscore.
* **Context:** Must occur within a **class definition**.
* **Meaning:** These are **Class-Private Names**.
* **Mechanism (Name Mangling):** Python automatically rewrites these names to include the class name (e.g., `_ClassName__private`). This prevents collisions if a subclass accidentally tries to use the same variable name.

---

## String and Bytes Literals (Section 2.4 – 2.5)

In Python, literals are the "hardcoded" values in your source code. String literals are particularly versatile because of their **prefixes**, which tell the interpreter exactly how to treat the characters within the quotes.

### 1. The Prefix Toolkit

Prefixes are case-insensitive (`r` is the same as `R`) and determine the "flavor" of the string:

| Prefix | Name | Purpose |
| --- | --- | --- |
| **`r`** | **Raw** | Treats backslashes (`\`) as literal characters. Essential for Regex or Windows file paths so `\n` doesn't become a newline. |
| **`f`** | **Formatted** | Enables **f-strings**, allowing you to embed Python expressions directly inside the string using `{}`. |
| **`b`** | **Bytes** | Creates a `bytes` object instead of a `str`. It only allows ASCII characters; anything else requires an escape sequence. |
| **`u`** | **Legacy** | A "no-op" prefix. It exists solely for backward compatibility with Python 2. In Python 3, all strings are Unicode by default. |

> **Pro Tip:** You can combine prefixes! For example, `fr"..."` creates a raw formatted string, and `rb"..."` creates a raw bytes literal.

### 2. Deep Dive: F-Strings (`f`)

Formatted string literals are evaluated at **run-time**. This makes them incredibly powerful for dynamic text.

* **Expression Evaluation:** Anything inside `{}` is executed as Python code.
* `f"Result: {2 + 2}"` → `"Result: 4"`


* **The Debug Specifier (`=`):** Added in later versions of Python, this is a lifesaver for logging. Adding an `=` after the variable name inside the braces prints both the variable name and its value.
* If `user = "Alice"`, then `f"{user=}"` evaluates to `"user='Alice'"` (including the quotes for strings!).



### 3. Implicit String Concatenation

One of Python’s "magic" lexical features is that string literals placed next to each other are automatically merged by the parser.

```python
# These are identical:
text = "Python " "is " "awesome"
# text == "Python is awesome"
```

This is specifically useful for breaking long strings across multiple lines without using the `+` operator or backslashes.

### 4. Escape Sequences & Triple Quotes

* **Escapes:** Standard C-style escapes like `\n` (newline) and `\t` (tab) work in normal strings. If you end a line with a `\`, Python ignores the newline (line joining).
* **Triple Quotes:** Using `'''` or `"""` allows the literal to span multiple lines physically in your code without needing `\n` escapes.

---

F-strings are more than just a way to plug variables into text; they are actually **mini-templates** that can execute code and format data on the fly.

Here are the most common and powerful ways f-strings are used in professional Python code:

### 1. Expressions and Function Calls

You aren't limited to simple variables. You can perform arithmetic or call methods directly inside the braces.

```python
name = "GEMINI"
# Logic and methods inside the f-string
print(f"Lowercased: {name.lower()} | 5 * 5 = {5 * 5}")
# Output: Lowercased: gemini | 5 * 5 = 25
```

### 2. Number Formatting (Precision & Commas)

F-strings use a "Format Specification Mini-Language" (denoted by a colon `:`) to control how numbers look.

* **Decimals:** Limit a float to a specific number of decimal places.
* **Thousands Separator:** Add commas to large numbers for readability.

```python
pi = 3.1415926535
salary = 1250000

print(f"Pi to 2 decimals: {pi:.2f}")     # Output: 3.14
print(f"Readable salary: ${salary:,}")   # Output: $1,250,000
```

### 3. Padding and Alignment

This is perfect for creating CLI tables or organized logs without using external libraries.

* `>10`: Right-align (total width of 10)
* `<10`: Left-align
* `^10`: Center-align

```python
header1 = "Item"
header2 = "Price"

print(f"{header1:<10} | {header2:>8}")
print("-" * 21)
print(f"{'Bread':<10} | {'$2.50':>8}")
# Output:
# Item       |    Price
# ---------------------
# Bread      |    $2.50
```

### 4. Dates and Times

If you have a `datetime` object, you can format it directly within the f-string using standard `strftime` codes.

```python
from datetime import datetime
now = datetime.now()

print(f"The current time is: {now:%H:%M:%S}") 
# Output: The current time is: 14:30:05
```

### 5. Multi-line F-Strings

When you combine triple quotes with the `f` prefix, you can create dynamic multi-line templates—ideal for generating HTML, SQL queries, or emails.

```python
user_name = "Alex"
email_body = f"""
Hello {user_name},

Your account has been updated.
Generated on: {datetime.now():%Y-%m-%d}
"""
```

---

Since those f-string power-user tricks are clear, let’s dive into the final section of Lexical Analysis: **Numeric Literals**. Python is quite flexible with how it allows you to represent numbers, especially when dealing with different base systems or complex math.


## Numeric Literals (Section 2.6)

Python 3.14 recognizes three distinct types of numeric literals: **Integers**, **Floating-point numbers**, and **Imaginary numbers**.

### 1. Integer Literals (Base Systems)

While we usually write in base 10 (decimal), Python allows you to write integers in binary, octal, and hexadecimal.

| Base | Prefix | Example | Decimal Value |
| --- | --- | --- | --- |
| **Decimal** | (None) | `10`, `255` | 10, 255 |
| **Binary** | `0b` or `0B` | `0b1010` | 10 |
| **Octal** | `0o` or `0O` | `0o12` | 10 |
| **Hexadecimal** | `0x` or `0X` | `0xff` | 255 |

> **Crucial Rule:** Decimal literals **cannot** start with a leading zero (e.g., `0123` is a SyntaxError). This prevents confusion with the old Python 2 octal syntax.

### 2. The Underscore `_` (Visual Grouping)

To make large numbers readable, you can use a single underscore as a visual separator. The interpreter completely ignores these.

* **Valid:** `1_000_000`, `0x_FF_FF`, `0b_1001`
* **Placement Rules:** An underscore cannot be at the very beginning or very end of a literal.
* **The "3.14" Specifics:** In current specifications, an underscore **can** follow the base specifier. For example, `0x_1f` is valid, but `0_x1f` is not.

### 3. Floating-Point Literals

Floating-point numbers can be defined using a decimal point, an exponent (`e` or `E`), or both.

* **Point Notation:** `3.14`, `10.`, `.001`
* **Exponent (Scientific) Notation:** `1e10` (10 to the 10th power), `3.14e-10`.
* **Grouping:** Just like integers, floats can use underscores: `3.141_592`.

### 4. Imaginary Literals (The `j` Suffix)

In Python, imaginary numbers are denoted by appending a lowercase `j` or uppercase `J` to an integer or floating-point literal. This creates a **complex number** where the real part is `0.0`.

* **Examples:** `3.14j`, `10j`, `.001j`
* **Note:** If you want a full complex number with a real part, you add them: `2 + 3j`.

---

## Operators vs. Delimiters: A Blurry Line

At a high level, the distinction is conceptual:

* **Operators** are generally used to combine expressions and perform operations (e.g., math, bitwise logic, or comparisons).
* **Delimiters** serve other syntactical purposes, like grouping expressions, separating list items, or assigning values.

> **Note:** As the documentation points out, there is **no clear, formal distinction** between the two categories in Python's lexical grammar. Under the hood, the tokenizer categorizes them all as generic `OP` (Operator/Delimiter) tokens.

### Context is King: Dual-Role Tokens

Because operators and delimiters share the same token family, many symbols can act as *both* depending entirely on how and where they are used:

* **The Asterisk (`*`):** * *Operator:* Multiplication (`x * y`)
* *Delimiter:* Sequence unpacking (`*args`)


* **The At-Symbol (`@`):** * *Operator:* Matrix multiplication (`matrix_a @ matrix_b`)
* *Delimiter:* Introducing a decorator (`@dataclass`)

The documentation notes that this ambiguity extends to tokens like `.`, `(`, and `)`. While some developers strictly view them as delimiters, others consider them to be the `getattr()` operator and function call operators, respectively.

### Exceptions to the Symbol Rule

It's crucial to remember that not all operators are punctuation marks! Some of Python's most common operators actually use **keyword tokens** rather than `OP` symbols.

Examples include logical operators (`and`, `or`) and membership operators (`not in`, `is`).

### The Special Ellipsis Literal

Tucked inside the `OP` grammar is a very specific sequence: `...` (three consecutive periods). This has a special meaning as the **Ellipsis literal**, often used as a placeholder in code (similar to `pass`), in multidimensional array slicing (like NumPy), or in type hinting.

---

### The `OP` Grammar Breakdown

For completeness, here is how Python groups these `OP` tokens lexically:

* **Assignment:** `+=`, `-=`, `*=`, `**=`, `/=`, `//=`, `%=`, `&=`, `|=`, `^=`, `<<=`, `>>=`, `@=`, `:=`
* **Bitwise:** `&`, `|`, `^`, `~`, `<<`, `>>`
* **Comparison:** `<=`, `>=`, `<`, `>`, `==`, `!=`
* **Enclosing Delimiters:** `(`, `)`, `[`, `]`, `{`, `}`
* **Other Delimiters:** `,`, `:`, `!`, `;`, `=`, `->`
* **Arithmetic:** `+`, `-`, `**`, `*`, `//`, `/`, `%`
* **Other Ops:** `.`, `@`
* **Special:** `...`

---

## CHAPTER 2 MASTER SUMMARY

You have now completed **Chapter 2: Lexical Analysis**. Here is the master synthesis of how Python reads your raw source code and translates it into tokens:

* **Lines & Structure:** Python reads code in *physical lines* but executes it in *logical lines*. Logical lines can span multiple physical lines using explicit joining (the `\` character) or implicit joining (inside parentheses, brackets, or braces).
* **Indentation:** Whitespace at the beginning of a logical line is computationally significant. Python uses `INDENT` and `DEDENT` tokens to track the opening and closing of block structures, replacing the curly braces `{}` used in many other languages.
* **Identifiers & Keywords:** Names you define (variables, functions, classes) must follow specific rules (starting with a letter/underscore, followed by alphanumeric characters/underscores). A specific set of these words are reserved as **Keywords** (e.g., `def`, `if`, `return`) and cannot be used as identifiers.
* **Literals:** Hardcoded data values.
* *Strings/Bytes:* Can be modified with prefixes (`r` for raw, `f` for formatted string evaluation/debugging, `b` for bytes) and undergo implicit concatenation if placed side-by-side.
* *Numerics:* Support different bases (`0b`, `0o`, `0x`), visual grouping with underscores (`1_000`), the `j` suffix for complex numbers, and strict rules against leading zeros in decimals.


* **Operators & Delimiters (`OP` tokens):** Symbols that combine expressions (math, logic) or structure the syntax (brackets, commas). Many symbols (like `*` and `@`) change their role based on context, and some operators are actually mapped to keywords (`and`, `or`).

