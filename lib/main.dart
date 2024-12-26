import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your
  // application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
                    height: 10,
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
                      onPressed: () {},
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
