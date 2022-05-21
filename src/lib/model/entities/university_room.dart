class UniversityRoom {
  int roomId;
  String name;
  String path;

  UniversityRoom(int this.roomId, String this.name, String this.path) {}

  Map<String, dynamic> toMap() {
    return {'roomId': roomId, 'name': name, 'path': path};
  }

  UniversityRoom copyWith({int roomId, String name, String path}) {
    return UniversityRoom(roomId, name, path);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniversityRoom &&
          runtimeType == other.runtimeType &&
          roomId == other.roomId &&
          name == other.name &&
          path == other.path;

  @override
  int get hashCode => roomId.hashCode ^ name.hashCode ^ path.hashCode;
}
