import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  style: Theme.of(context).textTheme.headline6,
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email address',
                ),
                cursorColor: MediaQuery.of(context).platformBrightness ==
                    Brightness.light
                    ? Colors.black
                    : Colors.grey[100],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                cursorColor: MediaQuery.of(context).platformBrightness ==
                    Brightness.light
                    ? Colors.black
                    : Colors.grey[100],
              ),
            ),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                  color: Color(0xFF30BE76),
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 22),
              child: MaterialButton(
                minWidth: double.infinity,
                onPressed: () {},
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Text(
                    'New to Scratch?',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 4,),
                  InkWell(

                      onTap: () {},
                      child: Text(
                        'Create Account Here',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Color(0xFF30BE76),
                            fontSize: 16,
                            fontWeight: FontWeight.w600
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
}
