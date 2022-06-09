import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

enum PageSize { a3, a4 }

enum PrintingColor { color, baw }

class Printing {
  final String name;
  final String path;
  final PageSize pageSize;
  final PrintingColor color;
  final int numCopies;

  Printing(
    String this.name,
    String this.path,
    PageSize this.pageSize,
    PrintingColor this.color,
    int this.numCopies,
  );

  static Printing fromJson(dynamic data) {
    return Printing(data['name'], data['path'], data['size'], data['color'],
        data['copies']);
  }

  static Future<Map<String, dynamic>> selectFile() async {
    final FilePickerResult result =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) {
      return {'name': null, 'path': null};
    }

    final PlatformFile file = result.files.first;

    return {'name': file.name, 'path': file.path};
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'path': path,
      'size': pageSize,
      'color': color,
      'numCopies': numCopies,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Printing &&
          runtimeType == other.runtimeType &&
          path == other.path &&
          pageSize == other.pageSize &&
          color == other.color &&
          numCopies == other.numCopies;

  @override
  int get hashCode =>
      path.hashCode ^ pageSize.hashCode ^ color.hashCode ^ numCopies.hashCode;
}
