# Python Certification Curriculum: Complete Training Guide
## For College Graduates (Week 1-16 Comprehensive Plan)

---

## Executive Summary

This is a complete 16-week Python certification training curriculum designed for college graduates pursuing the Python Institute's PCEP (Certified Entry-Level Python Programmer) and PCAP (Certified Associate Python Programmer) certifications. The curriculum progresses from fundamental concepts (Week 1-5) through intermediate skills (Week 6-10) to advanced programming paradigms (Week 11-16).

**Total Training Hours**: 96 hours (6 hours per week)
**Target Certification**: PCEP (after Week 16), PCAP (Weeks 17-24)
**Success Rate Target**: 80%+ on PCEP practice exams

---

## Table of Contents

1. Curriculum Overview
2. Week-by-Week Detailed Plans
3. Teaching Methodologies
4. Code Examples & Resources
5. Assessment Framework
6. Student Success Metrics

---

# PART 1: CURRICULUM OVERVIEW

## Course Structure

### Phase 1: Fundamentals (Weeks 1-5) - 30 Hours
- **Focus**: Core Python syntax, data structures, control flow
- **Exam Coverage**: 60% of PCEP exam
- **Outcome**: Students write simple programs with functions and input/output

### Phase 2: Intermediate (Weeks 6-10) - 30 Hours
- **Focus**: Advanced data structures, functional programming, file I/O
- **Exam Coverage**: 25% of PCEP exam + 40% of PCAP exam
- **Outcome**: Students process real-world data and handle errors robustly

### Phase 3: Advanced (Weeks 11-16) - 30 Hours
- **Focus**: Object-oriented programming, modules, decorators
- **Exam Coverage**: 15% of PCEP exam + 60% of PCAP exam
- **Outcome**: Students design scalable applications using OOP principles

## Exam Alignment

**PCEP (Certified Entry-Level Python Programmer)**
- Computer Programming & Python Fundamentals: 18%
- Control Flow: 29%
- Data Collections: 25%
- Functions & Exceptions: 28%
- **Total**: 100 questions, 60 minutes

**PCAP (Certified Associate Python Programmer)**
- Advanced OOP: 34%
- Modules & Packages: 12%
- Exception Handling: 14%
- String & File Processing: 18%
- Advanced Features: 22%

---

# PART 2: WEEK-BY-WEEK DETAILED PLANS

## Week 1: Pre-Training Assessment & Data Structures Review

**Duration**: 6 hours

### Topics Covered:
- Lists: creation, indexing, slicing, common methods
- Tuples: immutability, unpacking, use cases
- Dictionaries: key-value pairs, methods, iteration
- Sets: unique elements, set operations

### Learning Objectives:
- Understand mutable vs. immutable sequences
- Access and modify data structures appropriately
- Choose correct data structure for problem

### Hands-On Exercises:
1. Create and manipulate lists (append, insert, remove)
2. Use tuples for function return values
3. Build dictionaries representing objects (student records, product catalog)
4. Perform set operations (union, intersection, difference)

### Assessment:
- Quiz: 10 questions on data structure operations
- Practical: Build a student database using dictionaries

### Key Metrics:
- 90% students should complete all exercises
- Average quiz score: 75%+

---

## Week 2: Control Flow – Conditionals and Decision Making

**Duration**: 6 hours

### Topics Covered:

#### Conditional Statements (if, elif, else)
```python
# Single if
if age >= 18:
    print("Adult")

# if-else
if grade >= 70:
    print("Pass")
else:
    print("Fail")

# if-elif-else chain
if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
else:
    grade = "F"
```

#### Boolean Logic
```python
# Comparison operators
x > 5, x == 10, x != 0, x <= 100

# Logical operators
if age >= 18 and has_license:
    print("Can drive")

if is_weekend or is_holiday:
    print("Day off")

if not is_raining:
    print("Go outside")
```

#### Operator Precedence
```python
# Evaluation order: not > and > or
result = True or False and False  # True (and evaluated first)
result = (True or False) and False  # False (parentheses first)
```

### Common Pitfalls:
1. Using `=` instead of `==` in conditions
2. Forgetting colon after condition
3. Incorrect indentation of code block
4. Using `and` when `or` is needed

### Worked Examples:

**Example 1: ATM PIN Verification**
```python
correct_pin = "1234"
attempts = 0

pin = input("Enter PIN: ")
if pin == correct_pin:
    print("Access granted")
else:
    print("Invalid PIN")
```

**Example 2: Nested Conditionals**
```python
age = int(input("Enter age: "))
gender = input("Enter gender (M/F): ")

if age >= 18:
    if gender == "M":
        print("Eligible for male military service")
    elif gender == "F":
        print("Eligible for female military service")
else:
    print("Too young for service")
```

### Hands-On Exercises:
1. Grade calculator with if-elif-else
2. Input validation with nested conditions
3. Number guessing game with conditional logic
4. Shipping cost calculator (used in previous examples)

### Teaching Approach:
- **Minimal examples**: Show single concept in isolation
- **Worked examples**: Demonstrate with subgoal labels
- **Peer instruction**: Pose concept questions, discuss in pairs
- **Active practice**: Students write code while instructor circulates

### Assessment:
- Practical: Build a ticket pricing system
  - Child (0-12): $5
  - Teen (13-19): $10
  - Adult (20-64): $15
  - Senior (65+): $8

### Key Metrics:
- 85% students complete all exercises
- Quiz score: 70%+ correct
- Code implements all branches correctly

---

## Week 3: Loops and Iteration

**Duration**: 6 hours

### Topics Covered:

#### While Loops
```python
# Basic while
count = 0
while count < 5:
    print(f"Count: {count}")
    count += 1

# Password retry logic
attempts = 0
password = "secret"
while attempts < 3:
    user_input = input("Enter password: ")
    if user_input == password:
        print("Access granted")
        break
    attempts += 1
```

#### For Loops
```python
# Iterate over range
for i in range(5):  # 0, 1, 2, 3, 4
    print(i)

# With start, stop, step
for i in range(1, 10, 2):  # 1, 3, 5, 7, 9
    print(i)

# Iterate over sequences
for item in [1, 2, 3]:
    print(item)

for char in "Python":
    print(char)
```

#### Loop Control Statements
```python
# Break: exit loop early
for i in range(10):
    if i == 5:
        break  # Stop at 5
    print(i)

# Continue: skip to next iteration
for i in range(10):
    if i % 2 == 0:
        continue  # Skip even numbers
    print(i)  # Only prints 1, 3, 5, 7, 9

# Pass: placeholder
for i in range(5):
    if i == 3:
        pass  # Do nothing for now
    else:
        print(i)
```

#### Advanced Iteration
```python
# for-else: runs if loop completes without break
for i in range(5):
    if i == 10:
        break
else:
    print("Loop completed normally")

# while-else
attempts = 0
while attempts < 3:
    password = input("Enter: ")
    if password == "correct":
        print("Success")
        break
    attempts += 1
else:
    print("Too many failed attempts")

# Nested loops
for i in range(3):
    for j in range(3):
        print(f"({i}, {j})")
```

### Common Mistakes:
1. Infinite loops (missing increment/break)
2. Off-by-one errors with range
3. `break` only exits innermost loop
4. Modifying list while iterating

### Worked Examples:

**Example 1: Multiplication Table**
```python
def print_times_table(n):
    for i in range(1, 11):
        for j in range(1, 11):
            print(f"{i}×{j}={i*j:3}", end=" ")
        print()  # New line

print_times_table(10)
```

