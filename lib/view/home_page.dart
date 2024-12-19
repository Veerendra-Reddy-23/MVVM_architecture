import 'package:flutter/material.dart';
import 'package:projects/view/widgets/to_do_list_widget.dart';
import 'package:provider/provider.dart';

import '../view_model/to_do_view_model.dart';
import 'add_edit_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoViewModel = Provider.of<TodoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: ListView.builder(
        itemCount: todoViewModel.todos.length,
        itemBuilder: (context, index) {
          final todo = todoViewModel.todos[index];
          return TodoListItem(todo: todo);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditTodoView(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}