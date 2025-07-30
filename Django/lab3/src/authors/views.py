from django.shortcuts import render
from .models import Book, Author
# Create your views here.
def all_books(request):
    books = Book.objects.all()
    context = {
        'books': books
    }
    return render(request, 'authors/all_books.html',context)

def all_authors(request):
    authors = Author.objects.all()
    context = {
        'authors': authors
    }
    return render(request, 'authors/all_authors.html',context)

# books for specific author

def author_books(request, author_id):
    books = Book.objects.filter(author_id=author_id)
    context = {
        'books': books
    }
    return render(request, 'authors/author_books.html',context)