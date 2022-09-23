


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../../ShardDesgin/ShardWidget.dart';
import '../../get/profile/profileGetxController.dart';

class HowToCookPage extends StatelessWidget{
  String howTocook;

  HowToCookPage({required this.howTocook});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

        return Container(
          alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      left: 8.w
                  ),
                  child: Text(howTocook, style:  Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold
                  ),),
                );


  }


}