class UniversityRoom {
  int roomId;
  String name;
  String pathToImage;

  UniversityRoom(int this.roomId, String this.name, String this.pathToImage) {}

  Map<String, dynamic> toMap() {
    return {'roomId': roomId, 'name': name, 'pathToImage': pathToImage};
  }

  UniversityRoom copyWith({int roomId, String name, String pathToImage}) {
    return UniversityRoom(roomId, name, pathToImage);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniversityRoom &&
          runtimeType == other.runtimeType &&
          roomId == other.roomId &&
          name == other.name &&
          pathToImage == other.pathToImage;

  @override
  int get hashCode => roomId.hashCode ^ name.hashCode ^ pathToImage.hashCode;
}
