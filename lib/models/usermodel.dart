class Userdata {
  Userdata({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar
  });

  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  factory Userdata.fromJson(Map<String, dynamic> json) =>
      Userdata(id: json["id"]?? "",
          email: json["email"]?? "",
          first_name: json["first_name"]?? "",
          last_name: json["last_name"]?? "",
          avatar: json["avatar"]?? "");

  Map<String, dynamic> toJson() => {
    "id": id,
    "email" : email,
    "first_name":first_name,
    "last_name":last_name,
    "avatar":avatar
  };

}
