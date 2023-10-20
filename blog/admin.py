from django.contrib import admin
from .models import Post, Comment, Author, Tag



@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'summary', 'post_content', 'post_author', 'image', 'post_create_date', 'post_update_date')
    
    
@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    lsit_display = ('psot', 'comment_author', 'comment_content', 'comment_create_date', 'comment_update_date')
    

@admin.register(Author)
class AuthorAdmin(admin.ModelAdmin):
    lsit_display = ('user', 'pseudonym', 'author_content', 'profile_image', 'author_create_date', 'author_update_date')


admin.site.register(Tag)