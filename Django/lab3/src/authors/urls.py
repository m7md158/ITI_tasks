from django.urls import path
from .views import all_books , all_authors, author_books, book_detail, book_create, book_delete, book_update
urlpatterns = [
    path('', all_books, name='all_books'),
    path('authors/', all_authors, name='all_authors'),
    path('authors/<author_id>/', author_books, name='author_books'),
    
    
    path('books/<book_id>/', book_detail, name='book_detail'),
    path('create/', book_create, name='book_create'),
    path('delete/<book_id>/', book_delete, name='book_delete'),
    path('update/<book_id>/', book_update, name='book_update'),
]