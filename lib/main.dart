import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/controller/post_controller.dart';

import 'view/pages/post/home/post_home_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostController pc = ref.read(postController);

    return MaterialApp(
      home: PostHomePage(pc.findPosts()),
    );
  }
}
