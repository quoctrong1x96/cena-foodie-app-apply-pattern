import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/configs/cena_colors.dart';
import '../../../../../utils/constants/route_constants.dart';
import '../../../../../utils/helpers/helpers.dart';
import '../../../../../utils/navigation_utils.dart';
import '../../../../blocs/user/user_bloc.dart';
import '../../../../resources/generated/l10n.dart';
import '../../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../../widgets/widgets.dart';

class EditFirstNameProfilePage extends StatefulWidget {
  const EditFirstNameProfilePage({Key? key}) : super(key: key);

  @override
  _EditFirstNameProfilePageState createState() =>
      _EditFirstNameProfilePageState();
}

class _EditFirstNameProfilePageState extends State<EditFirstNameProfilePage> {
  late TextEditingController _firstNameController;
  late String _firstName;

  final _keyForm = GlobalKey<FormState>();

  Future<void> getPersonalInformation() async {
    final userBloc = BlocProvider.of<UserBloc>(context).state.user!;
    _firstNameController = TextEditingController(text: userBloc.firstName);
    _firstName = _firstNameController.value.text;
  }

  @override
  void initState() {
    super.initState();
    getPersonalInformation();
  }

  @override
  void dispose() {
    _firstNameController.clear();
    _firstNameController.dispose();
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
          NavigationUtils.pop(context);
          NavigationUtils.replace(context, RouteConstants.client_profile_edit);
          cenaToastSuccess(lang.profile_edit_firstName_success);
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: CenaColors.LIGHT_GREY,
        appBar: CenaAppbarDefault(
          title: lang.profile_edit_firstName_title,
          leading: const CenaButtonDefaultBack(),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _keyForm,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    CenaInputNormal(
                        labelText: lang.profile_edit_firstName_label,
                        textEditingController: _firstNameController),
                    CenaButton(
                      text: lang.profile_edit_firstName_button_save,
                      height: 40,
                      onPressed: () => _saveChangeProfile(_firstNameController),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void _saveChangeProfile(TextEditingController controller) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    if (_keyForm.currentState!.validate()) {
      if (controller.text != _firstName) {
        userBloc.add(OnChangeFirstNameProfileEvent(
            userBloc.state.user!.id, controller.text));
      } else {
        Navigator.pop(context);
      }
    }
  }
}
