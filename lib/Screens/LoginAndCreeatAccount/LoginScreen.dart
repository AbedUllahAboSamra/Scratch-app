import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scratchfood/Screens/LoginAndCreeatAccount/CreateAccountScreen.dart';

import '../../ShardDesgin/ShardWidget.dart';
import '../MainScreen/MainScreenController.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainScreenController()));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => CreateAccountScreen()));
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
}
