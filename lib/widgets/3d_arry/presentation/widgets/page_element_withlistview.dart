import 'package:flutter/material.dart';
import 'package:testing_and_exploring_widgets/widgets/3d_arry/data/model/team_model.dart';

class PageElementsWithListview extends StatelessWidget {
  const PageElementsWithListview({
    super.key,
    required this.width,
    required this.team,
  });

  final double width;
  final TeamResource team;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Department : ${team.department}'),
            Text('Team: ${team.team}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('numbers: '),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                   // physics: const NeverScrollableScrollPhysics(),
                    itemCount: team.members.length,
                    itemBuilder: (context, index) {
                      final member = team.members[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Id: ${member.id}'),
                          Text('Name: ${member.name}'),
                          Text('Role: ${member.role}'),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Project: '),
                              Flexible(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                       shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: member.projects?.length??0,
                                      itemBuilder: (context, index) {
                                        final project = member.projects![index];
                                        return Padding(
                                          padding: const EdgeInsets.only(right: 8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('ProjectId: ${project.projectID??0}'),
                                              Text('Name: ${project.name??''}'),
                                              Text('Status: ${project.status??''}'),
                                              Text('Deadline: ${project.deadline??''}'),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
