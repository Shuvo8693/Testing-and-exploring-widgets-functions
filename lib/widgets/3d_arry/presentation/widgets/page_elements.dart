import 'package:flutter/material.dart';
import 'package:testing_and_exploring_widgets/widgets/3d_arry/data/model/team_model.dart';

class PageElements extends StatelessWidget {
  const PageElements({
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: team.members.map((member) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Id: ${member.id}'),
                        Text('Name: ${member.name}'),
                        Text('Role: ${member.role}'),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Project: '),
                              if (member.projects!.isNotEmpty)...[
                                ...member.projects!.map(
                                  (project) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('ProjectId: ${project.projectID}'),
                                          Text('Name: ${project.name}'),
                                          Text('Status: ${project.status}'),
                                          Text('Deadline: ${project.deadline}'),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList()),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
