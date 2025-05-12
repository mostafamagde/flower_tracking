import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/request/apply_request_entity.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/response/apply_response_entity.dart';

abstract class ApplyRepository {
  Future<Result<ApplyResponseEntity>> applyDriver(
      ApplyRequestEntity request,
      );
}
