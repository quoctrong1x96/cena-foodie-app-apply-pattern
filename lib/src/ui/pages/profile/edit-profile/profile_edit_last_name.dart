import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';
import '../edit_profile_page.dart';

class EditLastNameProfilePage extends StatefulWidget {
  const EditLastNameProfilePage({Key? key}) : super(key: key);

  @override
  _EditLastNameProfilePageState createState() =>
      _EditLastNameProfilePageState();
}

class _EditLastNameProfilePageState extends State<EditLastNameProfilePage> {
  late TextEditingController _lastNameController;
  late String _lastName;

  final _keyForm = GlobalKey<FormState>();

  Future<void> getPersonalInformation() async {
    final userBloc = BlocProvider.of<UserBloc>(context).state.user!;
    _lastNameController = TextEditingController(text: userBloc.lastName);
    _lastName = _lastNameController.value.text;
  }

  @override
  void initState() {
    super.initState();
    getPersonalInformation();
  }

  @override
  void dispose() {
    _lastNameController.clear();
    _lastNameController.dispose();
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
          Navigator.pop(context);
          cenaToastSuccess(lang.profile_edit_lastName_success);
          Navigator.pushReplacement(
              context, routeCena(page: const EditProfilePage()));
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: CenaColors.LIGHT_GREY,
        appBar: CenaAppbarDefault(
          title: lang.profile_edit_lastName_title,
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
                        labelText: lang.profile_edit_lastName_label,
                        textEditingController: _lastNameController),
                    CenaButton(
                      text: lang.profile_edit_lastName_button_save,
                      height: 40,
                      onPressed: () => _saveChangeProfile(_lastNameController),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void _saveChangeProfile(TextEditingController controleler) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    if (_keyForm.currentState!.validate()) {
      if (controleler.text != _lastName) {
        userBloc.add(OnChangeLastNameProfileEvent(
            userBloc.state.user!.id, controleler.text));
      } else {
        Navigator.pop(context);
      }
    }
  }
}
