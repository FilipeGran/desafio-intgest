// ignore_for_file: file_names

class UserId {
  String type;
  String className;
  String objectId;

  UserId({
    required this.type,
    required this.className,
    required this.objectId,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        type: json["__type"],
        className: json["className"],
        objectId: json["objectId"],
      );

  Map<String, dynamic> toJson() => {
        "__type": type,
        "className": className,
        "objectId": objectId,
      };
}
