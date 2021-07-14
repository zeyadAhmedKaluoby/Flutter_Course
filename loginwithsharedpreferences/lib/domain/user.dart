class User{
  int ?userId;
  String ?name;
  String ?email;
  String ?type;
  String ?phone;
  String ?token;
  String ?renewalToken;
  User({ this.userId, this.name, this.email, this.type ,  this.phone, this.token, this.renewalToken});
  factory User.fromJson(Map<String,dynamic> responseData){
    return User(userId: responseData['id'], name: responseData['username'], email: responseData['email'], type: responseData['type'], token: responseData['token'], renewalToken: responseData['renewalToken'],phone: responseData['phone']);

  }

}