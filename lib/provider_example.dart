import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_trial/models/api.dart';

final readprovider = Provider<String>((ref) =>  "Hello, Riverpod");

final countProvider = StateProvider<int?>((ref) => null );

final fetchProvider = FutureProvider((ref) async {
  const url = "https://official-joke-api.appspot.com/random_joke";
  final response = await http.get(Uri.parse(url));
  return Joke.fromJson(jsonDecode(response.body));
} );