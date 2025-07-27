#  lambda expression  - > small anonymous fun 

# x = lambda a : a + 10

# print(x(5))

# def myFun(b):
#     return b + 10


# x = lambda a , b ,c  : a + 10 + b + c

# print(x(5 , 2 , 4 ))


# def myFun(n):
#     return lambda a : a * n

# mydoubler = myFun(2)     


# print(mydoubler)

# ----------------------------------------

# name = "ali"

# def myFun():
#     name = "mohamed"
#     print(name)

# myFun()

# print(name)


# name = "ali"

# def myFun():
#     global name
#     name = "mohamed"
#     print(name)

# myFun()

# print(name)


# name = "ahmed"

# def outerFun():
#     global name
#     name = "ali"
#     def innerFun():
#         print(name)
#     innerFun()

# outerFun()
# print(name)


# name = "ahmed" 
# def outerFun():
#     # The line `name = "ali"` is assigning the value "ali" to the variable `name`. This variable is
# being defined within the scope of the function or block of code where this assignment is made.
name ="ali"
#     def innerFun():
#         nonlocal name
#         print(name)
#         name = "sara"
#     innerFun()
#     print(name)      


# outerFun()

# print(name)


# -----------------------------------------------

# modules 

# import mymodule
# import mymodule as fn 
# from mymodule import fn1 , dict1 

# import mymodule

# mymodule.greet("ahmed")

# print(mymodule.person["name"])


#  built in modules -> math   -- datetime


# import datetime

# x = datetime.datetime.now()

# print(x.strftime("%w"))

# "%a" --> return weekday short version 
# "%A" --> return weekday full version 
# "%w" --> weekday as a number    0 - 6   --> sunday 
#  "%d"  >> 1 -> 31
#  b  ->   short version 
#  B   -> full version 

# m   
# H


# ---------------------------------------------------------
# errors  
# syntax error 
# logical

# runtime error   ->> exceptions 


# # NameError ----> 
# print(x)

# # typeError 
# print("mmm"+2)

# # valueError  
# int("hello")

# # indexError
# nums = [1,2,3]
# nums[5]

# # keyError

# data ={"name":"mohamed"}

# data["age"]  

# ZeroDivisionError 10/5

# ImportError / ModuleNotFoundError


# try:
#     x = int(input("enter number  "))
#     result = 10 /x
# except ZeroDivisionError:
#     print("you cant divide on zero")
# except Exception:
#     print("valid number ")
    

# try:
#     print("hello")
# except:
#     print("wrong")
# else:
#     print("nothing happen")
# finally:
#     print("the try is finished ")

# else -> program correct -> try done





# raise --> throw exception   

# x = int(input("enter number "))
# if x < 0:
#     raise TypeError("not allowed negative")

# ------------------------------------------------

# file handling
# try:
#   f = open("demofile.txt")
# except:
#   print("file not found ")
# # x --> create file

# with open("demofile.txt") as f:
#     print(f.read(5))


# with open("demofile.txt") as f:
#     print(f.readline())
#     print(f.readline())
#     f.close()

# line by line
# with open("demofile.txt") as f:
#     for x in f: 
#         print(x)


# write 

# "a" --> append --> write at the end >> add 
 
# "w" --> write   --> overwrite 

# with open("demofile.txt","w") as f:
#     f.write("text")

# --------------------
# file  

# import os
# os.remove("demofile.txt")

# if os.path.exists("demofile.txt"):
#     os.remove("demofile.txt")
# else:
#     print("file not exist ")


# os.rmdir("myfolder")

# remove folder must be empty

# ----------------------------------------------------

#  connection db

# pip install psycopg2

# import psycopg2

# try:
#     conn = psycopg2.connect(
#         host="localhost",
#         database="cars",
#         user="root",
#         password="123",
#         port=5432
#     )
# # xampp
#     cur = conn.cursor()

#     # cur.execute("insert into employees(name , department) values (%s,%s)",("mohamed","it"))

#     cur.execute("select * from employees")

#     rows= cur.fetchall()
#     for row in rows:
#         print(row)

#     conn.commit()
#     cur.close()
# except:
#     print("error happen")
