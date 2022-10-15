import 'package:cenafoodie/src/data/app_locator.dart';
import 'package:cenafoodie/src/data/models/entities/category/category.dart';
import 'package:cenafoodie/src/data/models/ui/ui_response.dart';
import 'package:cenafoodie/src/data/services/entities/category_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/constants/app_constants.dart';
import '../../../blocs/store/store_bloc.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/row/cena_row_store.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';

class EditStorePage extends StatefulWidget {
  const EditStorePage({Key? key}) : super(key: key);

  @override
  _EditStorePageState createState() => _EditStorePageState();
}

class _EditStorePageState extends State<EditStorePage> {
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  final ICategoryService _categoryService = locator<ICategoryService>();

  // ignore: unused_field
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
    setState(() {});
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
    final storeBloc = BlocProvider.of<StoreBloc>(context);
    final store = storeBloc.state.store!;
    final lang = S.of(context);

    return BlocListener<StoreBloc, StoreState>(
      listener: (context, state) {
        if (state is LoadingStoreState) {
          modalLoading(context);
        } else if (state is SuccessStoreState) {
          Navigator.pop(context);
          cenaToastSuccess(lang.store_info_update_success);
        } else if (state is FailureStoreState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: CenaColors.LIGHT_GREY,
        appBar: CenaAppbarDefault(
          title: lang.store_info_title,
          leading: const CenaButtonDefaultBack(),
        ),
        body: SafeArea(
          child: FutureBuilder<UiResponse<List<String>>>(
            future: _categoryService.fetchAllNameCategoryByStore(
                storeId: storeBloc.state.store!.id),
            builder: (context, snapshot) => !snapshot.hasData
                ? const CenaShimmer()
                : Form(
                    key: _keyForm,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        CenaTextGroup(
                            text: lang.store_info_review, color: Colors.grey),
                        CenaRowStore(
                          storeId: store.id,
                          name: store.storeName,
                          image: store.image,
                          categories: snapshot.data!.data!.isEmpty
                              ? "-"
                              : snapshot.data!.data!.join(','),
                          voucher: "Tên voucher",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CenaTextGroup(
                            text: lang.store_info_avatar, color: Colors.grey),
                        CenaButtonLineImage(
                          text: lang.store_info_change_avatar,
                          image: store.image,
                          onPressed: () => modalPictureRegister(
                              ctx: context,
                              onPressedChange: () async {
                                Navigator.pop(context);
                                final ImagePicker _picker = ImagePicker();
                                final XFile? imagePath =
                                    await _picker.pickImage(
                                        source: ImageSource.gallery,
                                        imageQuality: 50);
                                if (imagePath != null) {
                                  storeBloc.add(OnSelectPictureStoreEvent(
                                      BlocProvider.of<StoreBloc>(context)
                                          .state
                                          .store!
                                          .id,
                                      imagePath.path));
                                }
                              },
                              onPressedTake: () async {
                                Navigator.pop(context);
                                final ImagePicker _picker = ImagePicker();
                                final XFile? photoPath =
                                    await _picker.pickImage(
                                        source: ImageSource.camera,
                                        imageQuality: 50);
                                if (photoPath != null) {
                                  storeBloc.add(OnChangeImageStoreEvent(
                                      storeBloc.state.store!.id,
                                      photoPath.path));
                                }
                              }),
                        ),
                        CenaTextGroup(
                            text: lang.store_info_information,
                            color: Colors.grey),
                        CenaButtonLineText(
                          label: lang.store_info_name,
                          text: store.storeName,
                        ),
                        CenaButtonLineText(
                          text: "",
                          labelWidth: MediaQuery.of(context).size.width -
                              4 * AppConstants.padding_left,
                          textOverflow: TextOverflow.ellipsis,
                          label: store.address!,
                          onPressed: () {},
                          fontSize: 18,
                        ),
                        CenaButtonLineText(
                            label: lang.store_info_open, text: store.openTime),
                        CenaButtonLineText(
                            label: lang.store_info_close,
                            text: store.closeTime),
                        CenaButtonRatingStar(
                          canChange: false,
                          label: lang.store_info_rate,
                          star: 4.5,
                        ),
                        CenaTextGroup(
                            text: lang.store_info_catregories,
                            color: Colors.grey),
                        store.id == -1
                            ? const SizedBox(width: 5)
                            : CenaGroupMultipleCheck(
                                isDisabled: true,
                                options: snapshot.data!.data!,
                                checkedList: [
                                    for (var i = 0;
                                        i < snapshot.data!.data!.length;
                                        i++)
                                      i
                                  ]),
                      ],
                    )),
          ),
        ),
      ),
    );
  }
}
