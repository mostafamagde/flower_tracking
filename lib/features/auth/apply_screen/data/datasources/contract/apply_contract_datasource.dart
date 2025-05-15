import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/request/apply_request_dto.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/response/apply_response_dto.dart';

abstract class ApplyContractDatasource {
  Future<Result<ApplyResponseDto>> applyDriver(ApplyRequestDto requestModel);
}
