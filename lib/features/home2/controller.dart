import 'package:fetch_api/features/home2/service.dart';
import 'package:fetch_api/features/post/services.dart';
import 'package:fetch_api/model/post.dart';
import 'package:get/get.dart';

import '../../model/post2.dart';

class Post2Controller extends GetxController {
  RxString category = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllPost();
  }

  var isLoading = true.obs;
  var allPost = <Post2>[].obs;

  void fetchAllPost() async {
    try {
      isLoading(true);
      var posts = await Post2Services.fetchPost();
      if (posts != null) {
        allPost.assignAll(posts);
      }
    } finally {
      isLoading(false);
    }
  }
}
