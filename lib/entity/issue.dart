import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'issue.freezed.dart';

@freezed
abstract class Issue with _$Issue {
  const factory Issue({
    @JsonKey(name: 'id') @Default("id") String id,
    @JsonKey(name: 'title') @Default("title") String title,
    @JsonKey(name: 'url') @Default("https://example.com") String url,
  }) = _Issue;

  static List<Issue> fromJson(List<dynamic> json) => json.map((e) => Issue(
    id: e['id'],
    title: e['title'],
    url: e['url']
  )).toList();
}
