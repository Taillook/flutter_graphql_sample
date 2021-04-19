
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_graphql_sample/screen/issues_screen.dart';
import 'package:flutter_graphql_sample/providers/navigator.dart';

// import 'pages/items_page/items_page.dart';

class App extends HookWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample',
      navigatorKey: useProvider(navigatorKeyProvider),
      home: IssuesScreen(),
    );
  }
}
