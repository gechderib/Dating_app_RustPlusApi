import re
from flask import Flask,render_template, url_for, flash, redirect, request, jsonify
from flask_marshmallow import Marshmallow
from flask_restplus import Resource,Api,fields
from werkzeug.utils import cached_property
from flask_cors import CORS

from setting import *
from models import *
from marsh import *

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = SQLALCHEMY_DATABASE_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = SQLALCHEMY_TRACK_MODIFICATIONS
CORS(app)
db.init_app(app) # initialize

marsh = Marshmallow(app)

user_schema = UserSchema()
users_schema = UserSchema(many=True)


like_schema = LikeSchema()
likes_schema = LikeSchema(many=True)

admin_schema = AdminSchema()
admins_schema = AdminSchema(many=True)


comment_schema = CommentSchema()
comments_schema = CommentSchema(many=True)


api = Api(app,version="1",title="Dating App Database",description="Best dating appp ever")


like = api.model("Like", {
    'likedBy':fields.String("likedBy"),
    'liked':fields.String("liked"),

})
#for Doctor model

admin = api.model("Admin",{
    'username':fields.String("Admin name"),
    'email':fields.String("Email"),
    'password':fields.String("password")
})
#for Patient model

user = api.model("User",{
  
    'username':fields.String("user name"),
    'email':fields.String("email"),
    'name':fields.String('name'),
    'password':fields.String("password"),
    'address':fields.String("address"),
    'age':fields.String("age"),
    'like':fields.String("like"),
    'image':fields.String('image'),
    'choiceAge':fields.String('choiceAge'),
    'color':fields.String('color'),
    'religion':fields.String('religion'),
    'sex':fields.String('sex'),
})
#for Order model
order = api.model("Order", {
    'orderFor':fields.String("order for name"),
    'description':fields.String("blood test/give this medicine"),
    'pUserName':fields.String("order doc name")

})



@api.route("/api/likeBy/<string:emaill>")
class likeByResource(Resource):
    def get(self,emaill):
            
          
            return emaill






# crud operations for choice start
@api.route("/api/like")

class likeResource(Resource):
    def get(self):
        like = Like.query.all()
        return likes_schema.dump(like)
        # "This request prints all users"
        # likeing = Like.query.all()
        # return users_schema.dump(likeing)

    @api.expect(like)
    def post(self):
        like =Like() 
        likedBy = request.json['likedBy'] 
        liked = request.json['liked'] 
        test=Like.query.filter_by(liked = liked,likedBy=likedBy).first() 
        if test: 
            db.session.delete(test) 
            db.session.commit() 
            return None, 204 
            
        else:  
            like.likedBy = request.json['likedBy'] 
            like.liked = request.json['liked'] 
            db.session.add(like) 
            db.session.commit() 
            return like_schema.dump(like),201

@api.route('/api/like/<string:emaill>')
class LikeResource(Resource):
    def get(self, emaill):
        '''
        This request return single choice
        
        '''
        like = Like.query.filter_by(liked = emaill).all()

        result = []
        fine = []
        
        for x in like:
            result.append(x.likedBy)
        print(result)

        for i in result:
            user = User.query.filter_by(email = i).first()
            fine.append(user)
        print(fine)
        return users_schema.dump(fine)  
    @api.expect(like)
    @api.response(204, 'choice details successfully updated.')
    def put(self, email):
        """
        This request updates a particular choice.
        """
        admin = Admin.query.filter_by(AdminId=id).first()

        like = Like.query.filter_by(liked=email).first()
        like.likedBy = request.json['likedBy']
        like.liked = request.json['liked']
     
        
        db.session.add(like)
        db.session.commit()

        return like_schema.dump(like)

    @api.response(204, 'Choice  successfully deleted.')
    def delete(self, email):
        """
        This request deletes a particular choice.
        """
        like = Like.query.filter_by(liked=email).first()
        if like is None:
            return None, 404
        db.session.delete(like)
        db.session.commit()
        return None, 204





@api.route('/api/li/<string:emaill>')
class LiResource(Resource):
    def get(self, emaill):
        '''
        This request return single choice
        
        '''
        print(emaill)
        like = Like.query.filter_by(likedBy = emaill).all()

        result = []
        fine = []
        s = " "
        for x in like:
            
            print(x.liked)

            result.append(x.liked)
        print(result)

        for i in result:
            user = User.query.filter_by(email = i).first()
            fine.append(user)
        print(fine)
        return users_schema.dump(fine)  
    @api.expect(like)
    @api.response(204, 'choice details successfully updated.')
    def put(self, email):
        """
        This request updates a particular choice.
        """
        admin = Admin.query.filter_by(AdminId=id).first()

        like = Like.query.filter_by(liked=email).first()
        like.likedBy = request.json['likedBy']
        like.liked = request.json['liked']
     
        
        db.session.add(like)
        db.session.commit()

        return like_schema.dump(like)

    @api.response(204, 'Choice  successfully deleted.')
    def delete(self, email):
        """
        This request deletes a particular choice.
        """
        like = Like.query.filter_by(liked=email).first()
        if like is None:
            return None, 404
        db.session.delete(like)
        db.session.commit()
        return None, 204















#search for appointments
# @api.route("/api/like/<string:likestring>")
# class ChoiceResource(Resource):
#     def get(self,choicestring):
#         "This request returns user interesed area choice."
        
