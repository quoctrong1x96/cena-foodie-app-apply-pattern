import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../blocs/store/store_bloc.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';
import '../../Admin/store/store_edit_page.dart';

class EditStoreImagePage extends StatefulWidget {
  const EditStoreImagePage({Key? key}) : super(key: key);

  @override
  _EditStoreImagePageState createState() => _EditStoreImagePageState();
}

class _EditStoreImagePageState extends State<EditStoreImagePage> {
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
          cenaToastSuccess(lang.store_avatar_success);
          Navigator.pushReplacement(
              context, routeCena(page: const EditStorePage()));
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: CenaColors.LIGHT_GREY,
        appBar: CenaAppbarDefault(
          title: lang.store_avatar_title,
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
                    text: lang.store_avatar_change,
                    onPressed: _changeStoreImages,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _changeStoreImages() {
    final userBloc = BlocProvider.of<StoreBloc>(context);
    final ImagePicker _picker = ImagePicker();
    modalPictureRegister(
        ctx: context,
        onPressedChange: () async {
          Navigator.pop(context);
          final XFile? imagePath = await _picker.pickImage(
              source: ImageSource.gallery, imageQuality: 50);
          if (imagePath != null) {
            userBloc.add(OnChangeImageStoreEvent(
                BlocProvider.of<StoreBloc>(context).state.store!.id,
                imagePath.path));
          }
        },
        onPressedTake: () async {
          Navigator.pop(context);
          final XFile? photoPath = await _picker.pickImage(
              source: ImageSource.camera, imageQuality: 50);
          if (photoPath != null) {
            userBloc.add(OnChangeImageStoreEvent(
                BlocProvider.of<StoreBloc>(context).state.store!.id,
                photoPath.path));
          }
        });
  }
}
