import 'package:flutter/material.dart';
import 'package:login/services/google_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Login Page'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => AuthService().signInWithGoogle(),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black87),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Image.network(
                    'https://i.itworldcanada.com/wp-content/uploads/2022/08/google-logo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
