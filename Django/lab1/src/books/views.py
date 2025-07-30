from django.shortcuts import render

# Create your views here.

def home(request):
    return render(request, 'books/home.html')

def contact(request):
    return render(request, 'books/contact.html')

def about(request):
    return render(request, 'books/About.html')