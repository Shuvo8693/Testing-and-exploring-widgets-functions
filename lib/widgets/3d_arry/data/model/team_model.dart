class TeamResource {
 final String department;
 final String team;
 final List<MemberResource> members;

  TeamResource(
      {required this.department, required this.members, required this.team});

factory  TeamResource.fromJson(Map<String, dynamic> data) {
   return TeamResource(
       department : data['department'],
       team : data['team'],
       members : (data['members'] as List)
       .map((element) => MemberResource.fromJson(element)).toList()
   );
  }
}

class MemberResource {
  int? id;
  String? name;
  String? role;
  List<Project>? projects;

  MemberResource(this.name, this.id, this.projects, this.role);

  MemberResource.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    role = data['role'];
    projects = (data['projects'] as List)
        .map((element) => Project.fromJson(element))
        .toList();
  }
}

class Project {
  int? projectID;
  String? name;
  String? status;
  String? deadline;

  Project(this.name, this.status, this.deadline, this.projectID);

  Project.fromJson(Map<String, dynamic> data) {
    projectID = data['projectId'];
    name = data['name'];
    status = data['status'];
    deadline = data['deadline'];
  }
}
