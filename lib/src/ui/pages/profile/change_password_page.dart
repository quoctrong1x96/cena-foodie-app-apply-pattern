import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart' as validator1;
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/general/general_bloc.dart';
import '../../../utils/configs/cena_colors.dart';
import '../../blocs/user/user_bloc.dart';
import '../../resources/generated/l10n.dart';
import '../../../utils/helpers/helpers.dart';
import '../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../widgets/widgets.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _repeatPasswordController;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    clearTextEditingController();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  void clearTextEditingController() {
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _repeatPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final generalBloc = BlocProvider.of<GeneralBloc>(context);
    final userBloc = BlocProvider.of<UserBloc>(context);
    final lang = S.of(context);
    final passwordValidator = validator1.MultiValidator([
      validator1.RequiredValidator(
          errorText: lang.auth_registry_error_password_required),
      validator1.MinLengthValidator(8,
          errorText: lang.auth_registry_error_password_minimum_10_characters)
    ]);

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is LoadingUserState) {
          modalLoading(context);
        } else if (state is SuccessUserState) {
          Navigator.pop(context);
          cenaToastSuccess(lang.password_success);
          Navigator.pop(context);
          clearTextEditingController();
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CenaAppbarDefault(
          title: lang.password_title,
          leading: const CenaButtonDefaultBack(),
        ),
        body: SafeArea(
          child: Form(
            key: _keyForm,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: BlocBuilder<GeneralBloc, GeneralState>(
                builder: (context, state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    CenaTextDescription(text: lang.password_current),
                    const SizedBox(height: 5.0),
                    _CenaFormFieldPassword(
                      controller: _currentPasswordController,
                      isPassword: state.isShowPassword,
                      suffixIcon: IconButton(
                          splashRadius: 20,
                          icon: !state.isShowPassword
                              ? const Icon(Icons.remove_red_eye_outlined)
                              : const Icon(Icons.visibility_off_rounded),
                          onPressed: () {
                            bool isShowPassword =
                                !generalBloc.state.isShowPassword;
                            generalBloc
                                .add(OnShowOrHidePasswordEvent(isShowPassword));
                          }),
                      validator: passwordValidator,
                    ),
                    const SizedBox(height: 20.0),
                    CenaTextDescription(text: lang.password_new),
                    const SizedBox(height: 5.0),
                    _CenaFormFieldPassword(
                      controller: _newPasswordController,
                      isPassword: state.isNewPassword,
                      suffixIcon: IconButton(
                          splashRadius: 20,
                          icon: !state.isNewPassword
                              ? const Icon(Icons.remove_red_eye_outlined)
                              : const Icon(Icons.visibility_off_rounded),
                          onPressed: () {
                            bool isShowPassword =
                                !generalBloc.state.isNewPassword;
                            generalBloc.add(
                                OnShowOrHideNewPasswordEvent(isShowPassword));
                          }),
                      validator: passwordValidator,
                    ),
                    const SizedBox(height: 20.0),
                    CenaTextDescription(text: lang.password_repeat),
                    const SizedBox(height: 5.0),
                    _CenaFormFieldPassword(
                      controller: _repeatPasswordController,
                      isPassword: state.isRepeatpassword,
                      suffixIcon: IconButton(
                          splashRadius: 20,
                          icon: !state.isRepeatpassword
                              ? const Icon(Icons.remove_red_eye_outlined)
                              : const Icon(Icons.visibility_off_rounded),
                          onPressed: () {
                            bool isShowPassword =
                                !generalBloc.state.isRepeatpassword;
                            generalBloc.add(OnShowOrHideRepeatPasswordEvent(
                                isShowPassword));
                          }),
                      validator: (val) {
                        if (val != _newPasswordController.text) {
                          return lang.password_error_wrong;
                        } else if (val!.isEmpty) {
                          return lang.password_error_required;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    CenaButton(
                      height: 45,
                      color: CenaColors.primary,
                      text: lang.password_button_save,
                      fontWeight: FontWeight.bold,
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          userBloc.add(OnChangePasswordEvent(
                              userBloc.state.user!.id,
                              _currentPasswordController.text,
                              _newPasswordController.text));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CenaFormFieldPassword extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final int maxLine;
  final bool readOnly;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  const _CenaFormFieldPassword(
      {this.controller,
      this.hintText,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.maxLine = 1,
      this.readOnly = false,
      this.suffixIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.getFont('Roboto', fontSize: 18),
      obscureText: isPassword,
      maxLines: maxLine,
      readOnly: readOnly,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: .5, color: Colors.grey)),
          contentPadding: const EdgeInsets.only(left: 15.0),
          hintText: hintText,
          hintStyle: GoogleFonts.getFont('Roboto', color: Colors.grey),
          suffixIcon: suffixIcon),
      validator: validator,
    );
  }
}
