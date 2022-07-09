import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _text = useState(0);
    return Scaffold(
      appBar: AppBar(title: const Text("タイトル")),
      body: const Center(
          child: Markdown(
        selectable: true,
        data: ''
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
            '`code block`\n'
            '\n'
            '***\n'
            '[リンク](https://www.google.com/?hl=ja)\n',
      )),
    );
  }
}
