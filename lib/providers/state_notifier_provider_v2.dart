import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  final int id;
  final String title;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  Todo copyWith({int? id, String? title, bool? isCompleted}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class TodoList extends StateNotifier<List<Todo>> {
  TodoList() : super([]);

  void addTodo(String title) {
    final newTodo = Todo(
      id: state.length + 1,
      title: title,
    );
    state = [...state, newTodo];
  }

  void updateTodo(Todo updatedTodo) {
    state = state.map((todo) {
      if (todo.id == updatedTodo.id) {
        return updatedTodo;
      } else {
        return todo;
      }
    }).toList();
  }

  void removeTodo(int id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void toggleCompletionStatus(int id) {
    state = state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(isCompleted: !todo.isCompleted);
      } else {
        return todo;
      }
    }).toList();
  }
}

final todoListProvider =
    StateNotifierProvider<TodoList, List<Todo>>((ref) => TodoList());
