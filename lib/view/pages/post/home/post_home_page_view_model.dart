import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/model/post/post.dart';

// 지역적으로 사용할 Provider 하지만 일반적인 Provider는 값이 변경 불가기 때문에
// 들어오자마자 초기화 하지 않으면 null값으로 고정되어버린다.
// 그렇다고 바로 값을 초기화 하면, List형태로 받아와야하기 때문에 복잡해진다.
// 그렇기 때문에 우리는 StateNotifier를 사용한다.

//창고 관리자 (Provider) , 다이렉트하게 접근하는건 얘가
final postHomePageProvider = StateNotifierProvider<PostHomePageViewModel, PostHomePageModel?>((ref) {
  return PostHomePageViewModel(null); //초기화 할 때 복잡해질 수 있기 때문에 model에서 null을 허용
  //이 Provider는 HomePageViewModel을 창고에 들고있음.
});

//창고 (Store)
class PostHomePageViewModel extends StateNotifier<PostHomePageModel?>{
  PostHomePageViewModel(super.state);
  //얘는 HomePageModel을 관리하는 창고

  void init(List<Post> postDtoList){
    state = PostHomePageModel(posts: postDtoList);
  }

  void add(Post post) {
    List<Post> posts = state!.posts;
    // posts.add(post);  //이렇게 하지 말자. 상황에 따라서는 주소가 같을 수도 있음.
    List<Post> newPosts = [...posts, post]; //깊은 복사
    // 기존 state에 넣으면, reference 주소가 달라지지 않아서 갱신을 못함
    // 변경 감지는 주소값, 즉 래퍼런스가 달라져야한다.
    // state값이 기존 state 값에 추가한다고 변경되지 않음, 무조건 새로운 값을 넣어야함.
    // 값이 동일해도 다시 그린다.

    // 여기서는 PostHomePageModel() 로 감싸서 new 하기 때문에 add 해도 상관없긴 함
    // 래퍼런스가 달라지기 때문에!
    state = PostHomePageModel(posts: newPosts);
  }

  void remove(int id){
    List<Post> posts = state!.posts;
    //map은 컬렉션을 가공해서 다시 뱉어낼 때 쓴다.
    List<Post> newPosts = posts.where((e) => e.id != id ).toList();
    //조건문이 true 일 경우, newPosts에 넣어준다.
    //where은 검색과 삭제에 이용한다.
    state = PostHomePageModel(posts: newPosts);
  }

  void update(Post post){
    List<Post> posts = state!.posts;
    List<Post> newPosts = posts.map((e) => e.id == post.id ? post : e ).toList();
    //map을 통해서 post의 id와 기존e와 같으면 바꿔치기 해주고, 아니면 기존 e를 넣어줌
    state = PostHomePageModel(posts: newPosts);
  }
}

//창고 데이터  //여기서 모델이 필요한 것을 정의
class PostHomePageModel{
//detail이 아니기 때문에 리스트 타입으로 필요하다!
  List<Post> posts;
  PostHomePageModel({required this.posts});
  //값이 안들어온 상태는 null, 초기화 할때는 무조건 값을 넣어주도록 하자
  //repository에서 들어오는 데이터가 어떤 형태인지..
}

