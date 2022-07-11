import 'package:flutter/material.dart';

class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  final TextEditingController _textEditingController = TextEditingController();

  String _text = '';

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _handleText(String e) {
    setState(() {
      _text = e;
    });
  }

  void _printLatestValue() {
    print("入力状況: ${_textEditingController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Text(
              _text,
              style: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500),
            ),
            TextField(
              enabled: true,
              maxLength: 10,
              // maxLengthEnforced: false,
              obscureText: false,
              controller: _textEditingController,
              onChanged: _handleText,
              onSubmitted: _submission,
            )
          ],
        ));
  }

  void _submission(String e) {
    print(_textEditingController.text);
    _textEditingController.clear();
    setState(() {
      _text = '';
    });
  }
}
