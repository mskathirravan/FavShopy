from django.shortcuts import render, redirect
from django.contrib.auth.models import User, auth
from django.contrib import messages
from django.http import HttpResponse, JsonResponse
from datetime import datetime, timedelta
from .models import Product

import json


def index(request):
    return render(request, "index.html")


def login(request):
    if request.method == 'POST':
        username = request.POST["username"]
        password = request.POST["password"]
        user = auth.authenticate(username=username, password=password)
        if user is not None:
            auth.login(request, user)
            messages.success(request, "You are logged in !")
            return redirect('user_app:dashboard')
        else:
            messages.error(request, "Invalid Credentials !")
            return redirect('user_app:login')
        return redirect('user_app:dashboard')
    else:
        return render(request, "auth/login.html")


def signup(request):
    if request.method == 'POST':
        # Get form data
        username = request.POST["username"]
        email = request.POST["email"]
        password = request.POST["password"]
        confirm_password = request.POST["confirmpassword"]

        # check if password matches
        if password == confirm_password:
            if User.objects.filter(username=username).exists():
                messages.error(request, "Username Already taken !")
                return redirect('user_app:signup')
            else:
                if User.objects.filter(email=email).exists():
                    messages.error(request, "Email Already taken !")
                    return redirect('user_app:signup')
                else:
                    user = User.objects.create_user(username=username, email=email, password=password)
                    user.save()
                    messages.success(request, "You are now registered and can login !")
                    return redirect('user_app:login')
        else:
            messages.error(request, "Password do not match!")
            return redirect('user_app:signup')
    else:
        return render(request, "auth/signup.html")


def logout(request):
    if request.method == 'POST':
        auth.logout(request)
        messages.success(request, "You are logged out !")
        return redirect("user_app:login")


def dashboard(request):
    return render(request, "user/dashboard.html")


def advertise(request):
    return render(request, "pages/products.html")


def add_product(request):
    if request.method == 'POST':
        product_name = request.POST["product_name"]
        product_price = request.POST["product_price"]
        promo = request.POST["promo"]
        expiry_date = request.POST["expiry_date"]
        is_published = request.POST["group1"]
        description = request.POST["description"]
        product = Product(product_name=product_name, product_price=product_price,
                          promo=promo,
                          expiry_date=expiry_date,
                          is_published=is_published,
                          description=description)
        product.save()
    return render(request, "pages/add_product.html")


def get_all_products(request):
    context = Product.objects.values()
    return render(request, 'pages/products.html', {"context": context})


def delete_all(request):
    Product.objects.all().delete()
    return render(request, 'pages/products.html')
