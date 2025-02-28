import 'package:flutter/material.dart';
import 'package:petspaw_admin/common_widget/custom_button.dart';
import 'package:petspaw_admin/common_widget/custom_text_formfield.dart';
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/paw_background.jpg"), // Add your image in assets
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Login Card
          Center(
            child: Container(
              width: 350,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    CustomTextFormField(
                        labelText: 'Email',
                        controller: _emailController,
                        validator: emailValidator,
                        isLoading: false),
                    SizedBox(height: 25),
                    CustomTextFormField(
                        labelText: 'Password',
                        controller: _passwordController,
                        validator: notEmptyValidator,
                        isLoading: false),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: Text('Forget Password?')),
                    ),
                    SizedBox(height: 10),
                    Spacer(),
                    CustomButton(
                      inverse: true,
                      onPressed: () {},
                      label: 'Login',
                    )
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
