import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class Source {
  final String? title;
  final String? slug;
  final String? url;
  @JsonKey(name: 'crawl_rate')
  final int? crawlRate;

  const Source({this.title, this.slug, this.url, this.crawlRate});

  factory Source.fromJson(Map<String, dynamic> json) {
    return _$SourceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
