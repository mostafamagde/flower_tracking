import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flower_tracking/features/auth/apply_screen/domain/repositories/apply_driver_repo.dart';
import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/request/apply_request_entity.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/response/apply_response_entity.dart';

import 'apply_driver_repo_test.mocks.dart'; // ملف الموكات الناتج من build_runner

@GenerateMocks([ApplyRepository])
void main() {
  late MockApplyRepository mockApplyRepository;

  setUp(() {
    mockApplyRepository = MockApplyRepository();
  });

  group('ApplyRepository', () {
    test('should return ApplyResponseEntity when applyDriver is called successfully', () async {
      // طلب وهمي
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

      // استجابة وهمية
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
      // تهيئة الموك
      when(mockApplyRepository.applyDriver(request))
          .thenAnswer((_) async => Success(response));

      // تنفيذ
      final result = await mockApplyRepository.applyDriver(request);

      // تحقق
      expect(result, isA<Success<ApplyResponseEntity>>());
      final success = result as Success<ApplyResponseEntity>;
      expect(success.data, response);
      verify(mockApplyRepository.applyDriver(request)).called(1);
    });

    test('should return error when applyDriver fails', () async {
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

      final failure = Error<ApplyResponseEntity>(Exception('Server error'));
      provideDummy<Result<ApplyResponseEntity>>(Error(
          failure.exception
      ));
      when(mockApplyRepository.applyDriver(request))
          .thenAnswer((_) async => failure);

      final result = await mockApplyRepository.applyDriver(request);

      expect(result, isA<Error<ApplyResponseEntity>>());
      final error = result as Error<ApplyResponseEntity>;
      expect(error.exception, isA<Exception>());
      expect(error.exception.toString(), 'Exception: Server error');
      verify(mockApplyRepository.applyDriver(request)).called(1);
    });
  });
}
