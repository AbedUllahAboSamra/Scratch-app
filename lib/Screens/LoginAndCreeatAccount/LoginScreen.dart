import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scratchfood/API/auth_api_controller.dart';
import 'package:scratchfood/Screens/LoginAndCreeatAccount/CreateAccountScreen.dart';
import 'package:scratchfood/Screens/MainScreen/HomeScreen/HomeScreen.dart';
import 'package:scratchfood/util/context_extenssion.dart';

import '../../ShardDesgin/ShardWidget.dart';
import '../../get/setting/SettingController.dart';
import '../../model/api_response.dart';
import '../MainScreen/MainScreenController.dart';

class LoginScreen extends StatefulWidget {
  static String loginScreenNamed = '/login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                        'Welcome Back!',
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
                  'Please login to continue.',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.grey[500], fontWeight: FontWeight.w400),
                )),
            ShardTextFromFiled(
                context: context,
                lableText: 'Email address',
                hintText: null,
                controller: emailController,
                textInputType: TextInputType.emailAddress),
            ShardTextFromFiled(
                context: context,
                lableText: 'Password',
                hintText: null,
                controller: passwordController,
                textInputType: TextInputType.visiblePassword),
            ShardMaterialButton(
                context: context,
                lableText: 'Login',
                onPresed: () {
                  print('object');
                  _performLogin();
                }),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Text(
                    'New to Scratch?',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.grey[500], fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  InkWell(
                      onTap: () {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) {
                            return CreateAccountScreen();
                          }));
                        });
                      },
                      child: Text(
                        'Create Account Here',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Color(0xFF30BE76).withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    }
    context.ShowSnackBar(message: 'Enter Required Data', error: true);
    return false;
  }

  void _login() async {
    ApiResponse response = await AuthApiController().login(
      email: emailController.text,
      password: passwordController.text,
    );
    print(response.success);
    if (response.success) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MainScreenController()));
    }
    context.ShowSnackBar(message: response.message, error: !response.success);
  }
}
