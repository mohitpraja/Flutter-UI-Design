
class AllAppList {
  String? name;
  String? image;
  String? route;

  AllAppList({this.name, this.image, this.route});

  AllAppList.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["route"] is String) {
      route = json["route"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["image"] = image;
    data["route"] = route;
    return data;
  }
}