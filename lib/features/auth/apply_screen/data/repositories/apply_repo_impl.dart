import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/datasources/contract/apply_contract_datasource.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/mapper/signup_mappers.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/request/apply_request_dto.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/response/apply_response_dto.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/request/apply_request_entity.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/response/apply_response_entity.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/repositories/apply_driver_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ApplyRepository)
class ApplyRepoImpl implements ApplyRepository {
  final ApplyContractDatasource _signupContractDatasource;


  ApplyRepoImpl(this._signupContractDatasource);

  @override
  Future<Result<ApplyResponseEntity>> applyDriver(
      ApplyRequestEntity request,
      ) async {

    ApplyRequestDto requestModel = SignupMappers.toModelRequest(request);

    Result<ApplyResponseDto> responseModelResult =
    await _signupContractDatasource.applyDriver(requestModel);


    switch (responseModelResult) {
      case Success<ApplyResponseDto> success:
        ApplyResponseEntity responseEntity = SignupMappers.toEntity(
          success.data!,
        );
        return Success(responseEntity);
      case Error<ApplyResponseDto> error:
        return Error(error.exception);
    }
  }
}