**Example 2: Password Validator with Retries**
```python
def validate_password(max_attempts=3):
    password = "python123"
    for attempt in range(max_attempts):
        user_input = input(f"Enter password (Attempt {attempt+1}/{max_attempts}): ")
        if user_input == password:
            print("Access granted!")
            return True
        elif attempt < max_attempts - 1:
            print(f"Incorrect. {max_attempts - attempt - 1} attempts left.")
    else:
        print("Account locked")
        return False

validate_password()
```

### Hands-On Exercises:
1. Multiplication tables using nested loops
2. Password validator with retry limit
3. Filter list data using loops with conditions
4. Find prime numbers in range

### Teaching Approach:
- **Code tracing**: Students trace code mentally
- **Progressive scaffolding**: "I do, you watch" → "You do, I help"
- **Parsons problems**: Reorder scrambled loop code
- **Peer instruction**: Discuss loop output in pairs

### Assessment:
- Practical: Implement search for value in nested list
  ```python
  data = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  # Find 5 using nested loops
  ```
- Quiz: 10 questions on loop logic

### Key Metrics:
- 80% students understand loop control statements
- 85% complete practical exercises
- Average quiz score: 75%+

---

## Week 4: Functions Fundamentals

**Duration**: 6 hours

### Topics Covered:

#### Function Definition and Calling
```python
# Basic function
def greet():
    print("Hello!")

greet()  # Calling the function

# Function with parameters
def greet_person(name):
    print(f"Hello, {name}!")

greet_person("Alice")
greet_person("Bob")
```

#### Parameters and Arguments
```python
# Positional arguments
def add(a, b):
    return a + b

result = add(5, 3)  # a=5, b=3

# Keyword arguments
result = add(b=3, a=5)  # Order doesn't matter

# Default parameters
def greet_with_default(name="Guest"):
    print(f"Hello, {name}!")

greet_with_default()  # Uses default "Guest"
greet_with_default("Alice")  # Uses "Alice"

# Mixed arguments
def describe_person(name, age=30, city="Unknown"):
    print(f"{name}, {age}, {city}")

describe_person("Alice")  # age and city use defaults
describe_person("Bob", 25)  # city uses default
describe_person("Charlie", 35, "NYC")  # All specified
```

#### Return Statements
```python
# Return single value
def multiply(a, b):
    return a * b

result = multiply(4, 5)

# Return multiple values (tuple)
def get_person_info():
    name = "Alice"
    age = 30
    city = "NYC"
    return name, age, city

# Unpacking
name, age, city = get_person_info()

# Return None
def save_data(data):
    # Save to file...
    return  # Returns None

result = save_data({})
print(result)  # Output: None
```

#### Variable Scope
```python
# Global variable
global_var = 10

def modify_global():
    global global_var  # Must declare to modify
    global_var = 20
    local_var = 30
    print(f"Inside: global={global_var}, local={local_var}")

modify_global()  # Output: Inside: global=20, local=30
print(global_var)  # Output: 20
print(local_var)  # NameError: local_var not defined

# Local scope
def local_example():
    x = 5  # Local to function
    return x

result = local_example()
print(x)  # NameError: x is not defined
```

### Common Errors:
1. Assigning result of `list.reverse()` (returns None)
2. Forgetting `return` statement
3. Using `=` in function call (syntax error)
4. Modifying global without `global` keyword

### Worked Examples:

**Example 1: Calculator Functions**
```python
def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

def divide(a, b):
    if b == 0:
        return None  # Error handling
    return a / b

def calculate(a, b, operation):
    if operation == "+":
        return add(a, b)
    elif operation == "-":
        return subtract(a, b)
    # ... etc
```

**Example 2: Function with Default Parameters**
```python
def create_user(username, password, email="", role="user"):
    """Create user with default values"""
    user = {
        "username": username,
        "password": password,
        "email": email,
        "role": role
    }
    return user

# Different calls
user1 = create_user("alice", "pass123")
user2 = create_user("bob", "pass456", "bob@example.com")
user3 = create_user("charlie", "pass789", "charlie@example.com", "admin")
```

### Hands-On Exercises:
1. Create calculator function with multiple operations
2. Build function with default parameters
3. Implement functions returning multiple values
4. Create utility module with 3+ functions

### Teaching Approach:
- **Minimal examples**: Show one concept per function
- **Worked examples**: Demonstrate with detailed subgoals
- **Live coding**: Build functions step-by-step while students watch
- **Hands-on**: Students write functions with guidance

### Assessment:
- Practical: Create temperature conversion module
  ```python
  def celsius_to_fahrenheit(c): ...
  def fahrenheit_to_celsius(f): ...
  def celsius_to_kelvin(c): ...
  ```
- Quiz: 10 questions on functions

### Key Metrics:
- 85% students write functions with correct syntax
- 80% understand parameter passing
- 75% manage scope correctly

---

## Week 5: String Operations and Manipulation

**Duration**: 6 hours

### Topics Covered:

#### String Indexing and Slicing
```python
text = "Python"

# Positive indexing
print(text[0])    # "P"
print(text[3])    # "h"

# Negative indexing
print(text[-1])   # "n"
print(text[-3])   # "h"

# Slicing
print(text[0:3])   # "Pyt" (start:stop)
print(text[3:])    # "hon" (from index 3 to end)
print(text[:3])    # "Pyt" (start to index 3)
print(text[::2])   # "Pto" (every 2nd character)
print(text[::-1])  # "nohtyP" (reverse)
```

#### String Methods
```python
text = "  Python Programming  "

# Case methods
print(text.upper())       # "  PYTHON PROGRAMMING  "
print(text.lower())       # "  python programming  "
print(text.title())       # "  Python Programming  "
print(text.capitalize())  # "  python programming  "

# Whitespace
print(text.strip())       # "Python Programming"
print(text.lstrip())      # "Python Programming  "
print(text.rstrip())      # "  Python Programming"

# Searching
text2 = "Hello World"
print(text2.find("World"))       # 6
print(text2.find("xyz"))         # -1 (not found)
print(text2.startswith("Hello")) # True
print(text2.endswith("ld"))      # True
print(text2.count("l"))          # 3

# Replacing
print(text2.replace("World", "Python"))  # "Hello Python"

# Splitting and joining
words = "one,two,three".split(",")  # ["one", "two", "three"]
result = "-".join(words)             # "one-two-three"
```

#### String Formatting
```python
name = "Alice"
age = 30
score = 95.567

# f-strings (modern, recommended)
print(f"{name} is {age} years old")
print(f"Score: {score:.1f}")  # 1 decimal place
print(f"Score: {score:.0f}")  # No decimal places

# .format() method
print("{} is {} years old".format(name, age))
print("{name} is {age} years old".format(name=name, age=age))

# % formatting (legacy)
print("%s is %d years old" % (name, age))
```

### Worked Examples:

**Example 1: Email Validator**
```python
def validate_email(email):
    """Validate email format"""
    email = email.strip().lower()
    
    if "@" not in email:
        return False, "Missing @ symbol"
    
    if email.count("@") > 1:
        return False, "Multiple @ symbols"
    
    parts = email.split("@")
    username, domain = parts[0], parts[1]
    
    if len(username) == 0:
        return False, "Empty username"
    
    if "." not in domain:
        return False, "Invalid domain"
    
    return True, "Valid email"

# Test
is_valid, message = validate_email("  john.doe@example.com  ")
print(f"Valid: {is_valid}, Message: {message}")
```

