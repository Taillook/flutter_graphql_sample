
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_graphql_sample/entity/issue.dart';

part 'issues_state.freezed.dart';

@freezed
abstract class IssuesState implements _$IssuesState {
  factory IssuesState({
    @Default(<Issue>[]) List<Issue> issues,
    @Default(true) bool isLoading,
  }) = _IssuesState;

  IssuesState._();

  late final Map<String, Issue> _map = Map.fromEntries(
    issues.map((s) => MapEntry(s.id, s)),
  );

  Issue stock(String id) => _map[id]!;
}
