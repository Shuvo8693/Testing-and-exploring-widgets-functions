import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:testing_and_exploring_widgets/widgets/3d_arry/data/datasources/three_darry_local_datasource.dart';
import 'package:testing_and_exploring_widgets/widgets/3d_arry/data/model/team_model.dart';
import 'package:testing_and_exploring_widgets/widgets/3d_arry/presentation/widgets/page_element_withlistview.dart';

class ThreeDArrayScreen extends StatefulWidget {
  const ThreeDArrayScreen({super.key});

  @override
  State<ThreeDArrayScreen> createState() => _ThreeDArrayScreenState();
}

class _ThreeDArrayScreenState extends State<ThreeDArrayScreen> {
  late Future<dartz.Either<String, List<List<List<TeamResource>>>>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = ThreeDarryLocalDataSource.fetchLocalData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('3DArray'),
        centerTitle: true,
      ),
      body: FutureBuilder<dartz.Either<String, List<List<List<TeamResource>>>>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final data = snapshot.data;

            return data!.fold(
              (error) {
                return Center(child: Text(error));
              },
              (teams) {
                return ListView.builder(
                  itemCount: teams.length,
                  itemBuilder: (context, level1Index) {
                    return Column(
                      children: teams[level1Index].map(
                        (teams) {
                          return Column(
                              children: teams.map(
                            (team) {
                              return PageElementsWithListview(width: width, team: team,);
                            },
                          ).toList());
                        },
                      ).toList(),
                    );
                  },
                );
              },
            );
          }
          return const Text('Something went wrong');
        },
      ),
    );
  }
}