**Example 2: CSV Parser**
```python
def parse_csv_line(line):
    """Parse CSV line into fields"""
    # Remove whitespace
    line = line.strip()
    
    # Split by comma
    fields = line.split(",")
    
    # Clean each field
    clean_fields = [field.strip() for field in fields]
    
    return clean_fields

# Test
csv_line = "Alice, 30, Engineer, 95000"
fields = parse_csv_line(csv_line)
# Output: ["Alice", "30", "Engineer", "95000"]
```

### Hands-On Exercises:
1. Parse and format user input
2. Build text analyzer (word count, unique chars)
3. Create URL parser (extract protocol, domain, path)
4. Implement password strength checker

### Teaching Approach:
- **Live demonstration**: Show string methods with real data
- **Paired practice**: Students work in pairs on exercises
- **Interactive examples**: Use input() to get real strings

### Assessment:
- Practical: Build email validator with validation rules
- Quiz: 10 questions on string operations

### Key Metrics:
- 85% students master string slicing
- 80% use appropriate string methods
- 75% format strings correctly

---

## Week 6: List Processing and Comprehensions

**Duration**: 6 hours

### Topics Covered:

#### List Methods
```python
numbers = [3, 1, 4, 1, 5, 9, 2, 6]

# Add elements
numbers.append(5)  # Add to end
numbers.insert(0, 0)  # Insert at position
numbers.extend([7, 8])  # Add multiple

# Remove elements
numbers.remove(1)  # Remove first occurrence
numbers.pop()  # Remove last element
numbers.pop(0)  # Remove first element
numbers.clear()  # Remove all

# Find elements
index = numbers.index(4)  # Find first index
count = numbers.count(1)  # Count occurrences

# Sort/Reverse
numbers.sort()  # Sort in place
numbers.reverse()  # Reverse in place
```

#### List Comprehensions
```python
# Basic comprehension
squares = [x**2 for x in range(5)]
# Output: [0, 1, 4, 9, 16]

# With condition
evens = [x for x in range(10) if x % 2 == 0]
# Output: [0, 2, 4, 6, 8]

# Nested comprehension
matrix = [[i*j for j in range(3)] for i in range(3)]
# Output: [[0, 0, 0], [0, 1, 2], [0, 2, 4]]

# String operations
words = ["hello", "world"]
upper_words = [w.upper() for w in words]
# Output: ["HELLO", "WORLD"]

# Multiple conditions
result = [x for x in range(10) if x % 2 == 0 if x % 3 == 0]
# Output: [0, 6]
```

#### Copying Lists
```python
original = [1, 2, 3]

# Shallow copy
copy1 = original.copy()
copy2 = original[:]

# Modify copy doesn't affect original
copy1[0] = 999
print(original)  # [1, 2, 3] (unchanged)

# Deep copy for nested lists
import copy
nested = [[1, 2], [3, 4]]
deep_copy = copy.deepcopy(nested)
```

### Worked Examples:

**Example 1: Data Transformation**
```python
# Transform grades to pass/fail
grades = [85, 92, 78, 64, 95, 71]
results = ["PASS" if grade >= 70 else "FAIL" for grade in grades]
# Output: ["PASS", "PASS", "PASS", "FAIL", "PASS", "FAIL"]

# Extract numbers from strings
data = ["10kg", "20kg", "30kg"]
weights = [int(item[:-2]) for item in data]
# Output: [10, 20, 30]
```

**Example 2: Matrix Operations**
```python
# Create 3x3 matrix
matrix = [[i*3 + j for j in range(3)] for i in range(3)]
# [[0, 1, 2], [3, 4, 5], [6, 7, 8]]

# Sum each row
row_sums = [sum(row) for row in matrix]
# [3, 12, 21]

# Transpose matrix
transposed = [[matrix[i][j] for i in range(3)] for j in range(3)]
```

### Hands-On Exercises:
1. Convert loops to list comprehensions
2. Filter and transform data
3. Create matrices and perform operations
4. Build nested comprehensions

### Teaching Approach:
- **Before/After**: Show loop version then comprehension version
- **Scaffolding**: Start simple, add conditions gradually
- **Performance**: Show comprehensions are faster than loops

### Assessment:
- Practical: Transform dataset using comprehensions
- Quiz: Convert 5 loops to comprehensions

### Key Metrics:
- 80% prefer comprehensions for transformations
- 75% write syntactically correct comprehensions
- 70% understand nested comprehensions

---

## Week 7: Functions Advanced – Lambda, Map, and Filter

**Duration**: 6 hours

### Topics Covered:

#### Lambda Functions
```python
# Basic lambda
add = lambda x, y: x + y
print(add(5, 3))  # 8

# Lambda with condition
max_value = lambda x, y: x if x > y else y
print(max_value(10, 5))  # 10

# Using with built-ins
numbers = [1, 2, 3, 4, 5]
doubled = list(map(lambda x: x * 2, numbers))
# Output: [2, 4, 6, 8, 10]
```

#### Map Function
```python
numbers = [1, 2, 3, 4, 5]

# Double each number
doubled = list(map(lambda x: x * 2, numbers))

# Convert strings to integers
strings = ["1", "2", "3"]
integers = list(map(int, strings))

# Map with multiple iterables
a = [1, 2, 3]
b = [4, 5, 6]
sums = list(map(lambda x, y: x + y, a, b))
# Output: [5, 7, 9]
```

#### Filter Function
```python
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Filter even numbers
evens = list(filter(lambda x: x % 2 == 0, numbers))
# Output: [2, 4, 6, 8, 10]

# Filter numbers > 5
above_five = list(filter(lambda x: x > 5, numbers))
# Output: [6, 7, 8, 9, 10]
```

#### Reduce Function
```python
from functools import reduce

numbers = [1, 2, 3, 4, 5]

# Calculate product
product = reduce(lambda x, y: x * y, numbers)
# 1*2*3*4*5 = 120

# Find maximum
maximum = reduce(lambda x, y: x if x > y else y, numbers)
# 5
```

### Worked Examples:

**Example 1: Data Processing Pipeline**
```python
# Process student data
students = [
    {"name": "Alice", "grade": 85},
    {"name": "Bob", "grade": 72},
    {"name": "Charlie", "grade": 95},
    {"name": "Diana", "grade": 68}
]

# Filter: Get students with grade > 75
passed = list(filter(lambda s: s["grade"] > 75, students))

# Map: Get names of passed students
names = list(map(lambda s: s["name"], passed))
# Output: ["Alice", "Charlie"]
```

**Example 2: Data Transformation**
```python
# CSV lines to dictionaries
csv_lines = [
    "Alice,30,Engineer",
    "Bob,25,Designer",
    "Charlie,35,Manager"
]

def parse_line(line):
    parts = line.split(",")
    return {
        "name": parts[0],
        "age": int(parts[1]),
        "role": parts[2]
    }

# Transform using map
people = list(map(parse_line, csv_lines))
```

### Hands-On Exercises:
1. Transform data using map() with lambda
2. Filter lists using filter() and lambda
3. Combine map and filter for complex operations
4. Use reduce() for aggregations

### Teaching Approach:
- **Comparison**: Show loop version vs. functional version
- **Building blocks**: Lambda → map → filter → chain
- **Real data**: Use actual datasets for examples

### Assessment:
- Practical: Build data processing pipeline
- Quiz: Convert loops to map/filter/lambda

### Key Metrics:
- 75% understand lambda syntax
- 70% use map() and filter() correctly
- 65% prefer functional approach when appropriate

---

