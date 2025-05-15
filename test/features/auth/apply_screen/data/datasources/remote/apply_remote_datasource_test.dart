import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flower_tracking/core/api_manager/api_manager.dart';
import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/datasources/remote/apply_remote_datasource.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/request/apply_request_dto.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/response/apply_response_dto.dart';

import 'apply_remote_datasource_test.mocks.dart';

@GenerateMocks([RestClient])
void main() {
  late ApplyRemoteDatasourceImpl datasource;
  late MockRestClient mockClient;
  late ApplyRequestDto request;
  late ApplyResponseDto response;

  setUp(() {
    mockClient = MockRestClient();
    datasource = ApplyRemoteDatasourceImpl(mockClient);

    request = ApplyRequestDto(
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

    response = ApplyResponseDto(
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
  });

  group("ApplyRemoteDatasourceImpl", () {
    test('should return Success when request is valid', () async {
      // Arrange
      when(mockClient.applyDriver(
        any, // country
        any, // firstName
        any, // lastName
        any, // vehicleType
        any, // vehicleNumber
        any, // vehicleLicense (File)
        any, // email
        any, // phone
        any, // nID
        any, // nIDImg (File)
        any, // password
        any, // rePassword
        any, // gender
      )).thenAnswer((_) async => response);

      // Act
      final result = await datasource.applyDriver(request);

      // Assert
      expect(result, isA<Success<ApplyResponseDto>>());
      expect((result as Success).data, response);
    });

    test('should return Error when RestClient.applyDriver throws', () async {
      // Arrange
      when(mockClient.applyDriver(
        any, any, any, any, any, any, any, any, any, any, any, any, any,
      )).thenThrow(Exception('API Error'));

      // Act
      final result = await datasource.applyDriver(request);

      // Assert
      expect(result, isA<Error<ApplyResponseDto>>());
      expect((result as Error).exception.toString(), contains('API Error'));
    });
  });
}
