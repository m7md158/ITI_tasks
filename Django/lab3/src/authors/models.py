from django.db import models

# Create your models here.

class Author(models.Model):
    name = models.CharField(max_length=100)
    age = models.IntegerField()
    email = models.EmailField()
    gender = models.CharField(
        choices=[
            ('M', 'Male'), 
            ('F', 'Female')
            ],
        max_length=1
        )
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    
    def __str__(self):
        return self.name
    
    
class Book(models.Model):
    name = models.CharField(max_length=100)
    type = models.CharField(max_length=100)
    author = models.ForeignKey(Author, on_delete=models.CASCADE)
    
  
    def __str__(self):
        return self.name
    