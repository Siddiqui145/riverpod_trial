import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_trial/provider_example.dart';

class WishlistItem {
  final String name;
  bool isBought;

  WishlistItem(this.name, {this.isBought = false});
}

class WishlistNotifier extends StateNotifier<List<WishlistItem>> {
  WishlistNotifier() : super([]);

  void addItem(String itemName) {
    state = [...state, WishlistItem(itemName)];
  }

  void removeItem(int index) {
    state = List.from(state)..removeAt(index);
  }

  void toggleBought(int index) {
    final updatedItem = state[index];
    updatedItem.isBought = !updatedItem.isBought;
    state = List.from(state);
  }
}

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final wishlist = ref.watch(wishlistProvider);
  final notifier = ref.read(wishlistProvider.notifier);
  final textController = TextEditingController();

  return Scaffold(
    appBar: AppBar(
      title: const Text('Wishlist Manager'),
      backgroundColor: Colors.blueGrey,
    ),
    body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Add an item'
                ),
              ),
             ),
             IconButton(onPressed: () {
              if (textController.text.isNotEmpty) {
                notifier.addItem(textController.text);
              }
             }, icon: const Icon(Icons.add))
            ],
          ),
          Expanded(child: ListView.builder(
            itemCount: wishlist.length,
            itemBuilder: (context, index) {
              final item = wishlist[index];
      
              return ListTile(
                title: Text(item.name,
                style: TextStyle(decoration:
                item.isBought ? TextDecoration.lineThrough 
                : TextDecoration.none),),
                trailing: 
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(value: item.isBought, onChanged: (value) => 
                    notifier.toggleBought(index)),
      
                    IconButton(onPressed: () => notifier.removeItem(index),
                     icon: const Icon(Icons.delete))
                  ],
                ),
              );
      
          }))
        ],
      ),
    ),
  );
 }
}