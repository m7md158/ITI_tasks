from django.shortcuts import render

# Create your views here.

def home(request):
    return render(request, 'authors/home.html')

def about(request):
    return render(request, 'authors/About.html')

def contact(request):
    return render(request, 'authors/contact.html')