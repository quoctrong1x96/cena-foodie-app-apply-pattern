part of 'general_bloc.dart';

class GeneralState {
  final int selectedIndex;
  final bool isShowPassword;
  final bool isNewPassword;
  final bool isRepeatPassword;

  GeneralState(
      {this.selectedIndex = 0,
      this.isShowPassword = true,
      this.isNewPassword = true,
      this.isRepeatPassword = true});

  GeneralState copyWith(
          {int? selectedIndex,
          bool? isShowPassword,
          bool? isNewPassword,
          bool? isRepeatPassword}) =>
      GeneralState(
          selectedIndex: selectedIndex ?? this.selectedIndex,
          isShowPassword: isShowPassword ?? this.isShowPassword,
          isNewPassword: isNewPassword ?? this.isNewPassword,
          isRepeatPassword: isRepeatPassword ?? this.isRepeatPassword);
}

class GeneralInitial extends GeneralState {}
