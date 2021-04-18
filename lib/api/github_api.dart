import 'package:graphql/client.dart';

class GitHubApi {
  static final HttpLink _httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  static final AuthLink _authLink = AuthLink(
    getToken: () async => "Bearer ${const String.fromEnvironment('API_KEY')}",
  );

  static final Link _link = _authLink.concat(_httpLink);

  static final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
}
