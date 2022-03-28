import 'package:json_annotation/json_annotation.dart';

part 'parent.g.dart';

@JsonSerializable()
class Parent {
  final String? title;
  @JsonKey(name: 'location_type')
  final String? locationType;
  final int? woeid;
  @JsonKey(name: 'latt_long')
  final String? lattLong;

  const Parent({this.title, this.locationType, this.woeid, this.lattLong});

  factory Parent.fromJson(Map<String, dynamic> json) {
    return _$ParentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ParentToJson(this);
}
