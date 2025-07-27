# Q1:
# Write a function show_name() that prints a global variable called name.
# Then, try changing its value inside the function. What happens?

name = "Mohamed Ahmed"
def show_name():
    # global name 
    name = "mohamed"
    print(f"name after change {name}")
    

show_name()
print(name)

# --------------------------------------------------

# Q2:
# What will happen if you try to change a global variable from inside a function without using global keyword?

# global name will not change 

name = "Mohamed Ahmed"

def change():
    name = "mohamed"
    print(f"name from function {name}")

change()
print(f" global name {name}  ")


# --------------------------------------------------    

# Q3:
# Create a lambda function to multiply any number by 10.

x = lambda a : a * 10

print(x(5))

# --------------------------------------------------    

# Q4:
# Write a program that calculates your age if you were born on 2000-01-01.

import datetime
def calculate_age(d_of_birth):
    current_year = datetime.datetime.now().year
    age = current_year - d_of_birth
    return age

print(calculate_age(2000))

----

import datetime
def calculate_age(d_of_birth):
    today = datetime.date.today()
    age = today.year - d_of_birth.year

    return age

dob = datetime.date(2000, 1, 1)
print(calculate_age(dob))


# --------------------------------------------------

# Q5:
# Ask the user to enter two numbers and divide them. Handle the case when the user enters 0 as the second number.


try:
    num1 = int(input("first number: "))
    num2 = int(input("second number: "))
    result = num1 / num2
    
except ValueError:
    print("Invalid input. Please enter valid numbers.")
except ZeroDivisionError:
    print("Cannot divide by zero.")
    
else:
    print("Result:", result)


# --------------------------------------------------

# Q6:
# Write a Python program to create a file named hello.txt and write "Hello,YOUR NAME" in it.

with open("hello.txt", "w") as f:
    f.write("Hello, Mohamed Ahmed")
    
with open("hello.txt", "r") as f:
    content = f.read()
    print(content)


#-------------------------------------

# Q7:
# Write a Python program that asks the user for their name and appends it to a file called names.txt

input_name = input("Enter your name: ")

with open("names.txt", "a") as f:
    f.write(input_name + "\n")

print("Name appended to names.txt.")