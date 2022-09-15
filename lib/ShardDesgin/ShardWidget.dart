import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ShardTextFromFiled({
  required BuildContext context,
  required String? lableText,
  required String? hintText,
  horizontalMargin = 16.0 ,
  verticalMargin = 8.0 ,
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
        horizontal: horizontalMargin, vertical: verticalMargin ),
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
  required String lableText,
  horizontalMargin = 16,
  verticalMargin = 8,
  double margenBottom = 22.0,
  double margenTop = 32.0,
  double margenRight = 16.0,
  double margenLeft = 16.0,
  double radis = 8.0,
  required Function onPresed,
}) {
  return Container(
    height: 50.h,
    decoration: BoxDecoration(
        color: Color(0xFF30BE76), borderRadius: BorderRadius.circular(radis.r)),
    margin: EdgeInsets.only(left: margenLeft.w, right: margenRight.w, top: margenTop.h, bottom: margenBottom.h),
    child: MaterialButton(  splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      minWidth: double.infinity,
      onPressed: () => onPresed,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 5.h),
        child: Text(
          lableText,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w500),
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
        : Color(0x51777777),
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
        SharedCircllerImage(width: 50.h, height: 50.h, ImageLink: ImageUrl),
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
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
            decoration: BoxDecoration(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Color(0xFF30BE76)
                      : Color(0x9BB6B6B6),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              'Following',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget SharedSearchRecipesDesign({
  required BuildContext context,
  required String recipesName,
  required String imageUrl,
}) {
  return Container(
    width: 120.w,
    child: Column(
      children: [
        Image(image: AssetImage(imageUrl)),
        SizedBox(
          height: 4.h,
        ),
        Text(
          recipesName,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontWeight: FontWeight.w200,
              ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

Widget SharedSearchProfileCardDesign({
  required BuildContext context,
  required String lastPostImageUrl,
  required String chefImageUrl,
  required String chefName,
  required int numberOfFollowers,
  required int numberOfRecipes,
  required int index,
}) {
  return Container(
    child: Card(
      margin: EdgeInsets.only(left: index == 0 ? 20.w : 10.w, right: 10.w),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        child: Container(
          width: 182.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Image(
                    image: NetworkImage(
                      lastPostImageUrl,
                    ),
                    fit: BoxFit.fill,
                  )),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0x59A9A9A9),
                  Color(0x3FA9A9A9),
                  Color(0x3AFFFFFF)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Card(
                      clipBehavior: Clip.hardEdge,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(555.r),
                      ),
                      child: Container(
                        height: 80.w,
                        width: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5555.r),
                          color: Colors.white,
                        ),
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          margin: EdgeInsets.all(8.r),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(555.r),
                          ),
                          child: Image(
                            image: NetworkImage(chefImageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Text(chefName),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(numberOfRecipes.toString(),
                                style: Theme.of(context).textTheme.headline6),
                            Text('recipes',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        fontSize: 10.sp,
                                        color: Color(0xFF707070),
                                        fontWeight: FontWeight.w400)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(numberOfFollowers.toString(),
                                style: Theme.of(context).textTheme.headline6),
                            Text('followers',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        fontSize: 10.sp,
                                        color: Color(0xFF707070),
                                        fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget SharedSearchRecipes2Design({
  required BuildContext context,
  required String recipesName,
  required String imageUrl,
  required int index,
}) {
  return Container(
    width: 125.w,
    height: 200.h,
    margin: EdgeInsets.only(left: index == 0 ? 20.w : 10.w, right: 10.w),
    child: Column(
      children: [
        Expanded(
            child: Image(
          image: NetworkImage(imageUrl),
          fit: BoxFit.fitHeight,
        )),
        SizedBox(
          height: 4.h,
        ),
        Text(
          recipesName,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.w200,
              ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 4.h,
        ),
      ],
    ),
  );
}

Widget SharedTagDesignItem({
  required BuildContext context,
  required String tagName,
  required int followersNum,
  required int likesNum,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 8.h,
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        tagName,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
      ),
      SizedBox(
        height: 4.h,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$followersNum followers',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 14.sp,
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Color(0xFF606060)
                    : Colors.grey[200]),
          ),
          SizedBox(
            width: 8.w,
          ),
          Container(
            height: 3.w,
            width: 3.w,
            decoration: BoxDecoration(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Color(0xFF979797)
                      : Colors.grey[200],
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            '$likesNum likes',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 14.sp,
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Color(0xFF606060)
                    : Colors.grey[200]),
          ),
        ],
      ),
    ]),
  );
}
