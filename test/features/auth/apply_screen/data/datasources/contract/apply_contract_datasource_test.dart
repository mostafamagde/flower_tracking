import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/datasources/contract/apply_contract_datasource.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/request/apply_request_dto.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/response/apply_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'apply_contract_datasource_test.mocks.dart';

@GenerateMocks([ApplyContractDatasource])
void main() {
  late MockApplyContractDatasource mockApplyContractDatasource;

  setUp(() {
    mockApplyContractDatasource = MockApplyContractDatasource();
  });

  group('ApplyContractDatasource - applyDriver()', () {
    test('should return Success when datasource call is successful', () async {
      // Arrange
      final request = ApplyRequestDto(
        country: "Egypt" ,
        firstName: "Abdelrhman" ,
        lastName: "khaled" ,
        vehicleType: "676b31a45d05310ca82657ac",
        vehicleNumber: "12322" ,
        vehicleLicense: "GetStarted.jpg" ,
        email: "Abdelrhman@gmail.com" ,
        phone: "01033018404" ,
        nID: "30601012505114" ,
        nIDImg: "GetStarted.jpg" ,
        password: "Abdo@123" ,
        rePassword: "Abdo@123" ,
        gender: "male" ,
      );

      final response = ApplyResponseDto(
        message: 'success',
        token: 'sample-token',
        driver: ApplyResponseDtoDriver(
          createdAt: '',
          id: '6818cf781433a666c8d9bb6d',
          phone: '01033018404',
          photo: "GetStarted.jpg",
          country: 'Egypt',
          firstName: 'Abdelrhman',
          lastName: 'Khaled',
          vehicleType: '676b31a45d05310ca82657ac',
          vehicleNumber: '12322',
          vehicleLicense: 'GetStarted.jpg',
          email: "Abdelrhman@gmail.com",
        ),
      );

      provideDummy<Result<ApplyResponseDto>>(Success(
        ApplyResponseDto(
          message: '',
          token: '',
          driver: ApplyResponseDtoDriver(
            createdAt: '',
            id: '',
            phone: '',
            photo: '',
            country: '',
            firstName: '',
            lastName: '',
            vehicleType: '',
            vehicleNumber: '',
            vehicleLicense: '',
            email: '',
            nID: '',
            nIDImg: '',
            gender: '',
          ),
        ),
      ));

      when(mockApplyContractDatasource.applyDriver(request))
          .thenAnswer((_) async => Success(response));

      // Act
      final result = await mockApplyContractDatasource.applyDriver(request);

      // Assert
      expect(result, isA<Success<ApplyResponseDto>>());
      final success = result as Success<ApplyResponseDto>;
      expect(success.data, response);
      verify(mockApplyContractDatasource.applyDriver(request)).called(1);
    });

    test('should return Error when datasource call fails', () async {
      // Arrange
      final request = ApplyRequestDto(
        country: "Egypt" ,
        firstName: "Abdelrhman" ,
        lastName: "khaled" ,
        vehicleType: "676b31a45d05310ca82657ac",
        vehicleNumber: "12322" ,
        vehicleLicense: "GetStarted.jpg" ,
        email: "Abdelrhman@gmail.com" ,
        phone: "01033018404" ,
        nID: "30601012505114" ,
        nIDImg: "GetStarted.jpg" ,
        password: "Abdo@123" ,
        rePassword: "Abdo@123" ,
        gender: "male" ,
      );

      final failure = Error<ApplyResponseDto>(Exception('Server error'));

      provideDummy<Result<ApplyResponseDto>>(failure);

      when(mockApplyContractDatasource.applyDriver(request))
          .thenAnswer((_) async => failure);

      // Act
      final result = await mockApplyContractDatasource.applyDriver(request);

      // Assert
      expect(result, isA<Error<ApplyResponseDto>>());
      final error = result as Error<ApplyResponseDto>;
      expect(error.exception, isA<Exception>());
      expect(error.exception.toString(), 'Exception: Server error');
      verify(mockApplyContractDatasource.applyDriver(request)).called(1);
    });
  });
}
