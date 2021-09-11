from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'user'
    UserId = db.Column(db.Integer, primary_key=True,autoincrement=True)
    username = db.Column(db.String,nullable=False)
    name = db.Column(db.String,nullable=False)
    email = db.Column(db.String,nullable=False,unique=True)
    password = db.Column(db.String,nullable=False)
    address = db.Column(db.String,nullable=False)
    age = db.Column(db.String,nullable=False)
    like = db.Column(db.String,nullable=False)
    image = db.Column(db.String, nullable=False)
    choiceAge = db.Column(db.String, nullable=False)
    sex = db.Column(db.String, nullable=False)
    color = db.Column(db.String, nullable=False)
    religion = db.Column(db.String,nullable=False)


class Like(db.Model):
    __tablename__ = 'like'
    likeId = db.Column(db.Integer, primary_key=True, autoincrement=True)
    likedBy = db.Column(db.String, nullable=True)
    liked = db.Column(db.String, nullable=True)


class Admin(db.Model):
    __tablename__='admin'
    AdminId = db.Column(db.Integer, primary_key=True,autoincrement=True)
    username = db.Column(db.String,nullable=False,unique=True)
    email = db.Column(db.String,nullable=False,unique=True)
    password = db.Column(db.String,nullable=False)

class Comment(db.Model):
    __tablename__="comment"
    commentId = db.Column(db.Integer, primary_key=True,autoincrement=True)
    commentText = db.Column(db.String,nullable=False)


