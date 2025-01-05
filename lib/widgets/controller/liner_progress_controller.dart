import 'package:get/get.dart';

class LinerProgressController extends GetxController{
  RxList<RxBool> isCheckedList =<RxBool>[].obs;
  RxDouble progressValue=0.0.obs;
  void initializeCheckBoxList(int taskCount){
    isCheckedList.value= List.generate(taskCount, (_)=> false.obs);
  }
}