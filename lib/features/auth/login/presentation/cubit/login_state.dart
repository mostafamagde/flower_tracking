import 'package:flower_tracking/features/auth/login/domain/entity/login_response_entity.dart';

abstract class LoginCubitState{}

class LoginInitialState extends LoginCubitState{}
class LoginSuccessState extends LoginCubitState{
  LoginResponseEntity response;
  LoginSuccessState({required this.response});
}
class LoginLoadingState extends LoginCubitState{}
class LoginErrorState extends LoginCubitState{
  final String message;
  LoginErrorState({required this.message});
}