## Week 8: Generators and Iterators

**Duration**: 6 hours

### Topics Covered:

#### Iterators
```python
# Create iterator
numbers = iter([1, 2, 3])

# Use next()
print(next(numbers))  # 1
print(next(numbers))  # 2
print(next(numbers))  # 3
# next(numbers)  # StopIteration exception

# Iterator protocol
class CountUp:
    def __init__(self, n):
        self.n = n
        self.current = 0
    
    def __iter__(self):
        return self
    
    def __next__(self):
        if self.current < self.n:
            self.current += 1
            return self.current
        else:
            raise StopIteration

# Use
counter = CountUp(3)
for num in counter:
    print(num)  # 1, 2, 3
```

#### Generators
```python
# Simple generator
def countdown(n):
    while n > 0:
        yield n
        n -= 1

# Use
for num in countdown(3):
    print(num)  # 3, 2, 1

# Generator expression
squares = (x**2 for x in range(5))
print(next(squares))  # 0
print(next(squares))  # 1

# Fibonacci generator
def fibonacci():
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b

# Infinite generator
fib = fibonacci()
print(next(fib))  # 0
print(next(fib))  # 1
print(next(fib))  # 1
print(next(fib))  # 2
```

#### Memory Efficiency
```python
# List: stores all values in memory
big_list = [i**2 for i in range(1000000)]

# Generator: computes values on-demand
big_gen = (i**2 for i in range(1000000))

# Generator uses memory only when iterating
for num in big_gen:
    process(num)
```

### Worked Examples:

**Example 1: File Line Generator**
```python
def read_large_file(filepath):
    """Read file line-by-line without loading entire file"""
    with open(filepath, 'r') as file:
        for line in file:
            yield line.strip()

# Use
for line in read_large_file("huge_file.txt"):
    print(line)  # Process one line at a time
```

**Example 2: Infinite Number Generator**
```python
def infinite_counter(start=0):
    """Generate infinite counting numbers"""
    current = start
    while True:
        yield current
        current += 1

# Use with take function
def take(iterable, n):
    """Take first n items from iterable"""
    result = []
    for i, item in enumerate(iterable):
        if i >= n:
            break
        result.append(item)
    return result

# Get first 5 numbers
first_five = take(infinite_counter(), 5)
# [0, 1, 2, 3, 4]
```

### Hands-On Exercises:
1. Create generator functions
2. Process large files with generators
3. Build generator expressions
4. Compare memory usage with lists

### Teaching Approach:
- **Visualization**: Show how yield pauses and resumes
- **Comparison**: Generator vs. list memory usage
- **Real use case**: File processing

### Assessment:
- Practical: Create file processor using generators
- Quiz: Understand yield vs. return

### Key Metrics:
- 70% understand generator concept
- 75% write basic generators
- 65% use generators for file processing

---

## Week 9: Exception Handling

**Duration**: 6 hours

### Topics Covered:

#### Exception Basics
```python
# Common exceptions
try:
    x = 1 / 0
except ZeroDivisionError:
    print("Cannot divide by zero")

try:
    int("hello")
except ValueError:
    print("Invalid number format")

try:
    lst = [1, 2, 3]
    lst[10]
except IndexError:
    print("Index out of range")

try:
    d = {}
    d["missing"]
except KeyError:
    print("Key not found")
```

#### Try-Except-Else-Finally
```python
try:
    number = int(input("Enter number: "))
    result = 10 / number
except ValueError:
    print("Invalid input")
except ZeroDivisionError:
    print("Cannot divide by zero")
else:
    print(f"Result: {result}")  # Runs only if no exception
finally:
    print("Cleanup code")  # Always runs

# Output for input "5":
# Result: 2.0
# Cleanup code

# Output for input "0":
# Cannot divide by zero
# Cleanup code
```

#### Raising Exceptions
```python
def validate_age(age):
    if age < 0:
        raise ValueError("Age cannot be negative")
    if age > 150:
        raise ValueError("Age seems unrealistic")
    return age

try:
    validate_age(-5)
except ValueError as e:
    print(f"Error: {e}")
```

### Worked Examples:

**Example 1: Input Validation with Exception Handling**
```python
def get_positive_number(prompt):
    """Get positive number from user, with retry logic"""
    while True:
        try:
            value = float(input(prompt))
            if value < 0:
                raise ValueError("Number must be positive")
            return value
        except ValueError as e:
            print(f"Invalid input: {e}. Please try again.")

# Use
num = get_positive_number("Enter positive number: ")
```

**Example 2: Safe File Processing**
```python
def process_file(filepath):
    """Process file safely with proper error handling"""
    try:
        with open(filepath, 'r') as file:
            data = file.read()
        lines = data.split('\n')
        print(f"Processed {len(lines)} lines")
    except FileNotFoundError:
        print(f"File not found: {filepath}")
    except IOError as e:
        print(f"Error reading file: {e}")
    finally:
        print("File processing complete")
```

### Hands-On Exercises:
1. Build input validation with exception handling
2. Handle file operation errors
3. Create robust mathematical operations
4. Implement custom error messages

### Teaching Approach:
- **Error progression**: Small errors → demonstrate handling
- **Real scenarios**: Show file, network, conversion errors
- **Best practices**: Don't catch all exceptions silently

### Assessment:
- Practical: Build calculator with exception handling
- Quiz: Match exception types to errors

### Key Metrics:
- 80% use try-except correctly
- 75% understand exception hierarchy
- 70% implement finally clause appropriately

---

## Week 10: File Handling

**Duration**: 6 hours

### Topics Covered:

#### File Operations Basics
```python
# Open and close
file = open("data.txt", "r")  # Read mode
file.close()  # Must close manually

# Context manager (automatic closing)
with open("data.txt", "r") as file:
    data = file.read()
# File automatically closed
```

#### Reading Files
```python
# Read entire file
with open("data.txt", "r") as file:
    content = file.read()

# Read one line
with open("data.txt", "r") as file:
    line = file.readline()

# Read all lines as list
with open("data.txt", "r") as file:
    lines = file.readlines()

# Iterate line by line
with open("data.txt", "r") as file:
    for line in file:
        print(line.strip())
```

#### Writing Files
```python
# Write mode (overwrites)
with open("output.txt", "w") as file:
    file.write("Hello\n")
    file.write("World\n")

# Append mode
with open("output.txt", "a") as file:
    file.write("New line\n")

# Write multiple lines
lines = ["Line 1", "Line 2", "Line 3"]
with open("output.txt", "w") as file:
    file.writelines([line + "\n" for line in lines])
```

### Worked Examples:

**Example 1: CSV File Processor**
```python
def process_csv(input_file, output_file):
    """Read CSV, filter, and write results"""
    try:
        with open(input_file, 'r') as infile:
            with open(output_file, 'w') as outfile:
                for line in infile:
                    parts = line.strip().split(',')
                    
                    # Filter (keep only rows with value > 50)
                    if len(parts) >= 2:
                        try:
                            value = int(parts[1])
                            if value > 50:
                                outfile.write(line)
                        except ValueError:
                            pass  # Skip non-numeric rows
                
                print(f"Processed {input_file} → {output_file}")
    except FileNotFoundError:
        print(f"Error: {input_file} not found")
    except IOError as e:
        print(f"Error: {e}")
```

