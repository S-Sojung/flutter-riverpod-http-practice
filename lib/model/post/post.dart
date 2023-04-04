
// //통신을 통해 레파지토리에서 파싱된 데이터
// class PostDto {
//   int id;
//   int userId;
//   String title;
//   String body;
//
//   //Future를 쓰면 무조건 들어오는데 -> required
//   // 우리는 watch를 쓸거니까 초기값이 없을 수도 있다.
//
//   PostDto({required this.id, required this.userId, required this.title});
//
//   factory PostDto.fromJson(Map<String, dynamic> json) =>
//       PostDto(id: json["id"], title: json["title"]);
//
//   Map<String, dynamic> toJson() => {"id": id, "title": title};
// }

import 'package:http_riverpod_app/model/user/user.dart';

class Post{
  int? userId;
  int? id;
  String? title;
  String? body;
  User? user;

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