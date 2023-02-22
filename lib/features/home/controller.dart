import 'package:fetch_api/features/home/services.dart';
import 'package:fetch_api/model/category.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategory();
  }

  var isLoading = true.obs;
  var categoryList = <Category>[].obs;

  void fetchCategory() async {
    try {
      isLoading(true);
      var allCategory = await HomeServices.fetchCategory();
      if (allCategory != null) {
        categoryList.assignAll(allCategory);
      }
    } finally {
      isLoading(false);
    }
  }
}
