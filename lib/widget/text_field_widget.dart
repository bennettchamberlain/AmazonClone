import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController textController;
  final String title;
  final bool obscureText;
  final String hintText;

  const TextFieldWidget(
      {super.key,
      required this.textController,
      required this.title,
      required this.obscureText,
      required this.hintText});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode focusNode;
  bool isInFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isInFocus = true;
        });
      } else {
        setState(() {
          isInFocus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              isInFocus
                  ? BoxShadow(
                      color: Colors.orange.withOpacity(0.6),
                      blurRadius: 10,
                      spreadRadius: 3)
                  : BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 10,
                      spreadRadius: 3)
            ],
          ),
          child: TextField(
            focusNode: focusNode,
            obscureText: widget.obscureText,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(4)),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
