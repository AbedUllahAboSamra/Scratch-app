// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scratchfood/Screens/LoginAndCreeatAccount/LoginScreen.dart';
import 'package:scratchfood/util/context_extenssion.dart';
import '../../API/auth_api_controller.dart';
import '../../ShardDesgin/ShardWidget.dart';
import '../../model/api_response.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 260.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Image.jpg'),
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                    ),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(100)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 22, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/logo.jpg'),
                            height: 28.r,
                            width: 18.r,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('data',
                              style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                      SizedBox(
                        height: 94,
                      ),
                      Text(
                        'Start\nfrom Scratch',
                        style: Theme.of(context).textTheme.headline2,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                child: Text(
                  'Create account to continue.',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.grey[500], fontWeight: FontWeight.w400),
                )),
            ShardTextFromFiled(
                context: context,
                lableText: 'Full Name',
                hintText: null,
                controller: nameController,
                textInputType: TextInputType.name),
            ShardTextFromFiled(
                context: context,
                lableText: 'Email address',
                hintText: null,
                onChange: (s) {
                  print(s);
                },
                controller: emailController,
                textInputType: TextInputType.emailAddress),
            ShardTextFromFiled(
                context: context,
                lableText: 'Password',
                hintText: null,
                controller: passwordController,
                textInputType: TextInputType.emailAddress),
            ShardMaterialButton(
                context: context,
                lableText: 'Create Account',
                onPresed: () {
                  _performRegister();
                }),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.grey[500], fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => LoginScreen()));
                      },
                      child: Text(
                        'Login Here',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Color(0xFF30BE76).withOpacity(.8),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performRegister() {
    if (_checkData()) {
      _register();
    }
  }

  bool _checkData() {
    if (emailController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      return true;
    }
    context.ShowSnackBar(message: 'Enter Required Data', error: true);
    return false;
  }

  void _register() async {
    ApiResponse response = await AuthApiController().register(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text);
    if (response.success) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
    context.ShowSnackBar(message: response.message, error: !response.success);
  }

}
