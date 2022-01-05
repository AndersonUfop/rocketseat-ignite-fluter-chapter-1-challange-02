import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/app_bar_widget.dart';
import 'package:notes/pages/create_note/widgets/button_save_widget.dart';
import 'package:notes/pages/create_note/widgets/input_note_widget.dart';

class CreateNotePage extends StatefulWidget {
  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  var description = "";
  var textController = TextEditingController();
  var isEdit = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = description;
        isEdit = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          title: isEdit ? "Edit Page" : "Create Page",
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context, "");
                },
                icon: Icon(Icons.delete)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputNoteWidget(
                textController: textController,
                onChanged: (value) {
                  description = value;
                  setState(() {});
                },
              ),
              SizedBox(
                height: 32,
              ),
              if (description.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 250,
                        child: ButtonSaveWidget(
                          onPressed: () {
                            Navigator.pop(context, description);
                          },
                        ))
                  ],
                )
            ],
          ),
        ));
  }
}
