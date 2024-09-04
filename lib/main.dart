
import 'package:flutter/material.dart';
import 'package:flutterapp/controller/user_controller.dart';
import 'package:get/get.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: UserPage(),
    );
  }
}

class UserPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Users')),
        body: Obx(() {
          if (userController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: userController.users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(userController.users[index].address.street),
                        subtitle: Text(userController.users[index].address.suite),
                        leading: Text(userController.users[index].address.geo.lng),
                      );



                    },
                  ),
                ),
                Text(
                  "Total users: ${userController.users.length}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(left: 40,right: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // rounded corners
                    ),
                    backgroundColor: Colors.red, // background
                    foregroundColor: Colors.white, // foreground
                  ).copyWith(
                    overlayColor: MaterialStateProperty.all(Colors.transparent), // remove splash color
                  ),

                  onPressed: () {
                    Get.snackbar(
                      "Success",
                      "Fetch Data SuccessFully.",
                      snackPosition: SnackPosition.TOP,
                      margin: const EdgeInsets.only(top: 20, left: 20,right: 20),
                      borderRadius: 10,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      duration: const Duration(seconds: 3),
                    );
                  },
                  child: const Text('Submit'),
                ),


              ],
            );
          }
        })

    );



  }
}

