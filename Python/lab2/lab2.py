# - Sum of Even Numbers in List

list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
sum = 0
for i in range(len(list1)):
    if list1[i] % 2 == 0:
        sum = sum + list1[i]
print(sum)


#-----------------------------------------------


# - Find Maximum in Tuple

tuple1 = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
x = tuple1[0]
for i in range(len(tuple1)):
    if tuple1[i] > x:
        x = tuple1[i]
print(x)


print(max(tuple1))


#-----------------------------------------------

# - Remove Duplicates Using Set

a = [1, 2, 2, 3, 4, 4, 5]
a = set(a)

print(a)


#-----------------------------------------------

# 1-Write a Function that accepts a string from user and count the number of ‘e’ characters in it.


def count_e(s):
    count = 0
    for i in range(len(s)):
        if s[i] == "e":
            count += 1
    return count
print(count_e("mohameed"))

#-----------------------------------------------

# 2- Write a function that accepts two arguments (length, start) to generate an list of a specific length filled with integer numbers increased by one from start.


def list_gen(length, start):
    return [start + i for i in range(length)]
print(list_gen(5, 2))


#-----------------------------------------------


# 3- Write a function that Ask the user for his name then confirm that he has entered his name(not an empty string/integers). then proceed to ask him for his email and print all this data (Bonus) check if it is a valid email or not.

def name_email():
    name = input("Enter your name: ")
    if name.isalpha():
        email = input("Enter your email: ")
        if "@" in email and "." in email:
            print("Name:", name)
            print("Email:", email)
        else:
            print("Invalid email format")
    else:
        print("Invalid name format")
        
name_email()


#----------------------------------------------

# 4-Write a program which repeatedly reads numbers until the user enters “done”.
#  -Once “done” is entered, print out the total, count, and
#    average of the numbers.
#  -If the user enters anything other than a number, detect their
#   mistake, print an error message and skip to the next number.




total = 0
count = 0

while True:
    user_input = input("Enter a number : ")
    if user_input == "done":
        break

    else:
        number = float(user_input)
        total += number
        count += 1
        
average = total / count
print("Total:", total)
print("Count:", count)
print("Average:", average)


#----------------------------------------


# 5- Write a function that Fill an list of 5 elements from the user, Sort it in descending and ascending orders then display the output.

def take_input():
    list1 = []
    for i in range(5):
        num = int(input(f"Enter number : "))
        list1.append(num)
    
    return f"list1 : {list1} \n sorted list : {sorted(list1, reverse=True)} \n sorted list : {sorted(list1)}"

print(take_input())


# ---------------------------------------


# 6- Write a function that take a sentence and a letter to search for it in the given sentence and return its.

def search_letter(sentence, letter):
    count = []
    for i in range(len(sentence)):
        if sentence[i] == letter:
            count.append(i)
    return count

# index list
print(search_letter("mohamed ahmed", "a"))


#-----------------------------------------


# 7- Write a function that will take an array of numbers stored and find the second lowest and second greatest numbers.

def find_second(arr):
    arr.sort()
    return arr[1], arr[-2]

print(find_second(arr=[1, 2, 3, 4, 5]))


#-----------------------------------------


# 8- Write a function that will take a number and check if it's a prime number or not

def prime(num):
    if num <= 1:
        return False
    else:
        for i in range(2, num):
            if num % i == 0:
                return False
        return True

print(prime(7))

