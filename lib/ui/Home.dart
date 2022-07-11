import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

String _text = ''
    '# 見出し1\n'
    '## 見出し2\n'
    '### 見出し3\n'
    ' - a\n'
    ' - b\n'
    '   - c\n'
    '\n'
    '*斜め* あ\n\n'
    '**太字**\n\n'
    '~~打ち消し~~\n\n'
    '`code block`\n\n'
    '***\n'
    '[リンク](https://www.google.com/?hl=ja)\n';

class Home extends HookConsumerWidget {
  Home({Key? key}) : super(key: key);

  // final _textMemoized = useMemoized(() => _text);
  // final _text = useState(_textMemoized);
  // final _text = useState('~~useState~~\n\n\n');

  final _edit = useState(true);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueController = TextEditingController(text: _text);
    return Scaffold(
      appBar: AppBar(title: const Text("タイトル")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.cached),
        onPressed: () {
          _switchEditor();
        },
      ),
      body: _edit.value
          ? Markdown(
              data: _text,
              onTapText: _switchEditor,
              onTapLink: (text, url, title) {
                if (url != null) launchUrl(Uri.parse(url));
              })
          : TextField(
              controller: valueController,
              enabled: true,
              maxLines: null,
              maxLength: null,
              style: const TextStyle(color: Colors.red),
              obscureText: false,
              onChanged: _handleText,
            ),
    );
  }

  void _handleText(String e) {
    // _text.value = e;
    _text = e;
  }

  void _switchEditor() {
    _edit.value = !_edit.value;
  }
}
