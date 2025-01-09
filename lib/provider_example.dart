import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_trial/models/api.dart';
import 'package:riverpod_trial/todo_notifier.dart';
import 'package:riverpod_trial/wishlist_state_notifier.dart';

final readprovider = Provider<String>((ref) =>  "Hello, Riverpod");

final countProvider = StateProvider<int?>((ref) => null );

final fetchProvider = FutureProvider((ref) async {
  const url = "https://official-joke-api.appspot.com/random_joke";
  final response = await http.get(Uri.parse(url));
  return Joke.fromJson(jsonDecode(response.body));
} );

final getDataProvider = FutureProvider((ref) async {
  const url = "https://dog.ceo/api/breeds/image/random";
  final response = await http.get(Uri.parse(url));
  return Dogs.fromJson(jsonDecode(response.body));
});

final streamProvider = StreamProvider ((ref) async* {
   yield [1,2,3,4,5];
});

final timeProvider = StreamProvider<DateTime>((ref) {
  return Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());
});

final todoProvider = NotifierProvider <TodoNotifier, List<Todo>>(TodoNotifier.new);

final wishlistProvider = StateNotifierProvider<WishlistNotifier, List<WishlistItem>>(
  (ref) => WishlistNotifier(),
);
