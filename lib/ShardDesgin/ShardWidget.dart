import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ShardTextFromFiled({
  required BuildContext context,
  required String? lableText,
  required String? hintText,
  horizontalMargin = 16.0,
  verticalMargin = 8.0,
  Function(String)? onChange,
  Function(String)? onSubmit,
  required TextEditingController controller,
  bool obscureText = false,
  required TextInputType textInputType,
  maxLine = 1,
  maxLength = 30,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin, vertical: verticalMargin),
    child: TextFormField(
      controller: controller,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        labelText: lableText,
        hintText: hintText,
      ),
      obscureText: obscureText,
      keyboardType: textInputType,
      maxLines: maxLine,

      cursorColor: MediaQuery.of(context).platformBrightness == Brightness.light
          ? Colors.black
          : Colors.grey[100],
    ),
  );
}

Widget ShardMaterialButton({
  required BuildContext context,
  required String  lableText,
  horizontalMargin = 16,
  verticalMargin = 8,
 double margenBottom = 22.0,
 double margenTop = 32.0,
 double margenRight = 16.0,
 double margenLeft = 16.0,
  required Function onPresed,
}) {
  return Container(
    height: 50.h,
    decoration: BoxDecoration(
        color: Color(0xFF30BE76), borderRadius: BorderRadius.circular(8.r)),
    margin: EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 22),
    child: MaterialButton(
      minWidth: double.infinity,
      onPressed:()=> onPresed,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 5),
        child: Text(
          lableText,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500
          ),
        ),
      ),
    ),
  );
}
