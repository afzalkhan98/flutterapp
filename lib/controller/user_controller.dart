import 'package:get/get.dart';
import '../service/api_service.dart';


class UserController extends GetxController {
  var users = [].obs;
  var isLoading = true.obs;



  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    Future.delayed(const Duration(seconds: 1), () async {
      try {
        isLoading(true);
        var usersResult = await ApiService().fetchUsers();
        users.assignAll(usersResult);
      } finally {
        isLoading(false);
      }
    });
  }
}