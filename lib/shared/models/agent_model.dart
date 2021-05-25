import 'package:valorantapp/shared/models/role_model.dart';

class AgentModel {
  final String displayName;
  final String description;
  final String displayIcon;
  final String fullPortrait;
  final RoleModel role;

  AgentModel({
    this.displayName,
    this.description,
    this.displayIcon,
    this.fullPortrait,
    this.role,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'],
      fullPortrait: json['fullPortrait'],
      role: RoleModel.fromJson(json['role']),
    );
  }
}
