from django.urls import path
from .views import all_books , all_authors, author_books
urlpatterns = [
    path('', all_books, name='all_books'),
    path('authors/', all_authors, name='all_authors'),
    path('authors/<author_id>/', author_books, name='author_books'),
]