import 'package:flutter/material.dart';
import 'package:petspaw_admin/features/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("welcome to petspaw",
                      style: TextStyle(color: Colors.pink)),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Enter your email',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'password',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {}, child: Text('Forgot password?'))),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300.0,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: const Text('login'),
                      style:
                          FilledButton.styleFrom(backgroundColor: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Image.network(
            'https://www.shutterstock.com/image-photo/portrait-black-french-bulldog-on-600nw-2246977273.jpg',
            fit: BoxFit.cover,
          ),
        )
      ],
    ));
  }
}
