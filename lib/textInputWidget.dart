import 'package:flutter/material.dart';

class TextImputWidget extends StatefulWidget {
  final Function callback;

  TextImputWidget(this.callback);

  @override
  _TextImputWidgetState createState() => _TextImputWidgetState();
}

class _TextImputWidgetState extends State<TextImputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    FocusScope.of(context).unfocus();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.message),
          labelText: "Type a message",
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            splashColor: Colors.tealAccent,
            tooltip: "Post Message",
            onPressed: () => this.click(),
          )),
    );
  }
}
