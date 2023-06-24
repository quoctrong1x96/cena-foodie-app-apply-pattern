import 'dart:io';
import 'dart:math';

import 'package:cenafoodie/src/ui/pages/auth/register/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../data/models/ui/page_arguments.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/route_constants.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../../utils/navigation_utils.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/store/store_bloc.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';

enum RegistType { byPhone, byEmail, byGoogle, byFacebook }

class RegisterClientPage extends StatefulWidget {
  final String? phone;
  const RegisterClientPage({this.phone = "", Key? key}) : super(key: key);

  @override
  _RegisterClientPageState createState() => _RegisterClientPageState();
}

class _RegisterClientPageState extends State<RegisterClientPage> {
  var _registType = RegistType.byEmail;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initFormDefault() {}

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
    final lang = S.of(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final storeBloc = BlocProvider.of<StoreBloc>(context);

    ScrollController scrollController = ScrollController();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is LoadingAuthState) {
          modalLoading(context);
        } else if (state is FailureAuthState) {
          cenaToastError(state.error);
        } else {
          _registerLogicSuccess(state, userBloc, storeBloc, context);
        }
      },
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is LoadingUserState) {
            modalLoading(context);
          } else if (state is SuccessUserState) {
            _registerSuccessLogic(context, lang, authBloc);
          } else if (state is FailureUserState) {
            _registerFailureLogic(context, state, lang, scrollController);
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColorLight,
          appBar: CenaAppbarDefault(
            centerTitle: true,
            title: lang.register_header,
            leading: widget.phone == ""
                ? const CenaButtonDefaultBack()
                : const SizedBox(
                    width: 10.0,
                  ),
          ),
          body: ListView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            children: [
              const SizedBox(height: AppConstants.space_height_between_group),
              // _buildSelectAvatar(),
              Image.asset('Assets/Logo/logo-black.png', height: 140),
              const SizedBox(height: 10),
              const CenaTextDescription(
                  text: "Create CenaFoodie Account", fontSize: 20),
              const SizedBox(height: 10),
              _buildSwitchButton(context),
              _registType == RegistType.byEmail
                  ? const RegisterEmail()
                  : const RegisterPhone()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchButton(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 150,
          decoration: BoxDecoration(
            border: Border(
                bottom: _registType == RegistType.byPhone
                    ? BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.5,
                      )
                    : BorderSide.none),
          ),
          child: OutlinedButton(
            onPressed: () => setStateLoginType(RegistType.byPhone),
            style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(style: BorderStyle.none),
            )),
            child: Text(S.of(context).login_with_sms,
                style: _registType == RegistType.byPhone
                    ? TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold)
                    : const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
          ),
        ),
        Container(
          width: 150,
          decoration: BoxDecoration(
            border: Border(
                bottom: _registType == RegistType.byEmail
                    ? BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.5,
                      )
                    : BorderSide.none),
          ),
          child: OutlinedButton(
            onPressed: () => setStateLoginType(RegistType.byEmail),
            style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(style: BorderStyle.none),
            )),
            child: Text(S.of(context).login_with_email,
                style: _registType == RegistType.byEmail
                    ? TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold)
                    : const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
          ),
        ),
      ],
    );
    //
  }

  void setStateLoginType(RegistType registTypeState) {
    setState(() {
      _registType = registTypeState;
    });
  }

  void _registerFailureLogic(BuildContext context, FailureUserState state,
      S lang, ScrollController scrollController) {
    Navigator.pop(context);
    switch (state.error) {
      case "Email already exists":
        cenaToastError(lang.auth_registry_exist_email);
        // _focusEmail!.requestFocus();?
        break;
      case "Phone already exists":
        cenaToastError(lang.auth_registry_exist_phone);
        // _focusPhone!.requestFocus();
        break;
      case "FirstName has special character":
        cenaToastError(lang.auth_registry_have_special_character_firstName);
        // _focusFirstName!.requestFocus();
        scrollController.animateTo(50.0,
            duration: const Duration(milliseconds: 1000), curve: Curves.ease);
        break;
      case "LastName has special character":
        cenaToastError(lang.auth_registry_have_special_character_lastName);
        scrollController.animateTo(100.0,
            duration: const Duration(milliseconds: 1000), curve: Curves.ease);
        // _focusLastName!.requestFocus();
        break;
      case "No avatar images":
        cenaToastError(lang.auth_registry_must_select_avatar);
        scrollController.animateTo(0.0,
            duration: const Duration(milliseconds: 1000), curve: Curves.ease);
        break;
      default:
        cenaToastError(lang.auth_registry_error_server);
    }
  }

  void _registerSuccessLogic(BuildContext context, S lang, AuthBloc authBloc) {
    Navigator.pop(context);
    if (widget.phone != "") {
      cenaToastSuccess(lang.auth_registry_success);
      authBloc.add(LoginPhoneEvent(widget.phone!));
    } else {
      NavigationUtils.replace(context, RouteConstants.verify_phone_number,
          args: PageArguments(data: {
            // AppConstants.key_phone: _phoneController.value.text,
            AppConstants.key_is_register_page: true
          }));
    }
  }

  void _registerLogicSuccess(AuthState state, UserBloc userBloc,
      StoreBloc storeBloc, BuildContext context) {
    if (state.rolId != '') {
      userBloc.add(OnGetUserEvent(state.user!));
      storeBloc.add(OnGetStoreEvent(state.store!));
      Navigator.pop(context);

      if (state.rolId == '1') {
        NavigationUtils.clearStack(context,
            newRouteName: RouteConstants.admin_home);
      } else if (state.rolId == '2') {
        NavigationUtils.clearStack(context,
            newRouteName: RouteConstants.enter_reference);
      } else if (state.rolId == '3') {
        NavigationUtils.clearStack(context,
            newRouteName: RouteConstants.delivery_home);
      }
    }
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
          border: Border.all(
              style: BorderStyle.solid,
              color: Theme.of(context)
                  .primaryColorDark
                  .withOpacity(AppConstants.color_opacity)),
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
