import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../blocs/general/general_bloc.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';
import 'list_delivery_page.dart';

class AddNewDeliveryPage extends StatefulWidget {
  const AddNewDeliveryPage({Key? key}) : super(key: key);

  @override
  _AddNewDeliveryPageState createState() => _AddNewDeliveryPageState();
}

class _AddNewDeliveryPageState extends State<AddNewDeliveryPage> {
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    clearTextEditingController();
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void clearTextEditingController() {
    _nameController.clear();
    _lastNameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    final lang = S.of(context);
    final generalBloc = BlocProvider.of<GeneralBloc>(context);

    final passwordValidator = MultiValidator([
      RequiredValidator(errorText: lang.auth_registry_error_password_required),
      MinLengthValidator(8,
          errorText: lang.auth_registry_error_password_minimum_10_characters)
    ]);
    final validatedEmail = MultiValidator([
      RequiredValidator(errorText: lang.auth_registry_error_email_required),
      EmailValidator(errorText: lang.auth_registry_error_email_invalid)
    ]);
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is LoadingUserState) {
          modalLoading(context);
        } else if (state is SuccessUserState) {
          Navigator.pop(context);
          cenaToastSuccess(lang.delivery_add_success);
          Navigator.pushReplacement(
              context, routeCena(page: const ListDeliveriesPage()));
          userBloc.add(OnClearPicturePathEvent());
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CenaAppbarDefault(
          title: lang.delivery_add_title,
          leading: const CenaButtonDefaultBack(),
          actions: [
            TextButton(
                onPressed: () {
                  if (_keyForm.currentState!.validate()) {
                    userBloc.add(OnRegisterDeliveryEvent(
                        _nameController.text,
                        _lastNameController.text,
                        _phoneController.text,
                        _emailController.text,
                        _passwordController.text,
                        userBloc.state.pictureProfilePath));
                  }
                },
                child: CenaTextDescription(
                  text: lang.delivery_add_button,
                  color: CenaColors.WHITE,
                  fontSize: 16,
                ))
          ],
        ),
        body: BlocBuilder<GeneralBloc, GeneralState>(
          builder: (context, state) => Form(
            key: _keyForm,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              children: [
                const SizedBox(height: 20.0),
                Align(alignment: Alignment.center, child: _PictureRegistre()),
                const SizedBox(height: 20.0),
                CenaTextDescription(text: lang.delivery_add_name_title),
                const SizedBox(height: 5.0),
                CenaFormField(
                  hintText: lang.delivery_add_name_hint,
                  controller: _nameController,
                  maxLength: 50,
                  validator: RequiredValidator(
                      errorText: lang.delivery_add_name_error),
                ),
                const SizedBox(height: 20.0),
                CenaTextDescription(text: lang.delivery_add_lastName_title),
                const SizedBox(height: 5.0),
                CenaFormField(
                  controller: _lastNameController,
                  hintText: lang.delivery_add_lastName_hint,
                  maxLength: 50,
                  validator: RequiredValidator(
                      errorText: lang.delivery_add_lastName_error),
                ),
                const SizedBox(height: 20.0),
                CenaTextDescription(text: lang.delivery_add_phone_title),
                const SizedBox(height: 5.0),
                CenaFormField(
                  controller: _phoneController,
                  hintText: lang.delivery_add_phone_hint,
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  validator: RequiredValidator(
                      errorText: lang.delivery_add_phone_error),
                ),
                const SizedBox(height: 15.0),
                CenaTextDescription(text: lang.delivery_add_email_title),
                const SizedBox(height: 5.0),
                CenaFormField(
                    controller: _emailController,
                    hintText: lang.delivery_add_email_hint,
                    maxLength: 50,
                    keyboardType: TextInputType.emailAddress,
                    validator: validatedEmail),
                const SizedBox(height: 15.0),
                CenaTextDescription(text: lang.delivery_add_password_title),
                const SizedBox(height: 5.0),
                CenaInputPasswordShow(
                  controller: _passwordController,
                  isPassword: state.isShowPassword,
                  hintText: lang.delivery_add_password_hint,
                  suffixIcon: IconButton(
                      splashRadius: 20,
                      icon: state.isShowPassword
                          ? const Icon(Icons.visibility_off_rounded)
                          : const Icon(Icons.remove_red_eye_outlined),
                      onPressed: () {
                        bool isShowPassword = !generalBloc.state.isShowPassword;
                        generalBloc
                            .add(OnShowOrHidePasswordEvent(isShowPassword));
                      }),
                  validator: passwordValidator,
                ),
                // CenaFormField(
                //   maxLength: 25,
                //   controller: _passwordController,
                //   hintText: lang.delivery_add_password_hint,
                //   isPassword: true,
                //   validator: passwordValidator,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PictureRegistre extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    final lang = S.of(context);
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          border:
              Border.all(style: BorderStyle.solid, color: Colors.grey[300]!),
          shape: BoxShape.circle),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => modalPictureRegister(
            ctx: context,
            onPressedChange: () async {
              Navigator.pop(context);
              final XFile? imagePath = await _picker.pickImage(
                  source: ImageSource.gallery, imageQuality: 50);
              if (imagePath != null) {
                userBloc.add(OnSelectPictureEvent(imagePath.path));
              }
            },
            onPressedTake: () async {
              Navigator.pop(context);
              final XFile? photoPath = await _picker.pickImage(
                  source: ImageSource.camera, imageQuality: 50);
              userBloc.add(OnSelectPictureEvent(photoPath!.path));
            }),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) => state.pictureProfilePath == ''
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wallpaper_rounded,
                        size: 60, color: CenaColors.primary),
                    const SizedBox(height: 10.0),
                    CenaTextDescription(
                        text: lang.auth_registry_picture, color: Colors.black45)
                  ],
                )
              : Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(File(state.pictureProfilePath)))),
                ),
        ),
      ),
    );
  }
}
