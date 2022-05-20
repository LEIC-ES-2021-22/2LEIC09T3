class UniversityMap {
  String room;
  String path;

  UniversityMap(String this.room, String this.path) {}

  Map<String, dynamic> toMap() {
    return {'room': room, 'path': path};
  }

  UniversityMap copyWith({String room, String path}) {
    return UniversityMap(room, path);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniversityMap &&
        runtimeType == other.runtimeType &&
        room == other.room &&
        path == other.path;

  @override
  int get hashCode => room.hashCode ^ path.hashCode;
}
