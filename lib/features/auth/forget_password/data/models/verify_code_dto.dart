import 'package:flower_tracking/features/auth/forget_password/domain/entities/verify_code_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_code_dto.g.dart';

@JsonSerializable()
class VerifyCodeDto extends VerifyCodeEntity{


  VerifyCodeDto({required super.status});

  factory VerifyCodeDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeDtoToJson(this);
}
