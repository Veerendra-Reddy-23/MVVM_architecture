import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/to_do_model.dart';
import '../../view_model/to_do_view_model.dart';
import '../add_edit_page.dart';

class TodoListItem extends StatelessWidget {
  final TodoModel todo;

  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoViewModel = Provider.of<TodoViewModel>(context, listen: false);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(todo.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditTodoView(todo: todo),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                todoViewModel.deleteTodo(todo.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
