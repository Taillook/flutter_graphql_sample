import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_graphql_sample/entity/issue.dart';

class IssueDetailScreen extends StatelessWidget {
  IssueDetailScreen({required this.issue});

  final Issue issue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          issue.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ),
      body: WebView(
        initialUrl: issue.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
