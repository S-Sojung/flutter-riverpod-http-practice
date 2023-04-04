
import 'package:http_riverpod_app/model/post/post.dart';

List<Post> posts = [
  Post(id: 1, title: "제목1",body: "ㅎㅇ",),
  Post(id: 2, title: "제목2"),
  Post(id: 3, title: "제목3"),
  Post(id: 4, title: "제목4"),
  Post(id: 5, title: "제목5"),
  Post(id: 6, title: "제목6"),
  Post(id: 7, title: "제목7"),
  Post(id: 8, title: "제목8"),
];

//얘의 책임은 통신과 파싱, 여기서 화면 제어하게 하지 않는다.
class PostRepository {
  static PostRepository _instance = PostRepository._single();

  //아직 _instance가 만들어진 상태가 아니여서 이름 있는 생성자를 먼저 만들어서 _instance가 생성된다
  PostRepository._single();

  factory PostRepository() {
    return _instance;
  }

  Future<List<Post>> findAll() {
    return Future.delayed(Duration(seconds: 1), (){
      return posts;
    });
  }

  Future<Post> save(String title) {
    //save 하면 save된 데이터를 서버측에서 영속화 하여 우리가 돌려받음
    //delete를 제외한 모든 것들은 데이터를 돌려 받는다.
    return Future.delayed(Duration(seconds: 1), (){
      return  Post(id: 2, title: title);
    });
  }

  Future<void> deleteById(int id) {
    return Future.delayed(Duration(seconds: 1),() {});
  }
  Future<Post> update(Post post) {
    return Future.delayed(Duration(seconds: 1), (){
      return  post;
    });
  }
}
