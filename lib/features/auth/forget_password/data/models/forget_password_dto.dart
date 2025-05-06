import 'package:flower_tracking/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_dto.g.dart';

@JsonSerializable()
class ForgetPasswordDto extends ForgetPasswordEntity {
  ForgetPasswordDto({required super.message, required super.info});

  factory ForgetPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordDtoToJson(this);
}
