import 'dart:io';
import 'package:flower_tracking/core/api_manager/api_execute.dart';
import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/datasources/contract/apply_contract_datasource.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/request/apply_request_dto.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/response/apply_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:flower_tracking/core/api_manager/api_manager.dart';

@LazySingleton(as: ApplyContractDatasource)
class ApplyRemoteDatasourceImpl implements ApplyContractDatasource {
  final RestClient _client;

  ApplyRemoteDatasourceImpl(this._client);

  @override
  Future<Result<ApplyResponseDto>> applyDriver(ApplyRequestDto requestModel) {
    return ApiExecute.executeApi(() {
      return _client.applyDriver(
        requestModel.country!,
        requestModel.firstName!,
        requestModel.lastName!,
        requestModel.vehicleType!,
        requestModel.vehicleNumber!,
        File(requestModel.vehicleLicense!),
        requestModel.email!,
        requestModel.phone!,
        requestModel.nID!,
        File(requestModel.nIDImg!),
        requestModel.password!,
        requestModel.rePassword!,
        requestModel.gender!,
      );
    });
  }
}
