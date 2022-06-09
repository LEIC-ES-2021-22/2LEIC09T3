import 'dart:convert';

import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:collection';

import 'package:uni/model/entities/uni_notification.dart';
import 'package:uni/model/entities/university_room.dart';

Future<UniversityRoom> parseUniversityRoom(String uniRoomJson) async {
  final uniRoom = jsonDecode(uniRoomJson);

  final int roomId = uniRoom['roomId'];
  final String name = uniRoom['name'];
  final String urlToFloorImage = uniRoom['urlToFloorImage'];
  final String urlToClassroomImage = uniRoom['urlToClassroomImage'];

  return UniversityRoom(roomId, name, urlToFloorImage, urlToClassroomImage);
}
