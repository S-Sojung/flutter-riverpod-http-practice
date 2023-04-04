
class User{
  int? id;
  String? username;
  String? email;

  User({this.id, this.username, this.email});

  //Json을 object로 바꾸어줌
  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id : json['id'],
      username : json['username'],
      email : json['email'],
    );
  }
  // toJson(); //object를 json으로 바꾸어줌
  Map<String,dynamic> toJson(){
    return {
      'id' : id,
      'username' : username,
      'email' : email
    };
  }

}