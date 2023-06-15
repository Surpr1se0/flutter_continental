
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{
  final String name;
  final String address;
  final int age;
  User(this.name, this.address, this.age);

  factory User.fromJson(Map<String, dynamic>json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}