import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_and_exploring_widgets/core/size/size.dart';
import 'package:testing_and_exploring_widgets/widgets/controller/liner_progress_controller.dart';

class LinerProgressBar extends StatefulWidget {
  const LinerProgressBar({super.key});

  @override
  State<LinerProgressBar> createState() => _LinerProgressBarState();
}

class _LinerProgressBarState extends State<LinerProgressBar> {
  final LinerProgressController _linerProgressController =
      Get.put(LinerProgressController());

  Map<String,dynamic> taskDetail={
    'data':[
      {'task':'Push-up',},
      {'task':'Long Run',},
      {'task':'Chin-up',},
      {'task':'Shooting Ak-47',},
    ]
  };
@override
  void initState() {
    super.initState();
    _linerProgressController.initializeCheckBoxList((taskDetail['data'] as List).length);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liner Progress Bar'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                  '${_linerProgressController.progressValue.value * 100}%');
            }),
            SizedBox(height: 30.rH(context)),
            SizedBox(
              width: 200,
              child: Obx(() {
                return LinearProgressIndicator(
                  color: Colors.teal,
                  value: _linerProgressController.progressValue.value,
                  minHeight: 35,
                  borderRadius: BorderRadius.circular(12),
                );
              }),
            ),
            SizedBox(height: 30.rH(context)),
            ListView.builder(
              itemCount: (taskDetail['data'] as List).length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
               int taskLength = (taskDetail['data'] as List).length;
               final taskData= (taskDetail['data'] as List)[index];
                return  CheckBoxElement(
                  linerProgressController: _linerProgressController,
                  taskTitle: taskData['task'],
                  progressValue: (1 / taskLength),
                  index: index,
                );
              },

            ),

          ],
        ),
      ),
    );
  }
}

class CheckBoxElement extends StatelessWidget {
  const CheckBoxElement({
    super.key,
    required LinerProgressController linerProgressController, this.taskTitle, this.progressValue, required this.index,
  }) : _linerProgressController = linerProgressController;

  final LinerProgressController _linerProgressController;
  final String? taskTitle;
  final double? progressValue;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(taskTitle??''),
          SizedBox(width: 30.rH(context)),
          Checkbox(
              value: _linerProgressController.isCheckedList[index].value,
              onChanged: (value) {
                _linerProgressController.isCheckedList[index].value = value!;
                if (value) {
                  _linerProgressController.progressValue.value += progressValue??0.0;
                } else if (!value) {
                  _linerProgressController.progressValue.value -= progressValue??0.0;
                }
              })
        ],
      );
    });
  }
}
