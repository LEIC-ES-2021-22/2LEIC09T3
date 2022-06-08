import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Printing {
  final int id;
  final String name;
  final String path;
  final String pageSize;
  final bool color;
  final int numCopies;
  final double price;

  Printing(
      int this.id,
      String this.name,
      String this.path,
      String this.pageSize,
      bool this.color,
      int this.numCopies,
      double this.price);

  static Printing fromJson(dynamic data) {
    return Printing(data['id'], data['name'], data['path'], data['size'],
        data['color'], data['copies'], data['price']);
  }

  static Future<Map<String, String>> selectFile() async {
    final FilePickerResult result =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) {
      return {'name': 'not found', 'path': '/'}; //maybe make the map <String, Dynamic> and return null instead?
    }

    final PlatformFile file = result.files.first;

    return {'name': file.name, 'path': file.path};
  }

  bool isValid(Printing printing) {
    return !(printing.name == 'not found' && printing.path == '/');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'path': path,
      'size': pageSize,
      'color': color,
      'numCopies': numCopies,
      'price': price
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Printing && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
