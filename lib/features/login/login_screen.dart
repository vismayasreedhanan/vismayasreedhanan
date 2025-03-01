import 'package:flutter/material.dart';
import 'package:petspaw_admin/common_widget/custom_button.dart';
import 'package:petspaw_admin/common_widget/custom_text_formfield.dart';
import 'package:petspaw_admin/features/home/home_screen.dart';
import 'package:petspaw_admin/util/value_validator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pet.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    blurRadius: 10, // Softness of the shadow
                    spreadRadius: 2, // Spread of the shadow
                    offset: const Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Petspaw Admin',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Email',
                      controller: _emailController,
                      validator: emailValidator,
                      isLoading: false,
                    ),
                    const SizedBox(height: 25),
                    CustomTextFormField(
                      labelText: 'Password',
                      controller: _passwordController,
                      validator: notEmptyValidator,
                      isLoading: false,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forget Password?'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Spacer(),
                    CustomButton(
                      inverse: true,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      label: 'Login',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
