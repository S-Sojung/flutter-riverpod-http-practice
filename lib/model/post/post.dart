import 'package:http_riverpod_app/model/user/user.dart';

class Post{
  int? userId;
  int? id;
  String? title;
  String? body;
  User? user;

//   //Future를 쓰면 무조건 들어오는데 -> required
//   // 우리는 watch를 쓸거니까 초기값이 없을 수도 있다.

  Post({this.userId, this.id, this.title, this.body, this.user});

  //Json을 object로 바꾸어줌
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId : json['userId'],
      id : json['id'],
      title : json['title'],
      body : json['body'],
      user: User.fromJson(json["user"])
    );
  }
  // toJson(); //object를 json으로 바꾸어줌
  Map<String,dynamic> toJson(){
    return {
      'userId' : userId,
      'id' : id,
      'title' : title,
      'body' : body,
      'user' : user?.toJson() //null이 들고 있는 메서드를 들고올 수 없기 때문에 ?로 null 처리
    };
  }
}