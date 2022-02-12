import 'package:companion/hive/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddNote extends StatefulWidget {
  final Note? note;
  final Function(String title, String body, DateTime createdDate) onClickedDone;

  const AddNote({
    Key? key,
    this.note,
    required this.onClickedDone,
    }) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  final formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.note != null) {
    final note = widget.note!;

      _titleController.text = note.title;
      _bodyController.text = note.title;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final isEditing = widget.note != null;
    final title = isEditing ? 'Edit Transaction' : 'Add Transaction';

    return Scaffold(
      body: Column(
          children: [
            SizedBox(height: 20),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            SizedBox(height: 40),
            Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8),
              buildTitle(),
              SizedBox(height: 8),
              buildBody(),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
        buildAddButton(context, isEditing: isEditing),
        buildCancelButton(context)
      ],
    )
    );
  }   

  Widget buildTitle() => TextFormField(
        controller: _titleController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Title',
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'Enter a title' : null,
      );

  Widget buildBody() => TextFormField(
        controller: _bodyController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Note',
        ),
        validator: (body) => 
            body != null && body.isEmpty ? 'Enter a note' : null
      );

  Widget buildCancelButton(BuildContext context) => TextButton(
        child: Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(),
      );

  Widget buildAddButton(BuildContext context, {required bool isEditing}) {
    final text = isEditing ? 'Save' : 'Add';

    return TextButton(
      child: Text(text),
      onPressed: () async {
        final isValid = formKey.currentState!.validate();

        if (isValid) {
          final title = _titleController.text;
          final body = _bodyController.text;

          widget.onClickedDone(title, body, DateTime.now());

          Navigator.of(context).pop();
        }
      },
    );
  }
}