from django.shortcuts import render
from product.products_data import products 
# all products

def all_products(request):
    
    return render(request, 'product/all_products.html' , {'products': products})



def product_details(request, product_id):
    product = None
    for p in products:
        if p['id'] == product_id:
            product = p
            break
    return render(request, 'product/product_details.html', {'product': product})