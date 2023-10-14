"""
URL configuration for keithcoffee project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.views.generic import RedirectView
from django.conf.urls import include

urlpatterns = [
    path('admin/', admin.site.urls),
]

# 主頁路徑
urlpatterns += [
    path('Home/', include('Home.urls')),
    path('', RedirectView.as_view(url='Home/')),
    ]

# 產品路徑
urlpatterns += [
    path('products/', include('product.urls'), name='product'),
    ]

# # Blog路徑
# urlpatterns += [
#     path('blog/', include('blog.urls'), name='blog'),
#     ]



# 配置圖片讀取路徑
from django.conf.urls.static import static
from django.conf import settings

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)