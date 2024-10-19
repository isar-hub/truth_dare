import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../routes/app_pages.dart';
import '../../room/views/room_view.dart';
import '../controllers/rolling_controller.dart';

class RollingView extends GetView<RollingController> {
  const RollingView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.background,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Divider(color: CustomColors.black,),
                  Center(
                    child: Card(
                      color: CustomColors.backgroundDark,
                      child: AnimatedContainer(
                        curve: Curves.decelerate,
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 60),
                        duration:Duration(seconds: 10) ,
                        child: const Text('START ROLLING',style: TextStyle(fontSize: 40),),
                      ),
                    ),
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 1.0, end: true ? 1.0 : 1.0),
                    duration: Duration(seconds: 10),
                    curve: Curves.linear,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(MediaQuery.of(context).size.width * value, 0),
                        child: child,

                      );
                    },

                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                  ),

                  Divider(color: CustomColors.black,)
                ],
              ),
            ),
            DraggableButton(
              onTap: (){
                Get.toNamed(AppPages.CHAT,);
              },
            ),
      
          ],
        ),
      ),
    );
  }
}
