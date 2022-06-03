import 'dart:convert';

import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:collection';

import 'package:uni/model/entities/virtual_card.dart';

Future<VirtualCard> parseCard(String cardJson) async {
  final card = jsonDecode(cardJson);

  final int id = card['id'];
  final String privateKey = card['key'];

  return VirtualCard(id, privateKey);
}
