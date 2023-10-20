from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class Tag(models.Model):
    name = models.CharField(verbose_name='種類名稱', max_length=10)
    
    def __str__(self):
        return self.name
        

class Author(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    pseudonym = models.CharField(verbose_name='筆名', max_length=20)
    author_content = models.CharField(verbose_name='作者簡介', max_length=500)
    profile_image = models.ImageField(verbose_name='作者頭像', upload_to='author_image/')
    articles = models.ManyToManyField('Post', verbose_name='文章')
    birthday = models.DateField(verbose_name='出生日期', blank=True, null=True)
    
    author_create_date = models.DateField(auto_now_add=True)
    author_update_date = models.DateField(auto_now=True)

    def __str__(self):
        return self.pseudonym + '-' + self.user.get_full_name()


class Post(models.Model):
    title = models.CharField(verbose_name='標題', max_length=200)
    summary = models.CharField(verbose_name='簡介', max_length=300)
    post_content = models.TextField(verbose_name='內容')
    post_author = models.ForeignKey(Author, on_delete=models.CASCADE)
    image = models.ImageField(verbose_name='文章照片', upload_to='post_image/')
    tags = models.ManyToManyField(Tag, verbose_name='文章標籤')
        
    post_create_date = models.DateField(verbose_name='文章創建日期', auto_now_add=True)
    post_update_date = models.DateField(verbose_name='修改日期', auto_now=True)

    def __str__(self):
        return self.title
    
    
class Comment(models.Model):
    post = models.ForeignKey(Post, verbose_name='文章', on_delete=models.CASCADE)
    comment_author = models.ForeignKey(Author, verbose_name='評論者名稱', on_delete=models.CASCADE)
    comment_content = models.TextField(verbose_name='評論', max_length=500)

    comment_create_date = models.DateField(auto_now_add=True)
    comment_update_date = models.DateField()

    def __str__(self):
        return self.author + '-' + self.post.title
    

    
    
    