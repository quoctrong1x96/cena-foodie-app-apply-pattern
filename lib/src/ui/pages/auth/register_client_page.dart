import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../ui/blocs/auth/auth_bloc.dart';
import '../../blocs/general/general_bloc.dart';
import '../../blocs/store/store_bloc.dart';
import '../../../utils/configs/cena_colors.dart';
import '../../blocs/user/user_bloc.dart';
import '../../resources/generated/l10n.dart';
import '../../../utils/helpers/helpers.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../widgets/widgets.dart';
import '../admin/admin_home_page.dart';
import '../delivery/delivery_home_page.dart';
import 'enter_references_page.dart';
import 'login_verify_phone_page.dart';

class RegisterClientPage extends StatefulWidget {
  final String? phone;
  const RegisterClientPage({this.phone = "", Key? key}) : super(key: key);

  @override
  _RegisterClientPageState createState() => _RegisterClientPageState();
}

class _RegisterClientPageState extends State<RegisterClientPage> {
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordRepeatController;
  FocusNode? _focusFirstName;
  FocusNode? _focusLastName;
  FocusNode? _focusPhone;
  FocusNode? _focusEmail;
  FocusNode? _focusPassword;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordRepeatController = TextEditingController();
    _phoneController.text = widget.phone!;

    _focusFirstName = FocusNode();
    _focusLastName = FocusNode();
    _focusPhone = FocusNode();
    _focusEmail = FocusNode();
    _focusPassword = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    clearForm();
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordRepeatController.dispose();
    super.dispose();
  }

  void clearForm() {
    _nameController.clear();
    _lastNameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
    _passwordRepeatController.clear();
  }

  String generate() {
    Random random = Random(DateTime.now().millisecond);

    const String hexDigits = "0123456789ABCDE";
    final List<String> uuid = [];

    for (int i = 0; i < 10; i++) {
      final int hexPos = random.nextInt(16);
      uuid[i] = (hexDigits.substring(hexPos, hexPos + 1));
    }

    final StringBuffer buffer = StringBuffer();
    buffer.writeAll(uuid);
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    final generalBloc = BlocProvider.of<GeneralBloc>(context);
    final lang = S.of(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final storeBloc = BlocProvider.of<StoreBloc>(context);
    final validatedPhoneForm = MultiValidator([
      RequiredValidator(errorText: lang.auth_registry_error_phone_required),
      MinLengthValidator(10,
          errorText: lang.auth_registry_error_phone_must_10_digits)
    ]);

    final validatedEmail = MultiValidator([
      RequiredValidator(errorText: lang.auth_registry_error_email_required),
      EmailValidator(errorText: lang.auth_registry_error_email_invalid)
    ]);

    final passwordValidator = MultiValidator([
      RequiredValidator(errorText: lang.auth_registry_error_password_required),
      MinLengthValidator(8,
          errorText: lang.auth_registry_error_password_minimum_10_characters)
    ]);
    ScrollController scrollController = ScrollController();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is LoadingAuthState) {
          modalLoading(context);
        } else if (state is FailureAuthState) {
          cenaToastError(state.error);
        } else {
          if (state.rolId != '') {
            userBloc.add(OnGetUserEvent(state.user!));
            storeBloc.add(OnGetStoreEvent(state.store!));
            Navigator.pop(context);

            if (state.rolId == '1') {
              Navigator.pushAndRemoveUntil(context,
                  routeCena(page: const AdminHomePage()), (route) => false);
            } else if (state.rolId == '2') {
              Navigator.pushAndRemoveUntil(
                  context,
                  routeCena(page: const EnterReferencePage()),
                  (route) => false);
            } else if (state.rolId == '3') {
              // Navigator.pushAndRemoveUntil(context,
              //     routeCena(page: const DeliveryHomePage()), (route) => false);
            }
          }
        }
      },
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is LoadingUserState) {
            modalLoading(context);
          } else if (state is SuccessUserState) {
            Navigator.pop(context);
            if (widget.phone != "") {
              cenaToastSuccess(lang.auth_registry_success);
              authBloc.add(LoginPhoneEvent(widget.phone!));
            } else {
              Navigator.pushReplacement(
                  context,
                  routeCena(
                      page: LoginVerifyOtpPage(
                    isFromRegistry: true,
                    phoneNumber: _phoneController.value.text,
                  )));
            }
          } else if (state is FailureUserState) {
            Navigator.pop(context);
            switch (state.error) {
              case "Email already exists":
                cenaToastError(lang.auth_registry_exist_email);
                _focusEmail!.requestFocus();
                break;
              case "Phone already exists":
                cenaToastError(lang.auth_registry_exist_phone);
                _focusPhone!.requestFocus();
                break;
              case "FirstName has special character":
                cenaToastError(
                    lang.auth_registry_have_special_character_firstName);
                _focusFirstName!.requestFocus();
                scrollController.animateTo(50.0,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.ease);
                break;
              case "LastName has special character":
                cenaToastError(
                    lang.auth_registry_have_special_character_lastName);
                scrollController.animateTo(100.0,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.ease);
                _focusLastName!.requestFocus();
                break;
              case "No avatar images":
                cenaToastError(lang.auth_registry_must_select_avatar);
                scrollController.animateTo(0.0,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.ease);
                break;
              default:
                cenaToastError(lang.auth_registry_error_server);
            }
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CenaAppbarDefault(
            centerTitle: true,
            title: lang.register_header,
            leading: widget.phone == ""
                ? const CenaButtonDefaultBack()
                : const SizedBox(
                    width: 10.0,
                  ),
          ),
          body: BlocBuilder<GeneralBloc, GeneralState>(
            builder: (context, state) => Form(
              key: _keyForm,
              child: ListView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                children: [
                  const SizedBox(height: 20.0),
                  Align(alignment: Alignment.center, child: _PictureRegister()),
                  const SizedBox(height: 40.0),
                  CenaTextDescription(text: lang.register_first_name),
                  const SizedBox(height: 5.0),
                  CenaFormField(
                    controller: _nameController,
                    focusNode: _focusFirstName,
                    hintText: lang.register_enter_first_name,
                    maxLength: 49,
                    validator: RequiredValidator(
                        errorText: lang.register_required_first_name),
                  ),
                  const SizedBox(height: 15.0),
                  CenaTextDescription(text: lang.register_last_name),
                  const SizedBox(height: 5.0),
                  CenaFormField(
                    controller: _lastNameController,
                    hintText: lang.register_enter_last_name,
                    focusNode: _focusLastName,
                    maxLength: 49,
                    validator: RequiredValidator(
                        errorText: lang.register_required_last_name),
                  ),
                  const SizedBox(height: 15.0),
                  CenaTextDescription(text: lang.register_phone),
                  const SizedBox(height: 5.0),
                  CenaFormField(
                    controller: _phoneController,
                    focusNode: _focusPhone,
                    readOnly: widget.phone != "",
                    hintText: lang.register_enter_phone,
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    validator: validatedPhoneForm,
                  ),
                  const SizedBox(height: 15.0),
                  CenaTextDescription(text: lang.register_email),
                  const SizedBox(height: 5.0),
                  CenaFormField(
                      controller: _emailController,
                      hintText: lang.register_enter_email,
                      focusNode: _focusEmail,
                      keyboardType: TextInputType.emailAddress,
                      validator: validatedEmail),
                  const SizedBox(height: 15.0),
                  CenaTextDescription(text: lang.register_password),
                  const SizedBox(height: 5.0),
                  CenaInputPasswordShow(
                    controller: _passwordController,
                    isPassword: state.isShowPassword,
                    focusNode: _focusPassword,
                    hintText: lang.register_enter_password,
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
                  CenaTextDescription(text: lang.register_repeat_password),
                  const SizedBox(height: 5.0),
                  CenaInputPasswordShow(
                    controller: _passwordRepeatController,
                    isPassword: state.isRepeatpassword,
                    hintText: lang.register_enter_repeat_password,
                    suffixIcon: IconButton(
                        splashRadius: 20,
                        icon: !state.isRepeatpassword
                            ? const Icon(Icons.remove_red_eye_outlined)
                            : const Icon(Icons.visibility_off_rounded),
                        onPressed: () {
                          bool isShowPassword =
                              !generalBloc.state.isRepeatpassword;
                          generalBloc.add(
                              OnShowOrHideRepeatPasswordEvent(isShowPassword));
                        }),
                    validator: (val) {
                      if (val != _passwordRepeatController.text) {
                        return lang.register_password_notmath;
                      } else if (val!.isEmpty) {
                        return lang.register_required_repeat_password;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  CenaButton(
                    height: 45,
                    color: CenaColors.primary,
                    text: lang.register_button,
                    fontWeight: FontWeight.bold,
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        userBloc.add(OnRegisterClientEvent(
                            _nameController.text,
                            _lastNameController.text,
                            _phoneController.text,
                            _emailController.text,
                            _passwordController.text,
                            userBloc.state.pictureProfilePath));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PictureRegister extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
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
              final permissionGallery = await Permission.photos.request();

              switch (permissionGallery) {
                case PermissionStatus.granted:
                  Navigator.pop(context);
                  final XFile? imagePath = await _picker.pickImage(
                      source: ImageSource.gallery, imageQuality: 50);
                  if (imagePath != null) {
                    userBloc.add(OnSelectPictureEvent(imagePath.path));
                  }
                  break;
                case PermissionStatus.denied:
                case PermissionStatus.restricted:
                case PermissionStatus.limited:
                case PermissionStatus.permanentlyDenied:
                  openAppSettings();
                  break;
              }
            },
            onPressedTake: () async {
              final permissionPhotos = await Permission.camera.request();

              switch (permissionPhotos) {
                case PermissionStatus.granted:
                  Navigator.pop(context);
                  final XFile? photoPath = await _picker.pickImage(
                      source: ImageSource.camera, imageQuality: 50);
                  if (photoPath != null) {
                    userBloc.add(OnSelectPictureEvent(photoPath.path));
                  }
                  break;

                case PermissionStatus.denied:
                case PermissionStatus.restricted:
                case PermissionStatus.limited:
                case PermissionStatus.permanentlyDenied:
                  openAppSettings();
                  break;
              }
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
                        text: S.of(context).register_picture,
                        color: Colors.grey)
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
