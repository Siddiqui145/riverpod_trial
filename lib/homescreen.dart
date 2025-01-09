import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_trial/provider_example.dart';
import 'package:riverpod_trial/todo_notifier.dart';
import 'package:riverpod_trial/wishlist_state_notifier.dart';

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
        backgroundColor: Colors.black38,
        actions: [

          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoListScreen()));
          }, icon: const Icon(Icons.work)),

          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WishlistScreen()));
          }, icon: const Icon(Icons.favorite))
        ],
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 20,),
              Text("Simple Provider Watch Example : \n $text1"),
              const SizedBox(height: 10,),
              const Divider(thickness: 10,
              color: Colors.black45,),
              const SizedBox(height: 20,),
              Text("Simple Provider Read Example : \n $text2"),
              const SizedBox(height: 10,),
              const Divider(thickness: 10,
              color: Colors.black45,),
              const SizedBox(height: 20,),

              Center(child: Text(count.toString(), style: TextStyle(fontSize: 20),)),
              //TextButton(onPressed: () => ref.read(countProvider.notifier).update((state) => value), child: Icon(Icons.add))
              Row( 
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () => updatevalue(ref, (int.tryParse(count.toString()) ?? 0) +1), child: Icon(Icons.add), ),
                  TextButton(onPressed: () => updatevalue(ref, (int.tryParse(count.toString()) ?? 0) -1), child: Icon(Icons.remove), ),
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(thickness: 10,
              color: Colors.black45,),
              const SizedBox(height: 20,),

              Center(
                child: result.when(data: (joke) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Joke Type: ${joke.type}"),
                    const SizedBox(height: 10,),
                    Text("Joke PunchLine : ${joke.punchline}"),
                    const SizedBox(height: 10,),
                    Text("Joke ${joke.setup}"),
                  ],
                ), error: (error, stackTrace) => Text("Error: $error"), loading: () => const CircularProgressIndicator()),
              ),
              const SizedBox(height: 10,),
              const Divider(thickness: 10,
              color: Colors.black45,),
              const SizedBox(height: 20,),

              Center(
                  child: newData.when(data: (dog) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(dog.message),
                      const SizedBox(height: 10,),
                      //Text(dog.status)
                    ],
                  ), error: (error, stackTrace) => Text("Error : $error"), loading: () => const CircularProgressIndicator()),
              ),

              const SizedBox(height: 10,),
              const Divider(thickness: 10,
              color: Colors.black45,),
              const SizedBox(height: 20,),

              Center(
                child: streamdata.when(data: (data) {
                  return Text(data.toString());
                }, error: (error, stackTrace) {
                  return Text(error.toString());
                }, loading: () { 
                 return Center(child: CircularProgressIndicator(),);
                } ),
              ),

              const SizedBox(height: 10,),
              const Divider(thickness: 10,
              color: Colors.black45,),
              const SizedBox(height: 20,),

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
              ),

              const SizedBox(height: 10,),
              const Divider(thickness: 10,
              color: Colors.black45,),
              const SizedBox(height: 20,),
              
            ],
          ),
        ),
      ),
      
    );
  }
}