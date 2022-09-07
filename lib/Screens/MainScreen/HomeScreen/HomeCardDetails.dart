import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCardDetails extends StatelessWidget {
  const HomeCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
      child: Container(
        width: 295.w,
        height: 556.h,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0, 0),
              blurRadius: 15)
        ]),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(13.r),
                width: double.infinity,
                height: 62.h,
                child: Row(
                  children: [
                    Image.asset("assets/Image/avatar.png"),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.r, horizontal: 10.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Profile Name",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "2h ago",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 295.w,
                height: 302.h,
                child: Image.asset("assets/Image/Feed_Card.png",fit: BoxFit.fill,),
              ),
              Container(
                margin: EdgeInsets.all(13.r),
                width: 265.w,
                height: 130.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Red Wine and Mint Soufflé",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_outline,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    Text(
                      "Apparently we had reached a great height in the atmosphere, for the sky was …",
                      style: TextStyle(color: Colors.grey, fontSize: 12.r),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 130.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("32 likes", style: TextStyle(fontSize: 12)),
                              Text(
                                ".",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                              Text(
                                "8 Comments",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                  Colors.green.shade400),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                    width: 2, color: Colors.green.shade400),
                              ),
                              fixedSize:
                                  MaterialStateProperty.all(Size(73.w, 26.h))),
                          child: const Text("+ Save"),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
