from flask_marshmallow import Marshmallow
from models import *

marsh = Marshmallow()

class ChoiceSchema(marsh.Schema):
    class Meta:
        fields=("age","color","salary","description")
        model = Choice
        
class LikeSchema(marsh.Schema):
    class Meta:
        fields=("liked","likedby")
        model = Like

class UserSchema(marsh.Schema):
    class Meta:
        fields=("username","name","email","address","password")
        model = User


class AdminSchema(marsh.Schema):
    class Meta:
        fields=("username","email","password")
        model = Admin

class CommentSchema(marsh.Schema):
    class Meta:
        fields=("commentText",)
        model = Comment