**Example 2: Log File Analyzer**
```python
def analyze_log_file(logfile):
    """Count error types in log file"""
    error_counts = {}
    
    try:
        with open(logfile, 'r') as file:
            for line in file:
                if "ERROR" in line:
                    # Extract error type
                    parts = line.split(":")
                    if len(parts) > 1:
                        error_type = parts[1].strip()
                        error_counts[error_type] = error_counts.get(error_type, 0) + 1
        
        # Print summary
        for error, count in sorted(error_counts.items()):
            print(f"{error}: {count}")
            
    except FileNotFoundError:
        print(f"Log file not found: {logfile}")
```

### Hands-On Exercises:
1. Read and process text files
2. Create log file writer
3. Build CSV parser
4. Implement data file merger

### Teaching Approach:
- **Always use context managers**: with statement
- **Error handling**: FileNotFoundError, IOError
- **Real files**: Use actual files students create

### Assessment:
- Practical: Build log analyzer
- Quiz: File modes and operations

### Key Metrics:
- 85% use context managers
- 80% handle file errors
- 75% parse structured data

---

## Week 11: Object-Oriented Programming – Classes and Objects

**Duration**: 6 hours

### Topics Covered:

#### Class Definition and Instantiation
```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    
    def greet(self):
        print(f"Hello, I'm {self.name}")

# Create instances
person1 = Person("Alice", 30)
person2 = Person("Bob", 25)

# Access attributes
print(person1.name)  # "Alice"

# Call methods
person1.greet()  # "Hello, I'm Alice"
```

#### Instance Variables and Methods
```python
class BankAccount:
    def __init__(self, owner, balance=0):
        self.owner = owner
        self.balance = balance
    
    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            return f"Deposited {amount}"
        return "Invalid amount"
    
    def withdraw(self, amount):
        if amount > self.balance:
            return "Insufficient funds"
        self.balance -= amount
        return f"Withdrew {amount}"
    
    def get_balance(self):
        return f"Balance: {self.balance}"

# Use
account = BankAccount("Alice", 1000)
print(account.deposit(500))     # "Deposited 500"
print(account.withdraw(200))    # "Withdrew 200"
print(account.get_balance())    # "Balance: 1300"
```

#### Class Variables
```python
class Employee:
    company = "Tech Corp"  # Class variable (shared)
    count = 0
    
    def __init__(self, name):
        self.name = name  # Instance variable
        Employee.count += 1
    
    def display(self):
        print(f"{self.name} works at {self.company}")

# Create instances
emp1 = Employee("Alice")
emp2 = Employee("Bob")

print(Employee.count)  # 2 (class variable)
emp1.display()  # "Alice works at Tech Corp"
```

### Worked Examples:

**Example 1: Student Class**
```python
class Student:
    def __init__(self, name, student_id, grade):
        self.name = name
        self.student_id = student_id
        self.grade = grade
        self.grades = []
    
    def add_grade(self, grade):
        if 0 <= grade <= 100:
            self.grades.append(grade)
        else:
            print("Invalid grade")
    
    def average(self):
        if not self.grades:
            return 0
        return sum(self.grades) / len(self.grades)
    
    def __str__(self):
        avg = self.average()
        return f"{self.name} (ID: {self.student_id}) - Average: {avg:.1f}"

# Use
student = Student("Alice", "S001", 90)
student.add_grade(92)
student.add_grade(88)
print(student)  # "Alice (ID: S001) - Average: 90.0"
```

**Example 2: Product Inventory**
```python
class Product:
    def __init__(self, name, price, quantity):
        self.name = name
        self.price = price
        self.quantity = quantity
    
    def restock(self, amount):
        self.quantity += amount
    
    def sell(self, amount):
        if amount <= self.quantity:
            self.quantity -= amount
            return f"Sold {amount} units"
        return "Not enough stock"
    
    def total_value(self):
        return self.price * self.quantity

# Use
product = Product("Laptop", 999.99, 10)
print(product.sell(2))  # "Sold 2 units"
print(product.total_value())  # 7999.92
```

### Hands-On Exercises:
1. Create Person class with methods
2. Build BankAccount class with transactions
3. Implement Product inventory system
4. Design Student grade management system

### Teaching Approach:
- **Tangible examples**: Classes represent real-world objects
- **Incremental building**: Start simple, add methods gradually
- **Visual diagrams**: Show object structure with attributes

### Assessment:
- Practical: Create a complete class with multiple methods
- Quiz: Class vs. instance concepts

### Key Metrics:
- 80% write syntactically correct classes
- 75% understand __init__ method
- 70% implement appropriate methods

---

## Week 12: Object-Oriented Programming – Inheritance

**Duration**: 6 hours

### Topics Covered:

#### Inheritance Basics
```python
class Animal:
    def __init__(self, name):
        self.name = name
    
    def speak(self):
        return "Some sound"

class Dog(Animal):
    def speak(self):
        return f"{self.name} barks: Woof!"

class Cat(Animal):
    def speak(self):
        return f"{self.name} meows: Meow!"

# Use
dog = Dog("Max")
cat = Cat("Whiskers")

print(dog.speak())   # "Max barks: Woof!"
print(cat.speak())   # "Whiskers meows: Meow!"
```

#### Using super()
```python
class Vehicle:
    def __init__(self, brand, color):
        self.brand = brand
        self.color = color
    
    def info(self):
        return f"{self.color} {self.brand}"

class Car(Vehicle):
    def __init__(self, brand, color, doors):
        super().__init__(brand, color)
        self.doors = doors
    
    def info(self):
        return f"{super().info()} with {self.doors} doors"

# Use
car = Car("Toyota", "Red", 4)
print(car.info())  # "Red Toyota with 4 doors"
```

#### Encapsulation
```python
class BankAccount:
    def __init__(self, owner, balance):
        self.owner = owner
        self._balance = balance  # Protected (convention)
    
    def deposit(self, amount):
        if amount > 0:
            self._balance += amount
    
    def withdraw(self, amount):
        if amount <= self._balance:
            self._balance -= amount
    
    @property
    def balance(self):
        return self._balance
    
    @balance.setter
    def balance(self, amount):
        if amount >= 0:
            self._balance = amount

# Use
account = BankAccount("Alice", 1000)
account.deposit(500)
print(account.balance)  # 1500
account.balance = 2000  # Using property setter
```

### Worked Examples:

**Example 1: Shape Hierarchy**
```python
import math

class Shape:
    def area(self):
        raise NotImplementedError
    
    def perimeter(self):
        raise NotImplementedError

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius
    
    def area(self):
        return math.pi * self.radius ** 2
    
    def perimeter(self):
        return 2 * math.pi * self.radius

class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height
    
    def area(self):
        return self.width * self.height
    
    def perimeter(self):
        return 2 * (self.width + self.height)

# Polymorphism in action
shapes = [Circle(5), Rectangle(4, 6)]
for shape in shapes:
    print(f"Area: {shape.area():.2f}")
```

**Example 2: Employee Hierarchy**
```python
class Employee:
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary
    
    def calculate_bonus(self):
        return self.salary * 0.05

class Manager(Employee):
    def __init__(self, name, salary, team_size):
        super().__init__(name, salary)
        self.team_size = team_size
    
    def calculate_bonus(self):
        base_bonus = super().calculate_bonus()
        return base_bonus + (self.team_size * 100)

class Developer(Employee):
    def __init__(self, name, salary, skills):
        super().__init__(name, salary)
        self.skills = skills
    
    def calculate_bonus(self):
        base_bonus = super().calculate_bonus()
        return base_bonus + (len(self.skills) * 50)

# Use
emp = Employee("John", 50000)
mgr = Manager("Alice", 80000, 5)
dev = Developer("Bob", 70000, ["Python", "JavaScript", "SQL"])

print(f"Employee bonus: {emp.calculate_bonus()}")
print(f"Manager bonus: {mgr.calculate_bonus()}")
print(f"Developer bonus: {dev.calculate_bonus()}")
```

