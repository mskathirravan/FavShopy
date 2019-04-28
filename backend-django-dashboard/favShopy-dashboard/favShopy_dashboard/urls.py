from django.contrib import admin
from django.urls import path,include
from django.views.generic.base import TemplateView

urlpatterns = [
    path('user/',include('user_app.urls')),
    path('',TemplateView.as_view(template_name="auth/login.html"),name="home"),
    #path('',TemplateView.as_view(template_name="pages/gloabaldashboard.html"),name="home"),
    path('admin/', admin.site.urls),
]
