import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:locals_test/api/locals_api.dart';
import 'package:locals_test/models/response/user.dart';
import 'package:locals_test/screens/post_list_view.dart';
import 'package:locals_test/screens/widgets/network_error.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api = LocalsApi();
    return Scaffold(
      body: StreamBuilder<ConnectivityResult>(
        stream: api.connectivity.onConnectivityChanged,
        builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != ConnectivityResult.none) {
              return Scaffold(
                  body: FutureBuilder<User>(
                      future: api.login(),
                      builder: (context, AsyncSnapshot<User> snapshot) {
                        if (snapshot.hasData) {
                          return Center(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PostListView(),
                                            settings: RouteSettings(
                                                arguments: snapshot.data)));
                                  },
                                  child: const Text('View Posts')));
                        } else if (snapshot.hasError) {
                          return const NetworkError();
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }));
            }
          }
          return const Center(child: Text('Please check your internet connection.'));
        },
      ),
    );
  }
}
