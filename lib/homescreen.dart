import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_trial/provider_example.dart';

class Homescreen extends ConsumerWidget {
 const Homescreen({super.key});

 void updatevalue(WidgetRef ref, int value) {
  ref.read(countProvider.notifier).update((state) => value);
 }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final text1 = ref.watch(readprovider);
    final text2 = ref.read(readprovider);
    final count = ref.watch(countProvider) ?? '0';

    final dataWidget = ref.watch(fetchProvider).when(data: (joke) => Text("${joke.setup}\n${joke.punchline}", style: TextStyle(fontSize: 16)),
    error: (error, stackTrace) => Text(error.toString()),
    loading: () => CircularProgressIndicator(),
    );

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
          Text("Simple Provider Read Example : $text2"),
          const SizedBox(height: 50,),
          Center(child: Text(count.toString(), style: TextStyle(fontSize: 20),)),
          //TextButton(onPressed: () => ref.read(countProvider.notifier).update((state) => value), child: Icon(Icons.add))
          Row( 
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () => updatevalue(ref, (int.tryParse(count.toString()) ?? 0) +1), child: Icon(Icons.add), ),
              TextButton(onPressed: () => updatevalue(ref, (int.tryParse(count.toString()) ?? 0) -1), child: Icon(Icons.remove), ),
            ],
          ),

          Text(dataWidget.toString()),
          
        ],
      ),
      
    );
  }
}