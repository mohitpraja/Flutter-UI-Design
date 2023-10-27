
class DatingModel {
  String? name;
  String? address;
  bool? isOnline;
  bool? isSaved;
  String? image;
  String? progress;
  int? level;
  int? newMatches;
  int? unMatched;
  int? allMatches;
  int? reMatches;
  int? profileViews;
  int? superLikes;

  DatingModel({this.name, this.address, this.isOnline, this.isSaved, this.image, this.progress, this.level, this.newMatches, this.unMatched, this.allMatches, this.reMatches, this.profileViews, this.superLikes});

  DatingModel.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["isOnline"] is bool) {
      isOnline = json["isOnline"];
    }
    if(json["isSaved"] is bool) {
      isSaved = json["isSaved"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["progress"] is String) {
      progress = json["progress"];
    }
    if(json["level"] is int) {
      level = json["level"];
    }
    if(json["newMatches"] is int) {
      newMatches = json["newMatches"];
    }
    if(json["unMatched"] is int) {
      unMatched = json["unMatched"];
    }
    if(json["allMatches"] is int) {
      allMatches = json["allMatches"];
    }
    if(json["reMatches"] is int) {
      reMatches = json["reMatches"];
    }
    if(json["profileViews"] is int) {
      profileViews = json["profileViews"];
    }
    if(json["superLikes"] is int) {
      superLikes = json["superLikes"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["address"] = address;
    data["isOnline"] = isOnline;
    data["isSaved"] = isSaved;
    data["image"] = image;
    data["progress"] = progress;
    data["level"] = level;
    data["newMatches"] = newMatches;
    data["unMatched"] = unMatched;
    data["allMatches"] = allMatches;
    data["reMatches"] = reMatches;
    data["profileViews"] = profileViews;
    data["superLikes"] = superLikes;
    return data;
  }
}