### Hands-On Exercises:
1. Create Animal subclasses with method overriding
2. Build Vehicle inheritance hierarchy
3. Implement Shape classes with polymorphism
4. Create Employee management system

### Teaching Approach:
- **is-a relationships**: Inheritance represents "is-a" relationship
- **Method overriding**: Show how subclasses customize behavior
- **Polymorphism**: Show different objects responding to same method

### Assessment:
- Practical: Create inheritance hierarchy (5+ classes)
- Quiz: Inheritance concepts and super()

### Key Metrics:
- 75% understand inheritance concept
- 70% use super() correctly
- 65% implement polymorphism

---

## Week 13: Modules and Packages

**Duration**: 6 hours

### Topics Covered:

#### Creating Modules
```python
# math_utils.py (module file)
def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

PI = 3.14159

# main.py (using the module)
import math_utils

result = math_utils.add(10, 5)
print(result)  # 15
```

#### Import Methods
```python
# Method 1: import entire module
import math_utils
result = math_utils.add(5, 3)

# Method 2: from...import specific items
from math_utils import add, subtract
result = add(5, 3)

# Method 3: import with alias
import math_utils as mu
result = mu.add(5, 3)

# Method 4: import all (not recommended)
from math_utils import *
result = add(5, 3)
```

#### Built-in Modules
```python
import os
print(os.getcwd())  # Current directory
os.listdir(".")  # Files in directory

import sys
print(sys.version)  # Python version
print(sys.path)  # Module search paths

import math
print(math.sqrt(16))  # 4.0
print(math.pi)  # 3.14159...

import random
print(random.randint(1, 10))  # Random number
items = [1, 2, 3]
random.shuffle(items)  # Shuffle in-place

import datetime
now = datetime.datetime.now()
print(now.year)  # 2024
```

#### Packages
```python
# Directory structure:
# mypackage/
#   __init__.py
#   module1.py
#   module2.py
#   subpackage/
#     __init__.py
#     module3.py

# Import from package
from mypackage import module1
from mypackage.module2 import some_function
from mypackage.subpackage import module3
```

### Worked Examples:

**Example 1: String Utilities Module**
```python
# string_utils.py
def reverse(text):
    return text[::-1]

def is_palindrome(text):
    clean = text.lower().replace(" ", "")
    return clean == clean[::-1]

def count_words(text):
    return len(text.split())

def word_frequency(text):
    """Count frequency of each word"""
    words = text.lower().split()
    freq = {}
    for word in words:
        freq[word] = freq.get(word, 0) + 1
    return freq

# Use
from string_utils import is_palindrome, word_frequency

text = "racecar"
print(is_palindrome(text))  # True

freq = word_frequency("the quick brown fox")
print(freq)  # {"the": 1, "quick": 1, ...}
```

**Example 2: Using Standard Modules**
```python
import os
import json
from datetime import datetime

# Get current time
now = datetime.now()
timestamp = now.strftime("%Y-%m-%d %H:%M:%S")

# Create data
data = {
    "name": "Example",
    "timestamp": timestamp,
    "files": os.listdir(".")
}

# Save to file
with open("log.json", "w") as f:
    json.dump(data, f, indent=2)

print(f"Saved at {timestamp}")
```

### Hands-On Exercises:
1. Create utility module with multiple functions
2. Build a package with submodules
3. Use built-in modules (os, sys, math, datetime)
4. Create configuration module with constants

### Teaching Approach:
- **Organization**: Show how modules organize code
- **Reusability**: Import modules across projects
- **Standard library**: Explore useful built-in modules

### Assessment:
- Practical: Create a complete module with 5+ functions
- Quiz: Import methods and package structure

### Key Metrics:
- 80% create modules correctly
- 75% use built-in modules effectively
- 70% understand package structure

---

## Week 14: Advanced String Processing and Regular Expressions

**Duration**: 6 hours

### Topics Covered:

#### Regular Expression Basics
```python
import re

text = "Contact: john@example.com or jane@test.org"

# Find all emails
emails = re.findall(r'\w+@\w+\.\w+', text)
print(emails)  # ['john@example.com', 'jane@test.org']

# Check if matches
if re.search(r'\d+', "Price: $99"):
    print("Found number")

# Replace
text2 = re.sub(r'\d+', 'X', "I have 5 apples and 3 oranges")
print(text2)  # "I have X apples and X oranges"
```

#### Pattern Basics
```python
import re

# Character classes
pattern = r'[a-z]'      # Any lowercase letter
pattern = r'[A-Z]'      # Any uppercase letter
pattern = r'[0-9]'      # Any digit
pattern = r'[a-zA-Z0-9]'  # Alphanumeric
pattern = r'\w'         # Word character (alphanumeric + _)
pattern = r'\d'         # Digit
pattern = r'\s'         # Whitespace

# Quantifiers
pattern = r'a+'         # One or more 'a'
pattern = r'a*'         # Zero or more 'a'
pattern = r'a?'         # Zero or one 'a'
pattern = r'a{3}'       # Exactly 3 'a's
pattern = r'a{2,4}'     # 2 to 4 'a's

# Anchors
pattern = r'^start'     # Start of string
pattern = r'end$'       # End of string
```

### Worked Examples:

**Example 1: Email Validator with Regex**
```python
import re

def is_valid_email(email):
    # Pattern: username@domain.extension
    pattern = r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    return bool(re.match(pattern, email))

# Test
test_emails = [
    "john.doe@example.com",  # Valid
    "jane@test.co.uk",       # Valid
    "invalid.email",          # Invalid (no @)
    "user@.com",             # Invalid (no domain)
    "@example.com",          # Invalid (no username)
]

for email in test_emails:
    print(f"{email}: {is_valid_email(email)}")
```

**Example 2: Log File Parser**
```python
import re

def parse_log_line(line):
    """Extract info from log line"""
    # Pattern: YYYY-MM-DD HH:MM:SS LEVEL MESSAGE
    pattern = r'(\d{4}-\d{2}-\d{2}) (\d{2}:\d{2}:\d{2}) (\w+) (.*)'
    
    match = re.match(pattern, line)
    if match:
        return {
            "date": match.group(1),
            "time": match.group(2),
            "level": match.group(3),
            "message": match.group(4)
        }
    return None

# Test
log = "2024-01-15 10:30:45 ERROR Connection failed"
parsed = parse_log_line(log)
print(parsed)
# {"date": "2024-01-15", "time": "10:30:45", "level": "ERROR", "message": "Connection failed"}
```

### Hands-On Exercises:
1. Validate email addresses with regex
2. Extract data from formatted text
3. Clean and normalize data using substitutions
4. Parse structured text (logs, CSV with regex)

### Teaching Approach:
- **Incremental patterns**: Simple first, then complex
- **Visualization**: Show what each pattern matches
- **Real data**: Use actual logs/emails/text

### Assessment:
- Practical: Build email/phone validator
- Quiz: Pattern matching and groups

### Key Metrics:
- 70% understand regex patterns
- 65% use regex for validation
- 60% extract data with groups

---

## Week 15: Decorators and Advanced Functions

**Duration**: 6 hours

### Topics Covered:

