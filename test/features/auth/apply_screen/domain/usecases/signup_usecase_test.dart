import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_usecase_test.mocks.dart';

import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/request/apply_request_entity.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/response/apply_response_entity.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/repositories/apply_driver_repo.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/usecases/apply_driver_use_case.dart';

@GenerateMocks([ApplyRepository])
void main() {
  late ApplyDriverUseCase useCase;
  late MockApplyRepository mockRepo;

  setUp(() {
    mockRepo = MockApplyRepository();
    useCase = ApplyDriverUseCase(mockRepo);
  });

  test('should return ApplyResponseEntity when repository call is successful', () async {
    // Arrange
    final request = ApplyRequestEntity(
      country: 'Egypt',
      firstName: 'Abdelrhman',
      lastName: 'Khaled',
      vehicleType: '676b31a45d05310ca82657ac',
      vehicleNumber: '12322',
      vehicleLicense: 'GetStarted.jpg',
      email: 'abdelrhmanv61@gmail.com',
      phoneNumber: '01033018404',
      nID: '30601012500212',
      nIDImg: 'GetStarted.jpg',
      password: 'Abdo@123',
      rePassword: 'Abdo@123',
      gender: 'male',
    );

    final response = ApplyResponseEntity(
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
        email: 'abdelrhmanv61@gmail.com',
        nID: '30601012500212',
        nIDImg: 'GetStarted.jpg',
        gender: 'male',
      ),
    );
    provideDummy<Result<ApplyResponseEntity>>(Success(
      ApplyResponseEntity(
        message: '',
        token: '',
        driver: ApplyResponseEntityDriver(
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

    when(mockRepo.applyDriver(request)).thenAnswer((_) async => Success(response));

    // Act
    final result = await useCase.call(request);

    // Assert
    expect(result, isA<Success<ApplyResponseEntity>>());
    final success = result as Success<ApplyResponseEntity>;
    expect(success.data, response);

    verify(mockRepo.applyDriver(request)).called(1);
    verifyNoMoreInteractions(mockRepo);
  });
  test('should return Failure when repository call fails', () async {
    // Arrange
    final request = ApplyRequestEntity(
      country: 'Egypt',
      firstName: 'Abdelrhman',
      lastName: 'Khaled',
      vehicleType: '676b31a45d05310ca82657ac',
      vehicleNumber: '12322',
      vehicleLicense: 'GetStarted.jpg',
      email: 'abdelrhmanv61@gmail.com',
      phoneNumber: '01033018404',
      nID: '30601012505111',
      nIDImg: 'GetStarted.jpg',
      password: 'Abdo@123',
      rePassword: 'Abdo@123',
      gender: 'male',
    );

    final failure = Error<ApplyResponseEntity>(Exception('Server error'));
    provideDummy<Result<ApplyResponseEntity>>(Error(
  failure.exception
    ));


    when(mockRepo.applyDriver(request)).thenAnswer((_) async => failure);

    // Act
    final result = await useCase.call(request);

    // Assert
    expect(result, isA<Error>());
    final error = result as Error;
    expect(error.exception, isA<Exception>());

    verify(mockRepo.applyDriver(request)).called(1);
    verifyNoMoreInteractions(mockRepo);
  });

}
