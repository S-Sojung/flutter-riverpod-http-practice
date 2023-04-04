import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/controller/post_controller.dart';
import 'package:http_riverpod_app/model/post/post.dart';
import 'package:http_riverpod_app/view/pages/post/home/post_home_page_view_model.dart';

import '../../../../dto/post/post_response_dto.dart';

class PostHomePage extends ConsumerWidget {
  const PostHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostController pc = ref.read(postController);
    PostHomePageModel? pm = ref.watch(postHomePageProvider);
    //애는 컨트롤러한테 접근하고, repository에 바로 접근하지 않도록 함
    //컨트롤러는 바뀔일이 없기 때문에 read
    //이때 ref로 연결하려면 Controller를 Provider여야만 한다.

    return Scaffold(
      appBar: AppBar(),
      body: Column(//hpm == null ? () : ()
        children: [
          Expanded(
              //pageview는 높이가 필요 = > expand로 늘려줌
              child: pm != null
                  ? buildListView(pm.posts)
                  : buildListView([])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  pc.findPosts();
                },
                child: Text("페이지로드"),
              ),
              ElevatedButton(
                onPressed: () {
                  pc.addPost("제목4");
                },
                child: Text("한 건 추가"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  pc.removePost(1);
                },
                child: Text("한 건 삭제"),
              ),
              ElevatedButton(
                onPressed: () {
                  pc.updatePost(Post(id: 5,title: "수정됨"));
                },
                child: Text("한 건 수정"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildListView(List<Post> posts) {
    return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Text("${posts[index].id}"),
                      title: Text("${posts[index].title}"),
                    ),
                  );
  }
}
