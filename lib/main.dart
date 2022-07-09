import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ui/Home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final themeModeProvider =
    StateProvider((ref) => ThemeMode.light); // FIXME: なんでここ切り替えると一瞬クラッシュするの

/// Themeの定義だけ
class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      themeMode: ref.watch(themeModeProvider), // ユーザー設定でここの値を変更できるようにすればいいな
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xFF6750A4),
          // colorScheme: lightColorScheme,
          textTheme: GoogleFonts.yomogiTextTheme(
            Theme.of(context).textTheme,
          )),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xFF6750A4),
          brightness: Brightness.dark,
          // colorScheme: darkColorScheme,
          textTheme: GoogleFonts.yomogiTextTheme(
            ThemeData(brightness: Brightness.dark).textTheme,
          )), // https://itome.team/blog/2019/12/flutter-advent-calendar-day12/
      home: const Home(),
    );
  }
}
