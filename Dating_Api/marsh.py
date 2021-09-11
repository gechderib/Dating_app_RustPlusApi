from flask_marshmallow import Marshmallow
from models import *

marsh = Marshmallow()

class LikeSchema(marsh.Schema):
    class Meta:
        fields=("likedBy","liked")
        model = Like

class UserSchema(marsh.Schema):
    class Meta:
        fields=("username","name","email","address","password","age","like","image","choiceAge","sex","color","religion")
        model = User


class AdminSchema(marsh.Schema):
    class Meta:
        fields=("username","email","password")
        model = Admin

class CommentSchema(marsh.Schema):
    class Meta:
        fields=("commentText",)
        model = Comment

