class Userinfo {
  final String name;
  final String job;
  final String id;
  final String createdAt;
  final String updatedAt;

  Userinfo(
      {required this.name,
      required this.job,
      required this.id,
      required this.createdAt,
      required this.updatedAt});

  factory Userinfo.fromJson(Map<String, dynamic> json) => Userinfo(
      name: json['name'] ?? "",
      id: json['id'] ?? "",
      job: json['job'] ?? "",
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['createdAt'] ?? "");

  Map<String, dynamic> toJson() => {
        'id': id,
        'job': job,
        'id': id,
        'createdAt': createdAt,
        'updatedAt': createdAt
      };
}
