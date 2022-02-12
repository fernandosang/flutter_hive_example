import 'package:companion/hive/helpers.dart';
import 'package:companion/hive/models/note_model.dart';
import 'package:companion/model/app_styles_light.dart';
import 'package:companion/model/size_configs.dart';
import 'package:companion/src/notes_widgets/note_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';


class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  @override
  void dispose(){
    super.dispose();
  }
  
  bool _isListView = true;
  
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: ValueListenableBuilder<Box<Note>>(
          valueListenable: Boxes.getNotes().listenable(),
          builder: (context, box, _) {
            final notes = box.values.toList().cast<Note>();
            return buildContent(notes);
          },
        ),
    );
  }

  Widget buildContent(List<Note> notes) {
    if (notes.isEmpty) {
      return Column(
        children: [
          NoteHeader(),
          Center(
            child: Text(
              'Empty',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SizedBox(height: 60),
          NoteHeader(),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(8),
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                final note = notes[index];
                return buildNote(context, note);
              },
            ),
          ),
        ],
      );
    }
  }

  Widget buildNote(
    BuildContext context,
    Note note,
  ) {
    final date = DateFormat.yMMMd().format(note.createdDate);

    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          note.title,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(date),
        trailing: Text(
          note.body,
          style: TextStyle(
              fontSize: 14),
        ),
        children: [
          buildButtons(context, note),
        ],
      ),
    );
  }

  Widget buildButtons(BuildContext context, Note note) => Row(
        children: [
          Expanded(
            child: TextButton.icon(
              label: Text('Edit'),
              icon: Icon(Icons.edit),
              onPressed: 
              () {}
                ),
              ),
          Expanded(
            child: TextButton.icon(
              label: Text('Delete'),
              icon: Icon(Icons.delete),
              onPressed: () => NoteHelper.deleteNote(note),
            ),
          )
        ],
      );

}
