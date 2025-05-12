import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/repositories/apply_driver_repo.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/request/apply_request_entity.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/response/apply_response_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApplyDriverUseCase {
  final ApplyRepository repository;

  ApplyDriverUseCase(this.repository);

  Future<Result<ApplyResponseEntity>> call(ApplyRequestEntity request) {
    return repository.applyDriver(request);
  }
}