#         return like_schema.dump(choice),200
#crud operations for choice end

#########################################################################################################################
# crud operations for admin start
@api.route("/api/admins")
class AdminResource(Resource):
    def get(self):
        "This request prints all Admins"
        admin = Admin.query.all()
        return admins_schema.dump(admin)

    @api.expect(admin)
    @api.response(201,"Successfuly created new admin!")
    def post(self):
        """This request creates new admin"""
        admin =Admin()
        email = request.json['email']
        test=Admin.query.filter_by(email=email).first()
        if test:
            return None, 404
        else: 
            admin.username = request.json['username']
            admin.email = request.json['email']
            admin.password = request.json['password']
            db.session.add(admin)
            db.session.commit()
            return admin_schema.dump(admin),201

#crud operations for Doctor start
@api.route("/api/adminlogin")
class AdminResource(Resource):
    def get(self):
        "This request prints all admins"
        admin = Admin.query.all()
        return admins_schema.dump(admin)
    @api.expect(admin)
    @api.response(201,"Successfuly created new logedin!")
    def post(self):
        """This request creates new Admin"""
        admin = Admin()
        if request.is_json:
            email = request.json['email']
            password = request.json['password']
        else:
            email = request.form['email']
            password = request.form['password']
        test=Admin.query.filter_by(email=email, password=password).first()
        if test:
            # access_token = create_access_token(identity=email)
            # , access_token=access_token
            return jsonify(message="login successful")
        else:
            return "Wrong email and/or password", 401 

@api.route("/api/admins/<int:id>")
class AdminResource(Resource):
    def get(self,id):
        "This request returns particular Admin"
        admin = Admin.query.filter_by(AdminId=id).first()
        return admin_schema.dump(admin)
    @api.expect(admin)
    @api.response(204, 'Admin details successfully updated.')
    def put(self,id):
        "updates admin details"
        admin = Admin.query.filter_by(AdminId=id).first()
        admin.email = request.json['email']
        admin.username = request.json['username']
        admin.password = request.json['password']
        db.session.add(admin)
        db.session.commit()
        return admin_schema.dump(admin)
    @api.response(204, 'admin  successfully deleted.')
    def delete(self,id):
        "deletes particular admin"
        admin = Admin.query.filter_by(AdminId=id).first()
        if admin is None:
            return None, 404
        db.session.delete(admin)
        db.session.commit()
        return None, 204

########################################################################################################################
#crud operations for user start
@api.route("/api/userlogin")
class UserResource(Resource):
    def get(self):
        # this is the redirection to after the user is logedin
        user = User.query.all()
        return users_schema.dump(user)
    @api.expect(user)
    @api.response(201,"Successfuly created new logedin!")
    def post(self):
        # this is for submiting the form to check the tokens
        users = User()
        # print(request.json['UserId'])
        if request.is_json:
            email = request.json['email']
            password = request.json['password']
        else:
            email = request.form['email']
            password = request.form['password']
        test=User.query.filter_by(email=email, password=password).first()
        
        if test is None:
            # access_token = create_access_token(identity=email)
            # , access_token=access_token
            print('eeeeeeeeeeeee')
            return "Wrong email or password", 401 
            
        else:
            print("kide")
            return jsonify(message="login successful",email=email,password=password)
            
            

@api.route("/api/users")
class UserResource(Resource):
    def get(self):
        "This request prints all users"
        user = User.query.all()
        return users_schema.dump(user)

    @api.expect(user)
    @api.response(201,"Successfuly created new user!")
    def post(self):
        """This request creates new user"""
        user = User()
        email = request.json['email']
        test=User.query.filter_by(email=email).first()
        # print(user.type)
        if test:
            return None, 404
        else:
            user.username = request.json['username']
            user.email = request.json['email']
            user.name = request.json['name']
            user.password = request.json['password']
            user.address = request.json['address']
            user.like = request.json['like']
            user.age = request.json['age']
            user.image = request.json['image']
            user.choiceAge = request.json['choiceAge']
            user.sex = request.json['sex']
            user.religion = request.json['religion']
            user.color = request.json['color']
            db.session.add(user)
            db.session.commit()
            return user_schema.dump(user),201
        

@api.route("/api/users/<string:email>")
class UserResource(Resource):
    def get(self,email):
        "This request returns particular user"
        user= User.query.filter_by(email=email).first()
        return user_schema.dump(user)
    @api.expect(user)
    @api.response(204, 'user details successfully updated.')
    def put(self,email):
        "updates user details"
        user = User.query.filter_by(email=email).first()
        user.email = request.json['email']
        user.name  = request.json['name']
        user.address = request.json['address']
        user.username = request.json['username']
        user.password = request.json['password']
        user.age = request.json['age']
        user.like = request.json['like']
        user.image = request.json['image']
        user.choiceAge = request.json['choiceAge']
        user.sex = request.json['sex']
        user.religion = request.json['religion']
        user.color = request.json['color']
        db.session.add(user)
        db.session.commit()
        return user_schema.dump(user)
    def delete(self,email):
        "deletes particular user"
        user =User.query.filter_by(email=email).first()
        if user is None:
            return "user is not found",404
        db.session.delete(user)
        db.session.commit()
        return "user  successfully deleted.",204
#crud operations for user end

##########################################################################