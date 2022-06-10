class UniversityRoom {
  int roomId;
  String name;
  String buildingName;
  String urlToFloorImage;
  String urlToClassroomImage;

  UniversityRoom(int this.roomId, String this.buildingName,  String this.name, String this.urlToFloorImage, this.urlToClassroomImage) {}

  Map<String, dynamic> toMap() {
    return {'roomId': roomId, 'buildingName': buildingName, 'name': name, 'urlTooFloorImage': urlToFloorImage, 'urlToClassroomImage': urlToClassroomImage};
  }

  UniversityRoom copyWith({int roomId, String buildingName, String name, String urlToFloorImage, String urlToClassroomImage}) {
    return UniversityRoom(roomId, buildingName, name, urlToFloorImage, urlToClassroomImage);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniversityRoom &&
          runtimeType == other.runtimeType &&
          roomId == other.roomId &&
          name == other.name &&
          buildingName == other.buildingName &&
          urlToFloorImage == other.urlToFloorImage &&
          urlToClassroomImage == other.urlToClassroomImage;

  @override
  int get hashCode => roomId.hashCode ^ name.hashCode ^ urlToFloorImage.hashCode ^ urlToClassroomImage.hashCode;
}
