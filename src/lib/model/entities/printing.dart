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
    return Printing(
        data['name'],
        data['path'],
        data['size'] == 0 ? PageSize.a3 : PageSize.a4,
        data['color'] == 0 ? PrintingColor.color : PrintingColor.baw,
        data['copies']);
  }

  static Future<Map<String, dynamic>> selectFile() async {
    final FilePickerResult result =
        await FilePicker.platform.pickFiles(
          allowMultiple: false,
          allowedExtensions: [
            'xlam',
            'xls',
            'xlsb',
            'xlsm',
            'xlsx',
            'xltm',
            'xltx',
            'pot',
            'potm',
            'potx',
            'ppam',
            'pps',
            'ppsm',
            'ppsx',
            'ppt',
            'pptm',
            'pptx',
            'doc',
            'docm',
            'docx',
            'dot',
            'dotm',
            'dotx',
            'rtf',
            'txt',
            'pdf',
            'bmp',
            'dib',
            'gif',
            'jfif',
            'jif',
            'jpe',
            'jpeg',
            'jpg',
            'png',
            'tif',
            'tiff',
            'xps'
          ]
        );

    if (result == null) {
      return null;
    }

    final PlatformFile file = result.files.first;

    return {'name': file.name, 'path': file.path};
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'path': path,
      'size': pageSize.index,
      'color': color.index,
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
