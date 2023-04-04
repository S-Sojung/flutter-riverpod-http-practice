
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/model/post/post.dart';
import 'package:http_riverpod_app/model/post/post_repository.dart';
import 'package:http_riverpod_app/view/pages/post/home/post_home_page_view_model.dart';


//ref를 통해서 view 제어를 한다
//view는 컨트롤러에게만 접근하면된다.

final postController = Provider<PostController>((ref) {
  return PostController(ref);
});

class PostController{
  
  Ref ref;
  PostController(this.ref);

  Future<void> findPosts() async{
    List<Post> postDtos = await PostRepository().findAll();
    // ref.read(postHomePageProvider.notifier).state = HomePageModel(posts: postDtos);
    ref.read(postHomePageProvider.notifier).init(postDtos);
  }

  Future<void> addPost(String title) async{
    Post post = await PostRepository().save(title);
    ref.read(postHomePageProvider.notifier).add(post);
    //뷰한테 응답안하고 창고 관리자에게 보내줌
  }

  Future<void> removePost(int id) async{
    await PostRepository().deleteById(id);
    ref.read(postHomePageProvider.notifier).remove(id);
  }

  Future<void> updatePost(Post post) async{
    Post postPS = await PostRepository().update(post);
    ref.read(postHomePageProvider.notifier).update(postPS);
  }

}








