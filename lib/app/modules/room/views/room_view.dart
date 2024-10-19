import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_dare/app/constants.dart';
import 'package:truth_dare/app/routes/app_pages.dart';
import '../controllers/room_controller.dart';

class RoomView extends GetView<RoomController> {
  const RoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('123456'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.copy))],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: CustomColors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: ElevatedButton(onPressed: (){
            Get.offNamed(AppPages.ROLL);
          }, child: Text('Start'),))
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const Text('Room name'),
              const Text('Room name'),
              Expanded(
                child: Obx(() {
                  // Ensure persons list is observable and loaded correctly
                  return ListView.builder(
                    itemCount: controller.persons.length,
                    itemBuilder: (context, index) {
                      final person = controller.persons[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(person.image),
                        ),
                        title: Text(person.name),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
          DraggableButton(
            onTap: (){
              Get.toNamed(AppPages.CHAT,);
            },
          ),

        ],
      ),
    );
  }
}

class DraggableButton extends StatefulWidget {
  const DraggableButton({super.key, required this.onTap});

  final Function onTap;

  @override
  _DraggableButtonState createState() => _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton> {
  Offset position = const Offset(300, 600); // Initial position of the button

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; // Screen size

    return Stack(
      children: [
        Positioned(
          left: position.dx,
          top: position.dy,

          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                // Update position while dragging within screen bounds
                position = Offset(
                  (position.dx + details.delta.dx).clamp(0, screenSize.width - 56), // Ensure within horizontal bounds
                  (position.dy + details.delta.dy).clamp(0, screenSize.height*0.85 - 56), // Ensure within vertical bounds
                );
              });
            },
            onPanEnd: (details) {
              // Snap to the nearest side when released
              final double centerX = screenSize.width / 2;

              setState(() {
                position = Offset(
                  position.dx < centerX ? 0 : screenSize.width - 56, // Snap to left or right
                  position.dy, // Maintain vertical position
                );
              });
            },
            child: FloatingActionButton(
              onPressed: () {
                widget.onTap.call();
              },
              backgroundColor: Colors.blue.withOpacity(0.8),
              shape: const CircleBorder(),
              child: const Icon(Icons.timer_outlined),
            ),
          ),
        ),
      ],
    );
  }
}
