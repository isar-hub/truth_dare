import 'package:get/get.dart';
import 'package:truth_dare/app/data/person_model.dart';

class RoomController extends GetxController {

  var persons = <PersonModel>[].obs;


  @override
  void onInit() {

    persons.addAll(
      [
        PersonModel(name: 'Isar', image: 'https://picsum.photos/id/237/200/300'),
        PersonModel(name: 'saista', image: 'https://picsum.photos/id/237/200/300')
      ],

    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
