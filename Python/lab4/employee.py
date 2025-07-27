from abc import ABC, abstractmethod

class Employee(ABC):
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

    @abstractmethod
    def calculate_salary(self):
        pass
    
    
    def __str__(self):
        return f"Name: {self.name}, Salary: {self.calculate_salary()}"
    
    
class Developer(Employee):
    
    def calculate_salary(self):
        return self.salary +( 0.10 * self.salary)
    

    
class Designer(Employee):
    
    def calculate_salary(self):
        return self.salary +( 0.01 * self.salary)
    
    