import 'package:flutter_riverpod/flutter_riverpod.dart';

final readprovider = Provider<String>((ref) =>  "Hello, Riverpod");

final countProvider = StateProvider<int?>((ref) => null );