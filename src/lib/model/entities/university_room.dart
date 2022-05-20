class UniversityRoom {
  String name;
  String path;

  UniversityRoom(String this.name, String this.path) {}

  Map<String, dynamic> toMap() {
    return {'name': name, 'path': path};
  }

  UniversityRoom copyWith({String name, String path}) {
    return UniversityRoom(name, path);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniversityRoom &&
        runtimeType == other.runtimeType &&
        name == other.name &&
        path == other.path;

  @override
  int get hashCode => name.hashCode ^ path.hashCode;
}