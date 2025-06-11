import 'package:flower_tracking/features/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_dto.g.dart';

@JsonSerializable()
class ResetPasswordDto extends ResetPasswordEntity{
   ResetPasswordDto({required super.email, required super.newPassword});
  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) => _$ResetPasswordDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordDtoToJson(this);
}

