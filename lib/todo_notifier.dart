import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_trial/provider_example.dart';

class Todo {
  final String title;
  Todo(this.title);
}

class TodoNotifier extends Notifier<List<Todo>> {
  @override 
  List<Todo> build() => [];

  void addTask(String taskTitle) {
  state = [...state, Todo(taskTitle)];
}

void removeTask(int index) {
  state = List.from(state)..removeAt(index);
}
}


class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoProvider);
    final notifier = ref.read(todoProvider.notifier);
    final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifier Provider - Todo List'),
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
                    hintText: 'Enter a task'
                  ),
                ),
               ),
               IconButton(onPressed: () {
                if (textController.text.isNotEmpty) {
                  notifier.addTask(textController.text);
                  textController.clear();
                }
               }, icon: const Icon(Icons.add))
              ],
            ),
            Expanded(child: 
            ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todoList[index].title),
                  trailing: IconButton(onPressed: () => notifier.removeTask(index), icon: const Icon(Icons.delete)),
                );
            }))
          ],
        ),
      ),
    );
  }
}




