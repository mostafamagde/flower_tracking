import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/datasources/contract/apply_contract_datasource.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/request/apply_request_dto.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/response/apply_response_dto.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/repositories/apply_repo_impl.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/request/apply_request_entity.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/response/apply_response_entity.dart';

import '../datasources/contract/apply_contract_datasource_test.mocks.dart';

@GenerateMocks([ApplyContractDatasource])
void main() {
  late ApplyRepoImpl repository;
  late MockApplyContractDatasource mockDatasource;

  // ✅ Required by Mockito to avoid MissingDummyValueError
  provideDummy<Result<ApplyResponseDto>>(
    Success(ApplyResponseDto(
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
      ),
    )),
  );

  setUp(() {
    mockDatasource = MockApplyContractDatasource();
    repository = ApplyRepoImpl(mockDatasource);
  });

  group('ApplyRepoImpl', () {
    final dtoRequest = ApplyRequestDto(
      country: "Egypt",
      firstName: "Abdelrhman",
      lastName: "khaled",
      vehicleType: "676b31a45d05310ca82657ac",
      vehicleNumber: "12322",
      vehicleLicense: "GetStarted.jpg",
      email: "Abdelrhman@gmail.com",
      phone: "01033018404",
      nID: "30601012505114",
      nIDImg: "GetStarted.jpg",
      password: "Abdo@123",
      rePassword: "Abdo@123",
      gender: "male",
    );

    final dtoResponse = ApplyResponseDto(
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

    final entityRequest = ApplyRequestEntity(
      country: 'Egypt',
      firstName: 'Abdelrhman',
      lastName: 'Khaled',
      vehicleType: '676b31a45d05310ca82657ac',
      vehicleNumber: '12322',
      vehicleLicense: 'GetStarted.jpg',
      email: 'Abdelrhman@gmail.com',
      phoneNumber: '01033018404',
      nID: '30601012505114',
      nIDImg: 'GetStarted.jpg',
      password: 'Abdo@123',
      rePassword: 'Abdo@123',
      gender: 'male',
    );

    final entityResponse = ApplyResponseEntity(
      message: 'success',
      token: 'sample-token',
      driver: ApplyResponseEntityDriver(
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
        email: 'Abdelrhman@gmail.com',
        nID: '30601012505114',
        nIDImg: 'GetStarted.jpg',
        gender: 'male',
      ),
    );

    test('returns Success when datasource succeeds', () async {
      // Arrange
      when(mockDatasource.applyDriver(any))
          .thenAnswer((_) async => Success(dtoResponse));

      // Act
      final result = await repository.applyDriver(entityRequest);

      // Assert
      expect(result, isA<Success<ApplyResponseEntity>>());

    });

    test('returns Error when datasource fails', () async {
      // Arrange
      final exception = Exception('Failure');
      when(mockDatasource.applyDriver(any))
          .thenAnswer((_) async => Error(exception));

      // Act
      final result = await repository.applyDriver(entityRequest);

      // Assert
      expect(result, isA<Error<ApplyResponseEntity>>());
      expect((result as Error).exception, equals(exception));
    });
  });
}
