class RoleModel {
  final String displayName;
  final String description;
  final String displayIcon;

  RoleModel({
    this.displayName,
    this.description,
    this.displayIcon,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return RoleModel(
        displayName: json['displayName'],
        description: json['description'],
        displayIcon: json['displayIcon'],
      );
    } else {
      return RoleModel(
        displayName: '',
        description: '',
        displayIcon: '',
      );
    }
  }
}
