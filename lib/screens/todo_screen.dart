// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/state_notifier_provider_v2.dart';

final newTodoController = TextEditingController();

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 157, 206, 247),
        child: Column(
          children: [
            const BuildTodoList(),
            BuildAddTodoForm(),
          ],
        ),
      ),
    );
  }
}

class BuildTodoList extends ConsumerWidget {
  const BuildTodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    final completedTodos = todoList.where((todo) => todo.isCompleted).toList();
    final incompleteTodos =
        todoList.where((todo) => !todo.isCompleted).toList();
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            if (completedTodos.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 20,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Completed Todos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
            for (final todo in completedTodos)
              CheckboxListTile(
                title: Text(
                  todo.title,
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                value: todo.isCompleted,
                onChanged: (newValue) {
                  ref
                      .read(todoListProvider.notifier)
                      .toggleCompletionStatus(todo.id);
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            const SizedBox(height: 16),
            if (incompleteTodos.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 20,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Incomplete Todos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
            for (final todo in incompleteTodos)
              ListTile(
                leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (bool? value) {
                      ref
                          .read(todoListProvider.notifier)
                          .toggleCompletionStatus(todo.id);
                    }),
                title: Text(todo.title),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => EditTodoDialog(
                            todo: todo,
                            textEditingController:
                                TextEditingController(text: todo.title),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref.read(todoListProvider.notifier).removeTodo(todo.id);
                      },
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}

class BuildAddTodoForm extends ConsumerWidget {
  BuildAddTodoForm({Key? key}) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Add Todo',
              ),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(todoListProvider.notifier)
                  .addTodo(_textEditingController.text);
              _textEditingController.clear();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class EditTodoDialog extends ConsumerWidget {
  final Todo todo;
  final TextEditingController textEditingController;

  const EditTodoDialog(
      {Key? key, required this.todo, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Edit Todo'),
      content: TextField(
        controller: textEditingController,
        decoration: const InputDecoration(
          labelText: 'Title',
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final newTitle = textEditingController.text.trim();
            if (newTitle.isNotEmpty) {
              final updatedTodo = todo.copyWith(title: newTitle);
              ref.read(todoListProvider.notifier).updateTodo(updatedTodo);
              Navigator.pop(context);
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
