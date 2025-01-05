import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:testing_and_exploring_widgets/widgets/3d_arry/data/model/team_model.dart';

class ThreeDarryLocalDataSource {

 static Future<Either<String, List<List<List<TeamResource>>>>>
      fetchLocalData() async {
    try {
      final jsonData = await rootBundle.loadString('assets/json/3d_arry.json');
      List<dynamic> decodedData = jsonDecode(jsonData);
      await Future.delayed(const Duration(seconds: 2));
      List<List<List<TeamResource>>> data = decodedData.map(
            (level1) => (level1 as List)
                .map(
                  (level2) => (level2 as List)
                      .map((team) => TeamResource.fromJson(team),
                  ).toList(),
                ).toList(),
          ).toList();
      return Right(data);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
