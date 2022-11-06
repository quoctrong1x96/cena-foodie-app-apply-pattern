import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants/route_constants.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../../utils/navigation_utils.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  final _keyForm = GlobalKey<FormState>();

  Future<void> getPersonalInformation() async {
    final userBloc = BlocProvider.of<UserBloc>(context).state.user!;

    _nameController = TextEditingController(text: userBloc.firstName);
    _lastNameController = TextEditingController(text: userBloc.lastName);
    _phoneController = TextEditingController(text: userBloc.phone);
    _emailController = TextEditingController(text: userBloc.email);
  }

  @override
  void initState() {
    super.initState();
    getPersonalInformation();
  }

  @override
  void dispose() {
    _nameController.clear();
    _lastNameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is LoadingUserState) {
          modalLoading(context);
        } else if (state is SuccessUserState) {
          Navigator.pop(context);
          cenaToastSuccess("User updated");
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        appBar: CenaAppbarDefault(
          title: lang.profile_edit_title,
          leading: const CenaButtonDefaultBack(),
        ),
        body: SafeArea(
          child: Form(
              key: _keyForm,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 10),
                  CenaButtonLineImage(
                    text: lang.profile_edit_change_avatar,
                    fontSize: 14,
                    onPressed: () => NavigationUtils.push(
                        context, RouteConstants.client_profile_images),
                  ),
                  CenaTextGroup(
                    text: lang.profile_edit_account,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  CenaButtonLineText(
                      label: lang.profile_edit_username,
                      text: _emailController.value.text,
                      fontSize: 14),
                  CenaButtonLineText(
                      label: lang.profile_edit_phone,
                      text: _phoneController.value.text,
                      fontSize: 14),
                  CenaTextGroup(
                      text: lang.profile_edit_profile,
                      color: Colors.grey,
                      fontSize: 14),
                  CenaButtonLineText(
                    label: lang.profile_edit_lastName,
                    text: _lastNameController.value.text,
                    fontSize: 14,
                    onPressed: () => NavigationUtils.push(
                        context, RouteConstants.client_profile_lastname),
                  ),
                  CenaButtonLineText(
                    label: lang.profile_edit_firtname,
                    text: _nameController.value.text,
                    fontSize: 14,
                    onPressed: () => NavigationUtils.push(
                        context, RouteConstants.client_profile_firstname),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
