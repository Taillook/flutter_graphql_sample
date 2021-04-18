import 'package:graphql/client.dart';
import 'package:gql/language.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_graphql_sample/api/github_api.dart';
import 'package:flutter_graphql_sample/entity/issue.dart';
import 'package:flutter_graphql_sample/graphql/query/read_issues.dart';

class IssuesRepository {
  static final issuesFetcher = FutureProvider<List<Issue>>((ref) async {
    final WatchQueryOptions _options = WatchQueryOptions(
      document: parseString(readIssues),
      pollInterval: Duration(seconds: 4),
      fetchResults: true,
    );
    final result = await GitHubApi.client.query(_options);
    List<dynamic> nodes = result.data!["repository"]['issues']['nodes'];
    List<Issue> list = Issue.fromJson(nodes);

    return list;
  });
}
