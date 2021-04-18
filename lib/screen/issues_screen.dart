import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_graphql_sample/entity/issue.dart';
import 'package:flutter_graphql_sample/controller/issues_controller.dart';
import 'package:flutter_graphql_sample/component/issue_cell_item.dart';
import 'package:flutter_graphql_sample/screen/issue_detail_screen.dart';

class IssuesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GitHubAPI Sample',
        ),
        centerTitle: true,
      ),
      body: _ListView(),
    );
  }
}

class _ListView extends HookWidget {
  const _ListView();

  @override
  Widget build(BuildContext context) {
    final isLoading =
        useProvider(issuesProvider.select((s) => s.isLoading));
    final ids = useProvider(
      issuesProvider.select((s) => s.issues.map((s) => s.id)),
    ).toList();
    final issues =
        useProvider(issuesProvider.select((s) => s.issues));
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: ids.length,
            itemBuilder: (_, index) => IssueCellItem(issue: issues[index], onClick: (issue) => _openIssueWebPage(
                context,
                issue,
              )),
          );
  }

  _openIssueWebPage(
    BuildContext context,
    Issue issue,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => IssueDetailScreen(
          issue: issue,
        ),
      ),
    );
  }
}
