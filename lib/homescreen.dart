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
    final result = ref.watch(fetchProvider);
    final newData = ref.watch(getDataProvider);
    final streamdata = ref.watch(streamProvider);
    final timedata = ref.watch(timeProvider);

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        title: Text("Riverpod Examples"),
        centerTitle: true,
        backgroundColor: Colors.red.shade200,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          
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
        
            const SizedBox(height: 20,),
        
            Center(
              child: result.when(data: (joke) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Joke type: ${joke.type}"),
                  const SizedBox(height: 10,),
                  Text("Joke PunchLine : ${joke.punchline}"),
                  const SizedBox(height: 10,),
                  Text("Joke ${joke.setup}"),
                ],
              ), error: (error, stackTrace) => Text("Error: $error"), loading: () => const CircularProgressIndicator()),
            ),
        
            const SizedBox(height: 25,),
            Center(
                child: newData.when(data: (dog) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(dog.message),
                    const SizedBox(height: 10,),
                    Text(dog.status)
                  ],
                ), error: (error, stackTrace) => Text("Error : $error"), loading: () => const CircularProgressIndicator()),
            ),
            const SizedBox(height: 15,),
            Center(
              child: streamdata.when(data: (data) {
                return Text(data.toString());
              }, error: (error, stackTrace) {
                return Text(error.toString());
              }, loading: () { 
               return Center(child: CircularProgressIndicator(),);
              } ),
            ),
            const SizedBox(height: 15,),
            Center(
              child: timedata.when(data: (dataa) {
                return Text(dataa.toString());
              }, error: (error, stackTrace) {
                return Text(error.toString());
              }, loading: () {
                 return Center(
                  child: CircularProgressIndicator(),
                );
              }),
            )
            
          ],
        ),
      ),
      
    );
  }
}