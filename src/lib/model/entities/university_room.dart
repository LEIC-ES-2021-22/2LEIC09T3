class UniversityRoom {
  int roomId;
  String name;
  String urlToFloorImage;
  String urlToClassroomImage;

  UniversityRoom(int this.roomId, String this.name, String this.urlToFloorImage, this.urlToClassroomImage) {}

  Map<String, dynamic> toMap() {
    return {'roomId': roomId, 'name': name, 'urlTooFloorImage': urlToFloorImage, 'urlToClassroomImage': urlToClassroomImage};
  }

  UniversityRoom copyWith({int roomId, String name, String urlToFloorImage, String urlToClassroomImage}) {
    return UniversityRoom(roomId, name, urlToFloorImage, urlToClassroomImage);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniversityRoom &&
          runtimeType == other.runtimeType &&
          roomId == other.roomId &&
          name == other.name &&
          urlToFloorImage == other.urlToFloorImage &&
          urlToClassroomImage == other.urlToClassroomImage;

  @override
  int get hashCode => roomId.hashCode ^ name.hashCode ^ urlToFloorImage.hashCode ^ urlToClassroomImage.hashCode;
}
