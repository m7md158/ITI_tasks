# Q1:
# Create a class called Book with attributes: title, author, and pages. Create an object and print the book details.

class Book:
    def __init__(self, title, author, pages):
        self.title = title
        self.author = author
        self.pages = pages
        
    def details(self):
        print(f"title: {self.title}")
        print(f"author: {self.author}")
        print(f"pages: {self.pages}")
        
b1 = Book("odoo", "mohamed", 200)
b1.details()
        
# -----------------------------------------

# Q2:
# Write a class Student with name and grades (list). Add a method to calculate and return the average grade.

class Student:
    def __init__(self,name,grades):
        self.name = name
        self.grades = grades
        
    def average(self):
        return sum(self.grades) / len(self.grades)
        
s1 = Student("mohamed", [10,20,30])
print(s1.average())

#---------------------------------------

# Q3:
# Create a base class Vehicle with a method start_engine(). Inherit Car and Bike from it, and override the method to show different messages.

class Vehicle:
    def __init__(self):
        pass
    def start_engine(self):
        print(" messages from vehicle")
        
class Car(Vehicle):
    def start_engine(self):
        print("messages from car")
        
class Bike(Vehicle):
    def start_engine(self):
        print("messages from bike")
        
c1 = Car()
c1.start_engine()

b1 = Bike()
b1.start_engine()


#----------------------------


# Q4:
# Create two classes Engine and Car. A Car has an Engine object (composition). Show how to access engine details from the car.

class Engine:
    def __init__(self,power):
        self.power = power
        
class Car:
    def __init__(self,brand , engine_power):
        self.brand=brand
        self.engine = Engine(engine_power)
        
    def show(self):
        print(self.brand)
        print(self.engine.power)
        
c1 = Car("bmw M8 ", 625)
c1.show()

# -------------------------------

# Q5:
# in a separate file Create an abstract class Employee with:
# - Attributes: name and salary.
# - An abstract method calculate_salary() that must be implemented by subclasses.
# - Create classes Developer and Designer that inherit from Employee. Each should implement calculate_salary() differently (e.g., Developer +10% bonus).
# - Create a list of Employees (Developer and Designer) and print their salaries.

from employee import Designer, Developer

# # d1 = Designer("ahmed", 1000)
# # d2 = Developer("mohamed", 1000)


employees = [
    Designer("ahmed", 1000),
    Developer("mohamed", 1000),
    Developer("mostafa", 2000),
]

for employee in employees:
    print(employee)


