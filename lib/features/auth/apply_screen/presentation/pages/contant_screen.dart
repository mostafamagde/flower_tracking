import 'package:flower_tracking/core/app_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flower_tracking/features/auth/apply_screen/presentation/cubit/apply_screen_cubit.dart';
import 'package:flower_tracking/features/auth/apply_screen/presentation/widget/country_list.dart';
import 'package:flower_tracking/features/auth/apply_screen/presentation/widget/custom_button.dart';
import 'package:flower_tracking/features/auth/apply_screen/presentation/widget/reusable_drop_down_textfiled.dart';
import 'package:flower_tracking/features/auth/apply_screen/presentation/widget/reusable_textfiled.dart';
import 'package:flower_tracking/features/auth/apply_screen/presentation/widget/reusable_upload_image_textfiled.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flower_tracking/core/app_consts/app_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Gender { female, male }

class ContantScreen extends StatefulWidget {
  const ContantScreen({super.key});

  @override
  State<ContantScreen> createState() => _ContantScreenState();
}

class _ContantScreenState extends State<ContantScreen> {
  String? vehicleLicenseImagePath;
  String? nIDImagePath;
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyScreenCubit, ApplyScreenState>(
      builder: (context, state) {
        final cubit = context.read<ApplyScreenCubit>();
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome!!!\n",
                        style: Theme.of(context).textTheme.titleLarge,
                        children: [
                          TextSpan(
                            text: "You want to be a delivery man?\nJoin our team",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: cubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...[
                            DropDownTextFiled(
                              dropDownList: countries,
                              hintText: "Country",
                              labelText: "Country",
                              onChanged: (value) {
                                cubit.updateCountry(value);
                              },
                            ),
                            CustomTextField(
                              controller: cubit.firstNameController,
                              hintText: "Enter first legal name",
                              labelText: "First legal name",
                            ),
                            CustomTextField(
                              controller: cubit.lastNameController,
                              hintText: "Enter second legal name",
                              labelText: "Second legal name",
                            ),
                            DropDownTextFiled(
                              dropDownList: const [
                                DropDownValueModel(name: 'Vehicle', value: '676b31a45d05310ca82657ac'),
                                DropDownValueModel(name: 'Car', value: '676b31a45d05310ca82657ac'),
                              ],
                              hintText: "Vehicle type",
                              labelText: "Vehicle type",
                              onChanged: (value) {
                                cubit.updateVehicleType(value);
                              },
                            ),
                            CustomTextField(
                              controller: cubit.vehicleNumberController,
                              hintText: "Enter vehicle number",
                              labelText: "Vehicle number",
                            ),
                            ImageUploadTextField(
                              labelText: "Vehicle License",
                              hintText: "Upload vehicle license image",
                              controller: cubit.vehicleLicenseController,
                              onPickImage: () => cubit.pickImage((path) {
                                cubit.vehicleLicenseController.text = path;
                                cubit.updateVehicleLicenseImage(path);
                              }),
                            ),
                            CustomTextField(
                              controller: cubit.emailController,
                              hintText: "Enter email",
                              labelText: "Email",
                              validator: AppValidators.validateEmail,
                            ),
                            CustomTextField(
                              controller: cubit.phoneNumberController,
                              hintText: "Enter phone number",
                              labelText: "Phone number",
                            ),
                            CustomTextField(
                              controller: cubit.idNumberController,
                              hintText: "Enter national id number",
                              keyboardType: TextInputType.number,
                              labelText: "ID number",
                            ),
                            ImageUploadTextField(
                              labelText: "ID Image",
                              hintText: "Upload your ID image",
                              controller: cubit.idImgController,
                              onPickImage: () => cubit.pickImage((path) {
                                cubit.idImgController.text = path;
                                cubit.updateIDImage(path);
                              }),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: cubit.passwordController,
                                    hintText: "Enter password",
                                    labelText: "Password",
                                    validator: AppValidators.validatePassword,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: CustomTextField(
                                    controller: cubit.confirmPasswordController,
                                    hintText: "Confirm password",
                                    labelText: "Confirm password",
                                    validator: (value) {
                                      if (value != cubit.passwordController.text) {
                                        return 'Passwords do not match';
                                      }
                                      return AppValidators.validatePassword(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Gender',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Radio<Gender>(
                                  value: Gender.female,
                                  groupValue: _selectedGender,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      _selectedGender = value;
                                      cubit.updateGenderType(value == Gender.male ? 'male' : 'female');
                                    });
                                  },
                                  activeColor: _selectedGender == Gender.female ? AppColors.primaryColor : Colors.grey,
                                ),
                                Text(
                                  'Female',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.primaryTextColor,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Radio<Gender>(
                                  value: Gender.male,
                                  groupValue: _selectedGender,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      _selectedGender = value;
                                      cubit.updateGenderType(value == Gender.male ? 'male' : 'female');
                                    });
                                  },
                                  activeColor: _selectedGender == Gender.male ? AppColors.primaryColor : Colors.grey,
                                ),
                                Text(
                                  'Male',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.primaryTextColor,
                                  ),
                                ),
                              ],
                            ),

                            state.status == Status.loading
                                ? Center(child:  CircularProgressIndicator(color:AppColors.primaryColor,)) // Show loading indicator
                                : CustomButton(
                              onPressed: () {
                                if (state.status != Status.loading) {
                                  context.read<ApplyScreenCubit>().applyDriver();
                                }
                              },
                              buttonText: 'Confirm',
                            ),

                            // Show success or error message if needed
                            if (state.status == Status.success)
                              Text(state.successMessage ?? '', style: TextStyle(color: Colors.green)),
                            if (state.status == Status.error)
                              Text(state.errorMessage ?? '', style: TextStyle(color: Colors.red)),
                          ].expand((widget) => [widget, const SizedBox(height: 20)]).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
