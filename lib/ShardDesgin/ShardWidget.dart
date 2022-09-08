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
      onPressed: () => onPresed,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 5),
        child: Text(
          lableText,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}

// asset image to network image
Widget SharedCircllerImage({
  double height = 82,
  double width = 82,
  required String ImageLink,
}) {
  return Container(
      height: height.w,
      width: width.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500.r),
          image:
              DecorationImage(image: AssetImage(ImageLink), fit: BoxFit.fill)));
}

Widget ShardTextToTabView({
  required String text,
  required BuildContext context,
  bool isSelected = false,
}) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyText2?.copyWith(
          fontSize: 16.sp,
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? isSelected
                  ? Color(0xFF030F09)
                  : Color(0xFF030F09).withOpacity(.4)
              : isSelected
                  ? Color(0xFFEFEFEF)
                  : Color(0xFFB2B2B2),
          fontWeight: FontWeight.w500,
        ),
  );
}

Widget ShardProfileRepceItem({
  required String MealName,
  required String ImageUrl,
  required BuildContext context,
}) {
  return Card(
    color: MediaQuery.of(context).platformBrightness == Brightness.light
        ? Colors.white
        : Color(0xFF030F09),
    clipBehavior: Clip.hardEdge,
    elevation: 15,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    child: Column(
      children: [
        Expanded(
          child: Container(
            child: Image(
              image: AssetImage(ImageUrl),
              fit: BoxFit.fill,
            ),
            width: double.infinity,
            height: 100.h,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 4.h),
          alignment: Alignment.center,
          child: Text(
            MealName,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    ),
  );
}

Widget ShardProfileUserDisgin({
  required String MealName,
  required String ImageUrl,
  required BuildContext context,
}) {
  return Container(
    height: 70.h,
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SharedCircllerImage(width: 50, height: 50, ImageLink: ImageUrl),
        SizedBox(
          width: 14.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'User Name',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 15.sp,
                  ),
            ),
            Text(
              'Account Name',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 15.sp,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Color(0xFF696969)
                      : Colors.grey[200]),
            ),
          ],
        ),
        Spacer(),
        InkWell(
          onTap: (){},

          child: Container(

            padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 4.h),
            decoration: BoxDecoration(
                color: MediaQuery.of(context).platformBrightness==Brightness.light?Color(0xFF30BE76) :
                Color(
                    0x9BB6B6B6),
                borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text('Following',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              ),
          ),
        )
      ],
    ),
  );
}