#### Function Decorators
```python
def my_decorator(func):
    def wrapper(*args, **kwargs):
        print(f"Calling {func.__name__}")
        result = func(*args, **kwargs)
        print(f"Done")
        return result
    return wrapper

@my_decorator
def greet(name):
    print(f"Hello, {name}!")

greet("Alice")
# Output:
# Calling greet
# Hello, Alice!
# Done
```

#### Decorators with Arguments
```python
def repeat(times):
    def decorator(func):
        def wrapper(*args, **kwargs):
            results = []
            for _ in range(times):
                results.append(func(*args, **kwargs))
            return results
        return wrapper
    return decorator

@repeat(3)
def hello():
    return "Hi!"

print(hello())
# Output: ["Hi!", "Hi!", "Hi!"]
```

#### Common Decorators
```python
from functools import wraps

# Logging decorator
def log_calls(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        print(f"Calling {func.__name__} with args={args}, kwargs={kwargs}")
        return func(*args, **kwargs)
    return wrapper

# Timing decorator
import time

def timer(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(f"Took {end - start:.4f} seconds")
        return result
    return wrapper

# Use multiple decorators
@timer
@log_calls
def slow_function(n):
    time.sleep(n)
    return f"Done"

slow_function(1)
```

### Worked Examples:

**Example 1: Caching Decorator**
```python
from functools import wraps

def cache(func):
    """Cache function results"""
    cached = {}
    
    @wraps(func)
    def wrapper(n):
        if n not in cached:
            cached[n] = func(n)
        return cached[n]
    
    return wrapper

@cache
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

# Fast because of caching
print(fibonacci(100))
```

**Example 2: Authorization Decorator**
```python
from functools import wraps

def require_admin(func):
    """Check if user is admin before calling function"""
    @wraps(func)
    def wrapper(user, *args, **kwargs):
        if not user.get("is_admin"):
            raise PermissionError(f"{user['name']} is not admin")
        return func(user, *args, **kwargs)
    return wrapper

@require_admin
def delete_user(user, user_id):
    print(f"Deleted user {user_id}")

# Test
admin = {"name": "Alice", "is_admin": True}
user = {"name": "Bob", "is_admin": False}

delete_user(admin, 123)  # Works
# delete_user(user, 123)  # Raises PermissionError
```

### Hands-On Exercises:
1. Create timing decorator
2. Build logging decorator
3. Implement caching decorator
4. Create authentication decorator

### Teaching Approach:
- **Step-by-step**: Build simple decorator first
- **Visualization**: Show decorator flow
- **Real use cases**: Logging, timing, caching

### Assessment:
- Practical: Create custom decorator
- Quiz: Decorator concepts

### Key Metrics:
- 65% understand decorator concept
- 60% create basic decorators
- 55% use @wraps correctly

---

## Week 16: Comprehensive Review and Project Integration

**Duration**: 6 hours

### Topics Covered:

#### PCEP Exam Review
1. **Computer Programming Fundamentals** (18%)
   - Variables, operators, precedence
   - Input/output, type conversion
   - Comments and naming conventions

2. **Control Flow** (29%)
   - if/elif/else statements
   - Loops: while, for
   - break, continue, pass

3. **Data Collections** (25%)
   - Lists, tuples, dictionaries, sets
   - Indexing, slicing, methods
   - Iteration patterns

4. **Functions & Exceptions** (28%)
   - Function definition and calling
   - Parameters, returns, scope
   - try-except-finally blocks

#### Best Practices
```python
# PEP 8 Style Guidelines
# 1. Use meaningful variable names
student_name = "Alice"  # Good
sn = "Alice"           # Bad

# 2. Consistent indentation (4 spaces)
if condition:
    do_something()
    do_another()

# 3. Blank lines between functions
def function1():
    pass

def function2():
    pass

# 4. Comments for complex logic
# Check if number is prime
if n > 1:
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            break
    else:
        is_prime = True

# 5. Docstrings for functions
def calculate_average(numbers):
    """
    Calculate the average of a list of numbers.
    
    Args:
        numbers: List of integers or floats
    
    Returns:
        Float representing the average
    """
    return sum(numbers) / len(numbers)
```

### Capstone Project Options:

**Project 1: Student Management System**
- Features:
  - Add/remove students
  - Track grades for each student
  - Calculate class statistics (average, top student, etc.)
  - Save/load from file
- Topics: Classes, file I/O, exception handling, functions

**Project 2: Data Processing Tool**
- Features:
  - Read CSV files
  - Filter/transform data using comprehensions and map/filter
  - Generate statistics
  - Write processed data to file
- Topics: File handling, generators, functional programming

**Project 3: Text Analysis Application**
- Features:
  - Analyze text files (word count, frequency, etc.)
  - Search using regex
  - Generate reports
  - Create summary statistics
- Topics: Strings, regex, file I/O, functions

**Project 4: Personal Finance Tracker**
- Features:
  - Track income and expenses
  - Categorize transactions
  - Generate monthly/yearly reports
  - Export to file
- Topics: Classes, dictionaries, file handling, exception handling

### Code Debugging

```python
# Technique 1: Print debugging
def calculate(x):
    print(f"Input: {x}")  # Debug point
    result = x * 2
    print(f"Result: {result}")  # Debug point
    return result

# Technique 2: pdb debugger
import pdb

def problematic_function():
    x = 5
    pdb.set_trace()  # Execution pauses here
    y = x * 2
    return y

# Technique 3: Assertions
def divide(a, b):
    assert b != 0, "Divisor cannot be zero"
    return a / b
```

### Assessment:

**Final Project Evaluation**:
- Code structure (organization, readability)
- Functionality (all requirements met)
- Error handling (graceful failure)
- Documentation (comments, docstrings)
- Testing (handles edge cases)

**PCEP Practice Exam**:
- 60 questions, 60 minutes
- Mix of all topics
- Target: 70%+ (passing score)

### Key Metrics for Success:
- 85%+ students complete capstone project
- 80%+ score on final practice exam
- 75%+ demonstrate problem-solving skills
- 90%+ code follows PEP 8 style

---

# PART 3: TEACHING METHODOLOGIES

## Evidence-Based Teaching Approach

### 1. Worked Examples with Labelled Subgoals
- **What**: Step-by-step code walkthroughs highlighting key decision points
- **Why**: Reduces cognitive load, helps internalize problem-solving process
- **How**: Label each step (Subgoal 1, 2, etc.), explain reasoning verbally

### 2. Minimal Examples for Concept Isolation
- **What**: Short, complete programs focusing on single concept
- **Why**: Reduces distractions, allows quick modification and experimentation
- **How**: One concept per example, max 5-10 lines of code

### 3. Active Learning Through Peer Instruction
- **What**: Pose conceptual questions, have students discuss in pairs
- **Why**: Forces articulation, addresses misconceptions through discussion
- **How**: 1) Individual answer, 2) Pair discussion, 3) Revote, 4) Clarify

### 4. Progressive Scaffolding
- **What**: Gradual responsibility transfer from teacher to student
- **Why**: Builds confidence, prevents overwhelming beginners
- **How**: "I do, you watch" → "I do, you help" → "You do, I help" → "You do, I watch"

### 5. Problem-Based Learning
- **What**: Real-world tasks students find meaningful
- **Why**: Increases engagement and long-term retention
- **How**: Use business examples, personal projects, data analysis tasks

## Lesson Structure (6-hour weekly session)

