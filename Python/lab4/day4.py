#  OOP 
# class --> blueprint 

# class -> object 

# object -> instance class

# class 
# members ->> attributes 
# methods 

# constructor ->> 

# class Car:
#     def __init__(self , brand , color):
#         self.brand = brand
#         self.color = color


# c1 = Car("bmw","red")

# print(c1.color)

# ------------------------------------------

# encapsulation 

# class Person:
#     def __init__(self,name ,age):
#         self.__name = name
#         self.__age = age

#     def get_name(self):
#         return self.__name
    
#     def set_name(self,new_name):
#         self.__name = new_name

#     def get_age(self):
#         return self.__age


# p1 = Person("mostafa")
# print(p1.get_name())

# p1.set_name("mohamed")

# print(p1.get_name())
# -------------------------------------------------

# inheritance

# single inheritance 

# class Animal:
#     def speak(self):
#         print("Animal speak")

# class Dog(Animal):
#     def bark(self):
#         print("Dog")


# d = Dog()

# d.speak()

# d.bark()

# multiple inheritance 

# class A:
#     def method_a(self):
#         print("from a")

# class B:
#     def method_b(self):
#         print("from b")


# class C(A,B):
#     pass


# c1 = C()

# c1.method_a()

# c1.method_b()


# class A:
#     def show(self):
#         print("A")

# class B(A):
#     def show(self):
#         print("B")

# class C(A):
#     def show(self):
#         print("C")


# class D(B,C):
#     pass


# d =D()
# d.show()

# MRO --> Method Resolution Order

# MULTILEVEL

# class A:
#     def method_a(self):
#         print("from a")

# class B(A):
#     def method_b(self):
#         print("from b")

# class C(B):
#     def method_c(self):
#         print("from c")


# obj = C()

# obj.method_a()

# class Parent:
#     def show(self):
#         print("parent")

# class Child(Parent):
#     def show(self):
#         super().show()
#         print("child")


# c = Child()

# c.show()


# polymorphism

# class Animal:
#     def speak(self):
#         print("Animal sound")

# class Dog(Animal):
#     def speak(self):
#         print("dog")

# class Cat:
#     def speak(self):
#         print("cat")


# animals = [Dog() , Cat()]

# for animal in animals:
#     animal.speak()


# abstraction 

# from abc import ABC , abstractmethod

# class Shape(ABC):
#     @abstractmethod
#     def area(self):
#         pass

# class Circle(Shape):
#     def area(self):
#         return 3.14 * 2 * 2
    

# c = Circle()
# print(c.area())


# -------------------------------------------

#  Static Methods 

# class Calculator:
#     @staticmethod
#     def add(x,y):
#         return x + y



# print(Calculator.add(4,5))


#  how many instances taken from class 

# class Product:
#     count = 0

#     def __init__(self,name):
#         self.name=name
#         Product.count +=1
#     @classmethod
#     def get_count(cls):
#         return cls.count
    

# p1 = Product("LAPTOP")
# p2 = Product("LAPTOP2")

# print(p1.get_count())


# relations in oop

# association 
# aggrgation 
# composition 


# class Teacher:
#     def __init__(self,name):
#        self.name = name


# class Student:
#     def __init__(self,name):
#         self.name=name

#     def learn_from(self,teacher):
#         print(teacher.name)


# t1 = Teacher("mr ahmed")

# s1 = Student("mohamed")

# s1.learn_from(t1)


# aggregation

# class Department:
#     def __init__(self,name):
#         self.name=name

# class University:
#     def __init__(self,name):
#         self.name = name
#         self.departments = []

#     def add_department(self , dept):
#         self.departments.append(dept)


# d =Department("it")

# uni = University("cairo")

# uni.add_department(d)



class Engine:
    def __init__(self,power):
        self.power = power

class Car:
    def __init__(self,brand):
        self.brand=brand
        self.engine = Engine("test")

    def show(self):
        print(self.engine.power)
        


c1 =Car("bmw")
