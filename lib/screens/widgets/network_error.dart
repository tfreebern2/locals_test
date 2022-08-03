import 'package:flutter/material.dart';
import 'package:locals_test/api/locals_api.dart';

class NetworkError extends StatelessWidget {
  const NetworkError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api = LocalsApi();
    return FutureBuilder(
        future: api.isOnline(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == false) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      'Please check your internet connection and try again.'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text('Retry'))
                ],
              );
            }
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Network error. Please try again.'),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text('Retry'))
            ],
          );
        });
  }
}
