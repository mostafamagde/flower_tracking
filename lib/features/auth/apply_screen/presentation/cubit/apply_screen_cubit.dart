import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/request/apply_request_entity.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/usecases/apply_driver_use_case.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'dart:io';

part 'apply_screen_state.dart';

@injectable
class ApplyScreenCubit extends Cubit<ApplyScreenState> {
  final ApplyDriverUseCase applyDriverUseCase;
  ApplyScreenCubit(this.applyDriverUseCase) : super(ApplyScreenState());

  // Controllers
  final TextEditingController countryController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  final TextEditingController vehicleLicenseController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController idImgController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  // Form Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Selected values
  String? vehicleLicenseImagePath;
  String? nIDImagePath;
  String? selectedCountry;
  String? selectedVehicleType;
  String? selectedGenderType;

  // Update methods
  void updateVehicleLicenseImage(String imagePath) {
    vehicleLicenseImagePath = imagePath;
    vehicleLicenseController.text = imagePath;
    emit(state.copyWith());
  }

  void updateIDImage(String imagePath) {
    nIDImagePath = imagePath;
    idImgController.text = imagePath;
    emit(state.copyWith());
  }

  void updateCountry(String value) {
    selectedCountry = value;
    emit(state.copyWith());
  }

  void updateVehicleType(String value) {
    selectedVehicleType = value;
    emit(state.copyWith());
  }

  void updateGenderType(String value) {
    selectedGenderType = value;
    emit(state.copyWith());
  }

  // Main action
  void applyDriver() async {
    if (!formKey.currentState!.validate()) return;

    if (passwordController.text != confirmPasswordController.text) {
      emit(state.copyWith(
        status: Status.error,
        errorMessage: "Password and Confirm Password do not match",
      ));
      return;
    }

    if (vehicleLicenseImagePath == null || nIDImagePath == null) {
      emit(state.copyWith(
        status: Status.error,
        errorMessage: "Please select both license and ID images",
      ));
      return;
    }

    if (!File(vehicleLicenseImagePath!).existsSync() || !File(nIDImagePath!).existsSync()) {
      emit(state.copyWith(
        status: Status.error,
        errorMessage: "One or more selected images are invalid or not found",
      ));
      return;
    }

    String phone = phoneNumberController.text.trim();
    if (phone.startsWith('0')) {
      phone = '+20' + phone.substring(1);
    } else if (!phone.startsWith('+2')) {
      phone = '+20' + phone;
    }

    emit(state.copyWith(status: Status.loading));

    final applyDriver = ApplyRequestEntity(
      country: selectedCountry ?? countryController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      vehicleType: selectedVehicleType ?? vehicleTypeController.text,
      vehicleNumber: vehicleNumberController.text,
      vehicleLicense: vehicleLicenseImagePath!,
      nID: idNumberController.text,
      nIDImg: nIDImagePath!,
      email: emailController.text,
      phoneNumber: phone,
      password: passwordController.text,
      rePassword: confirmPasswordController.text,
      gender: selectedGenderType ?? genderController.text,
    );

    final result = await applyDriverUseCase.call(applyDriver);
    switch (result) {
      case Success success:
        emit(state.copyWith(
          status: Status.success,
          successMessage: "Applied successfully",
        ));
        break;
      case Error error:
        emit(state.copyWith(
          status: Status.error,
          errorMessage: error.exception.toString(),
        ));
        break;
    }
  }

  Future<void> pickImage(Function(String) onImagePicked) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null) {
        print('No image picked');
        return;
      }

      final extension = pickedFile.path.split(".").last.toLowerCase();
      if (extension != 'jpg' && extension != 'png') {
        print("Invalid image type. Only JPG and PNG are allowed.");
        return;
      }

      print('Image picked: ${pickedFile.path}');
      onImagePicked(pickedFile.path);
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}
