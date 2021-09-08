from flask import Flask,render_template, url_for, flash, redirect, request, jsonify
from flask_marshmallow import Marshmallow
from flask_restplus import Resource,Api,fields
from marshmallow.utils import pprint

from setting import *
from models import *
from marsh import *
from flask_cors import CORS

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


choice_schema = ChoiceSchema()
choices_schema = ChoiceSchema(many=True)

admin_schema = AdminSchema()
admins_schema = AdminSchema(many=True)


comment_schema = CommentSchema()
comments_schema = CommentSchema(many=True)


api = Api(app,version="1",title="Dating App Database",description="Best dating appp ever")


choice = api.model("Choice", {
    'age':fields.String("choice age"),
    'description':fields.String("description"),
    'color':fields.String('color'),
    'salary':fields.String('salary'),

})


like = api.model("Like", {
    'liked':fields.String("liked"),
    'likedby':fields.String("likedby"),


})
#for  model

admin = api.model("Admin",{
    'username':fields.String("Admin name"),
    'email':fields.String("Email"),
    'password':fields.String("password")
})
#for  model

user = api.model("User",{
    'username':fields.String("username"),
    'email':fields.String("email"),
    'name':fields.String('name'),
    'password':fields.String("password"),
    'address':fields.String("address")
})
#for Orr model
order = api.model("Order", {
    'orderFor':fields.String("order for name"),
    'description':fields.String("blood test/give this medicine"),
    'pUserName':fields.String("order doc name")

})

# crud operations for choice start
@api.route("/api/choices",methods=["GET","POST"])

class ChoiceResource(Resource):
    def get(self):
        """This request returns all choices"""
        choices =  Choice.query.all()
        return choices_schema.dump(choices)
    @api.expect(choice)
    @api.response(201,"Successfuly created new choices!")
    def post(self):
        """This request creates new choice"""
        #create new choice
        choice =  Choice()
        choice.age = request.json['age']
        choice.color = request.json['color']
        choice.salary = request.json['salary']
        choice.description = request.json['description']
        db.session.add(choice)
        db.session.commit()
        return choice_schema.dump(choice)

@api.route('/api/choices/<int:id>')
class ChoiceResource(Resource):
    def get(self, id):
        '''
        This request return single choice
        '''
        choice = Choice.query.filter_by(ChoiceId=id).first()
        return choice_schema.dump(choice)
    @api.expect(choice)
    @api.response(204, 'choice details successfully updated.')
    def put(self, id):
        """
        This request updates a particular choice.
        """
        choice = Choice.query.filter_by(ChoiceId=id).first()
        choice.description = request.json['description']
        choice.age = request.json['age']
        choice.color = request.json['color']
        choice.salary = request.json['salary']
        
        db.session.add(choice)
        db.session.commit()

        return choice_schema.dump(choice)

    @api.response(204, 'Choice  successfully deleted.')
    def delete(self, id):
        """
        This request deletes a particular choice.
        """
        choice = Choice.query.filter_by(ChoiceId=id).first()
        if choice is None:
            return None, 404
        db.session.delete(choice)
        db.session.commit()
        return None, 204

#search for appointments
@api.route("/api/choice/<string:choicestring>")
class ChoiceResource(Resource):
    def get(self,choicestring):
        "This request returns user interesed area choice."
        choice = Choice.query.filter(Choice.description.contains(choicestring)).all()
        return choice_schema.dump(choice),200
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
        user = User()
        if request.is_json:
            email = request.json['email']
            password = request.json['password']
        else:
            email = request.form['email']
            password = request.form['password']
        test=User.query.filter_by(email=email, password=password).first()
        if test: 
            return jsonify(message="login successful",email=email,password=password)
        else:
            return "Wrong email or password", 401 

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
        if test:
            return None, 404
        else:
            user.username = request.json['username']
            user.email = request.json['email']
            user.name = request.json['name']
            user.password = request.json['password']
            user.address = request.json['address']
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