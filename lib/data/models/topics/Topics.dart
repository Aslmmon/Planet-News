import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Topics.g.dart';

@JsonSerializable()
class Topics  extends Equatable{
  String? name = 'sports';
  String? id='1';

  Topics({this.name, this.id});


  factory Topics.fromJson(Map<String, dynamic> json) =>
      _$TopicsFromJson(json);

  Map<String, dynamic> toJson() => _$TopicsToJson(this);

  @override
  List<Object?> get props => [name,id];

}