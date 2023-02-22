import 'package:fetch_api/features/post/services.dart';
import 'package:fetch_api/model/post.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  RxString category = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategoryPost(category.value);
  }

  var isLoading = true.obs;
  var allPost = <Post>[].obs;

  void fetchCategoryPost(String cat) async {
    try {
      isLoading(true);
      var posts = await PostServices.fetchPost(category: cat);
      if (posts != null) {
        allPost.assignAll(posts);
      }
      print(cat);
    } finally {
      isLoading(false);
    }
  }
}
