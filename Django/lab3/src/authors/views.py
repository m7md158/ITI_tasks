from django.shortcuts import render, redirect
from .models import Book, Author
from .forms import BookForm

def all_books(request):
    books = Book.objects.all()
    context = {
        'books': books
    }
    return render(request, 'authors/all_books.html',context)



def book_detail(request, book_id):
    book = Book.objects.get(id=book_id)
    context = {
        'book': book
    }
    return render(request, 'authors/one_book.html',context)



def book_create(request):
    if request.method == 'POST':
        form = BookForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('all_books')
    
    form = BookForm()
    context = {
        'form': form
    }
    return render(request, 'authors/create_book.html',context)
    


def book_delete(request, book_id):
    book = Book.objects.get(id=book_id)
    book.delete()
    return redirect('all_books')
    

# update  
def book_update(request, book_id):
    book = Book.objects.get(id=book_id)
    if request.method == 'POST':
        form = BookForm(request.POST, instance=book)
        if form.is_valid():
            form.save()
            return redirect('all_books')
    
    form = BookForm(instance=book)
    context = {
        'form': form
    }
    return render(request, 'authors/update_book.html',context)








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