import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_trial/provider_example.dart';

class Homescreen extends ConsumerWidget {
 const Homescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final text1 = ref.watch(readprovider);
    final text2 = ref.read(readprovider);

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        title: Text("Riverpod Examples"),
        centerTitle: true,
        backgroundColor: Colors.red.shade200,
      ),
      
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Text("Simple Provider Watch Example : $text1"),
          Text("Simple Provider Read Example : $text2")
        ],
      ),
    );
  }
}