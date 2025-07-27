# 1- Write a Python program to swap two variables a and b without using a third variable.

# a = 5
# b = 10

# a, b = b, a

# print(f"a = {a} and b = {b}")

# -----------------------------------------

# 2- Ask the user to enter any value and print its datatype.


# inp = input("enter the value: ")
 
# # or use int, or str
# if inp.isnumeric():
#     inp = int(inp)
# elif inp.isalpha():
#     inp = str(inp)

# print(f" datatype of the input is: {type(inp)}")

# -----------------------------------------


# 3- Write a program that takes a float number from the user and converts it to an integer.

# inp = float(input("enter the value: "))

# x = int(inp)
# print(f" datatype of the input is: {type(x)}")


# -----------------------------------------

# 4- Write a program that takes a string input and prints it in reverse.

# inp = input("enter the value: ")

# print(inp[::-1])

# -----------------------------------------


# 5- Create a program that takes two numbers and an operator (+, -, *, /) from the user and prints the result.

# num1 = int(input("Enter num1: "))
# num2 = int(input("Enter num2: "))
# operator = input("Enter the operator : ")

# if operator == "+":
#     print(num1 + num2)
# elif operator == "-":
#     print(num1 - num2)
# elif operator == "*":
#     print(num1 * num2)
# elif operator == "/":
#     print(num1 / num2)
# else:
#     print("Invalid operator")


# -----------------------------------


# 6- Write a program to check if a number is even or odd.

# inp = int(input("enter the value: "))

# if inp % 2 == 0:
#     print("even")
# else:
#     print("odd")


# -----------------------------

# 7- Write a program that takes a string and checks if its length is greater than 5.

# inp = input("enter the value: ")

# if len(inp) > 5:
#     print("true")
# else:
#     print("false")

# -----------------------------


# 8- Given two numbers x and y, print True if x is greater than y and both are positive. Otherwise, print False.

# x = int(input("enter the value: "))
# y = int(input("enter the value: "))

# if x > y and x > 0 and y > 0:
#     print("true")
# else:
#     print("false")


# -----------------------------

# 9- Write a program that takes two string inputs and checks if they are equal (case insensitive).

# str1 = input("enter the value: ")
# str2 = input("enter the value: ")

# if str1.lower() == str2.lower():
#     print("true")
# else:
#     print("false")
    
# # -------------------------

# # 10- Ask the user for a number as a string, cast it to an integer, and check if it is greater than 100.

# num = input("enter the value: ")
# num = int(num)

# if num > 100:
#     print("true")
# else:
#     print("false")

#-----------------

# thislist = ["apple", "banana", "cherry"]

# newList = [x for x in thislist if "a" in x]

# print(newList)