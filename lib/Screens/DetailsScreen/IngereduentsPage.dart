


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../../ShardDesgin/ShardWidget.dart';
import '../../get/profile/profileGetxController.dart';

class IngereduentsPage extends StatelessWidget{
  List<String> ingereduents ;
  IngereduentsPage({required this.ingereduents});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

        return Container(
          child: ListView.separated(
             shrinkWrap: true,
             padding: EdgeInsets.zero,
             physics: const NeverScrollableScrollPhysics(),
             itemBuilder: (ctx, index) =>
                 Container(
                   margin: EdgeInsets.only(
                     left: 8.w
                   ),
                   child: Text(ingereduents[index], style:  Theme.of(context).textTheme.headline6?.copyWith(
                     fontWeight: FontWeight.bold
                   ),),
             ),
            separatorBuilder: (context, index) {
              return const Divider(indent: 20,endIndent: 20,);
            },
            itemCount:ingereduents.length,
          ),
        ) ;


  }


}