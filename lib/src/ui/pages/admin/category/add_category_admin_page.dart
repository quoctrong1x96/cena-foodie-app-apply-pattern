import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../blocs/product/product_bloc.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/widgets.dart';
import '../../Admin/Category/categories_admin_page.dart';

class AddCategoryAdminPage extends StatefulWidget {
  final int storeId;
  const AddCategoryAdminPage(this.storeId, {Key? key}) : super(key: key);

  @override
  _AddCategoryAdminPageState createState() => _AddCategoryAdminPageState();
}

class _AddCategoryAdminPageState extends State<AddCategoryAdminPage> {
  late TextEditingController _nameCategoryController;
  late TextEditingController _categoryDescriptionController;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameCategoryController = TextEditingController();
    _categoryDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameCategoryController.clear();
    _categoryDescriptionController.clear();
    _nameCategoryController.dispose();
    _categoryDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductsBloc>(context);

    return BlocListener<ProductsBloc, ProductsState>(
      listener: (context, state) {
        if (state is LoadingProductsState) {
          modalLoading(context);
        } else if (state is SuccessProductsState) {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pushReplacement(
              context, routeCena(page: CategoriesAdminPage(widget.storeId)));
        } else if (state is FailureProductsState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  CenaTextDescription(text: state.error, color: Colors.white),
              backgroundColor: Colors.red));
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: CenaAppbarDefault(
          title: S.of(context).admin_category_add,
          leading: const CenaButtonDefaultBack(),
          actions: [
            TextButton(
                onPressed: () {
                  if (_keyForm.currentState!.validate()) {
                    productBloc.add(OnAddNewCategoryEvent(
                        _nameCategoryController.text,
                        _categoryDescriptionController.text,
                        widget.storeId));
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        routeCena(page: AddCategoryAdminPage(widget.storeId)));
                  }
                },
                child: CenaTextDescription(
                  text: S.of(context).common_save,
                  color: CenaColors.WHITE,
                  fontSize: 16,
                ))
          ],
        ),
        body: Form(
          key: _keyForm,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                CenaTextDescription(text: S.of(context).admin_category_name),
                const SizedBox(height: 5.0),
                CenaFormField(
                  controller: _nameCategoryController,
                  hintText: S.of(context).admin_category_example,
                  maxLength: 50,
                  validator: RequiredValidator(
                      errorText: S.of(context).admin_category_name_required),
                ),
                const SizedBox(height: 25.0),
                CenaTextDescription(
                    text: S.of(context).admin_category_description),
                const SizedBox(height: 5.0),
                CenaFormField(
                  controller: _categoryDescriptionController,
                  maxLength: 1000,
                  maxLine: 8,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
