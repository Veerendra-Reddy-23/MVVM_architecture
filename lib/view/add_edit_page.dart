import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/to_do_model.dart';
import '../view_model/to_do_view_model.dart';

class AddEditTodoView extends StatefulWidget {
  final TodoModel? todo;

  const AddEditTodoView({Key? key, this.todo}) : super(key: key);

  @override
  State<AddEditTodoView> createState() => _AddEditTodoViewState();
}

class _AddEditTodoViewState extends State<AddEditTodoView> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _titleController.text = widget.todo!.title;
      _descriptionController.text = widget.todo!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    final todoViewModel = Provider.of<TodoViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo == null ? 'Add To-Do' : 'Edit To-Do'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                final description = _descriptionController.text;

                if (widget.todo == null) {
                  if (_titleController.text != null && _titleController.text != '') {
                    todoViewModel.addTodo(title, description);
                    Navigator.pop(context);
                  }
                } else {
                  todoViewModel.updateTodo(widget.todo!.id, title, description);
                }

              },
              child: Text(widget.todo == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}