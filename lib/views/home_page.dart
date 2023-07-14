import 'package:flutter/material.dart';
import 'package:flutter_crud/models/post_model.dart';
import 'package:flutter_crud/services/api_service.dart';

class HomePage extends StatelessWidget {
  final ApiService apiService = ApiService();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CRUD App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "MAKE GET REQUEST",
                style: TextStyle(
                  fontSize: 42,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    Post responseData = await apiService.getPost(2);
                    // Handle the response data
                    print("id: ${responseData.id}");
                    print("title: ${responseData.title}");
                    print("userId: ${responseData.userId}");
                    print("body: ${responseData.body}");

                    _showSnackbar("Post fetched successfully!", context);
                  } catch (error) {
                    // Handle the error
                    print('Error: $error');
                  }
                },
                child: const Text("Click Me!"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