```
Hour 1-2: Lecture & Live Coding (120 min)
  - Minimal examples introduction (10 min)
  - Worked examples with subgoals (30 min)
  - Peer instruction activities (20 min)
  - Live coding demonstration (30 min)
  - Q&A (30 min)

Hour 3: Hands-On Practice (60 min)
  - Progressive scaffolding exercises
  - Instructor circulates, provides nudges
  - Students practice with guidance

Break: 15 minutes

Hour 4: Independent Practice (60 min)
  - Students work independently
  - Instructor available for help
  - Pair programming encouraged

Hour 5: Code Review & Reflection (30 min)
  - Project 2-3 student solutions
  - Discuss different approaches
  - Celebrate good practices
```

## Student Success Strategies

### 1. Daily Practice Requirement
- **Minimum**: 30-60 minutes of coding per day
- **Structure**: Mix new concepts + review of previous topics
- **Tracking**: Log practice hours, review code regularly

### 2. Code Review Partnerships
- **Pairs**: 2-3 students review each other's work
- **Process**: Read code, identify strengths/improvements, discuss
- **Frequency**: At least weekly

### 3. Real-World Projects
- **Week 5**: Mini-project combining weeks 2-5 concepts
- **Week 10**: Mid-project with file handling and exceptions
- **Week 16**: Capstone project demonstrating mastery

### 4. Regular Feedback
- **Formative**: Weekly quizzes and practical exercises
- **Summative**: Assessment at week 5, 10, 16
- **Individual**: One-on-one check-ins for struggling students

### 5. Resource Library
- **Links**: Curated resources for each topic
- **Code**: Reference implementations students can study
- **Videos**: Recommended tutorials for additional learning

---

# PART 4: ASSESSMENT FRAMEWORK

## Formative Assessment (Weekly)

| Week | Assessment Method | Success Criteria |
|------|------------------|------------------|
| 1 | Data structure quiz + practical | 75%+ correct |
| 2 | Conditional logic exercises | 4/5 exercises correct |
| 3 | Loop control practical project | All requirements met |
| 4 | Function definition test | 8/10 correct |
| 5 | String manipulation practical | Handles edge cases |
| 6 | Comprehension exercises | 5/5 correct |
| 7 | Lambda/map/filter challenges | Complex operations work |
| 8 | Generator practical | Correct iteration behavior |
| 9 | Exception handling exercises | Error recovery works |
| 10 | File processing practical | Correct I/O operations |
| 11 | Class design test | Attributes & methods correct |
| 12 | Inheritance practical | Polymorphism works correctly |
| 13 | Module creation test | Imports and structure correct |
| 14 | Regex validation practical | Pattern matching accurate |
| 15 | Decorator exercises | Function behavior preserved |
| 16 | PCEP practice exam | 70%+ correct |

## Summative Assessment (Major Projects)

### Mini-Project (Week 5)
**Objective**: Combine conditionals, loops, functions, strings

**Possible Topics**:
- Grade calculator with detailed analysis
- Password validator with strength checking
- Text analysis tool (word count, frequency, etc.)

**Rubric**:
- Functionality (40%): All requirements work
- Code Quality (30%): Readable, well-organized
- Error Handling (20%): Graceful failures
- Documentation (10%): Comments present

### Mid-Project (Week 10)
**Objective**: Add file handling and exception management

**Possible Topics**:
- Log file analyzer with statistics
- CSV processor with validation
- Data merger from multiple files

**Rubric**: Same as mini-project plus:
- File Operations (15%): Correct read/write
- Exception Handling (15%): Comprehensive error catching

### Capstone Project (Week 16)
**Objective**: Demonstrate comprehensive mastery

**Possible Topics**: (Student choice from list in Week 16 section)

**Rubric**:
- Design (20%): Architecture and organization
- Functionality (30%): All requirements met
- Code Quality (20%): Clean, maintainable code
- Testing (15%): Handles edge cases
- Documentation (15%): Clear comments and docstrings

## PCEP Certification Preparation

### Practice Exams
- **Week 8**: First practice exam (40 questions)
- **Week 12**: Mid-point exam (50 questions)
- **Week 15**: Full-length exam (60 questions)

### Target Scores
- Week 8: 60%+ (foundational knowledge)
- Week 12: 70%+ (intermediate mastery)
- Week 15: 80%+ (ready for certification)

### Exam Strategies
- Time management: 1 minute per question
- Review difficult topics before exam
- Practice with official exam format
- Identify weak areas and study intensively

---

# PART 5: STUDENT SUCCESS METRICS

## Learning Outcomes by Week

| Week | Expected Outcome | Measurement |
|------|------------------|-------------|
| 1 | Master data structures | 90% pass data structure quiz |
| 2 | Write correct conditionals | 85% complete if-elif-else exercises |
| 3 | Use loops effectively | 85% complete loop control exercises |
| 4 | Create reusable functions | 80% write syntactically correct functions |
| 5 | Process strings | 80% use string methods appropriately |
| 6 | Use comprehensions | 80% prefer comprehensions over loops |
| 7 | Apply functional programming | 75% use lambda/map/filter correctly |
| 8 | Create generators | 70% write generators for memory efficiency |
| 9 | Handle exceptions | 80% implement try-except correctly |
| 10 | Process files | 85% use context managers |
| 11 | Design classes | 80% write well-structured classes |
| 12 | Build hierarchies | 75% implement inheritance correctly |
| 13 | Organize code | 80% create modules effectively |
| 14 | Use regex | 70% validate using regex |
| 15 | Create decorators | 65% write working decorators |
| 16 | Ready for PCEP | 80%+ on practice exam |

## Retention and Engagement Metrics

- **Attendance**: 95%+ weekly attendance
- **Homework Completion**: 90%+ submit all exercises
- **Code Quality**: 80% follow PEP 8 style guidelines
- **Peer Review**: 85% participate in code reviews
- **Project Completion**: 90% complete all projects

## Success Indicators

**Strong Progress**:
- Consistent 80%+ on assessments
- Asks thoughtful questions
- Helps other students
- Completes bonus challenges

**Needs Support**:
- 60-70% on assessments
- Limited participation
- Skips some exercises
- Struggles with independence

**At Risk**:
- Below 60% on assessments
- Frequent absences
- Incomplete work
- Requires extensive one-on-one help

## Intervention Strategies

**For Students Falling Behind**:
1. **One-on-one sessions**: Review difficult concepts
2. **Extra practice**: Customized exercises for weak areas
3. **Peer mentoring**: Pair with strong student
4. **Reduced workload**: Temporarily focus on core concepts
5. **Additional resources**: Video tutorials, extra examples

---

# CONCLUSION

This comprehensive 16-week Python training curriculum provides a structured path from complete beginner to PCEP-certified programmer. By combining proven teaching methodologies with real-world projects and frequent assessments, students develop both theoretical knowledge and practical skills.

**Key Success Factors**:
1. **Consistent daily practice**: 30-60 minutes coding every day
2. **Active learning**: Lectures combined with hands-on exercises
3. **Real projects**: Apply knowledge to meaningful problems
4. **Regular feedback**: Formative assessments guide learning
5. **Peer support**: Code reviews and pair programming

**Expected Outcomes**:
- 90%+ students ready for PCEP certification
- 80%+ pass certification exam on first attempt
- Students confident writing Python programs for real-world tasks
- Foundation for advanced Python topics (PCAP, data science, web development)

**Next Steps**:
- After PCEP: Pursue PCAP certification (Weeks 17-24)
- Advanced topics: Data science, web development, automation
- Professional development: Contribute to open-source, build portfolio

---

**Document Version**: 1.0
**Last Updated**: December 2025
**Designed For**: College graduates, professional development, certification preparation