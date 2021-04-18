import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter_graphql_sample/repository/issues_repository.dart';
import 'issues_state.dart';

final issuesProvider = StateNotifierProvider<IssuesController, IssuesState>(
  (ref) => IssuesController(ref.read),
);

class IssuesController extends StateNotifier<IssuesState> {
  IssuesController(this._read) : super(IssuesState()) {
    () async {
      state = state.copyWith(
        issues: await _read(IssuesRepository.issuesFetcher.future),
        isLoading: false,
      );
    }();
  }

  final Reader _read;
}
