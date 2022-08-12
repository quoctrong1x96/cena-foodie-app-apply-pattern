import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../data/models/entities/category/category.dart';
import '../../../blocs/product/product_bloc.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/widgets.dart';
import '../../Admin/Category/categories_admin_page.dart';

class UpdateCategoryAdminPage extends StatefulWidget {
  final Category category;
  const UpdateCategoryAdminPage(this.category, {Key? key}) : super(key: key);

  @override
  _UpdateCategoryAdminPageState createState() =>
      _UpdateCategoryAdminPageState();
}

class _UpdateCategoryAdminPageState extends State<UpdateCategoryAdminPage> {
  late TextEditingController _nameCategoryController;
  late TextEditingController _categoryDescriptionController;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameCategoryController = TextEditingController();
    _categoryDescriptionController = TextEditingController();
    _nameCategoryController.text = widget.category.category;
    _categoryDescriptionController.text = widget.category.description!;
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
          Navigator.pushReplacement(context,
              routeCena(page: CategoriesAdminPage(widget.category.storeId)));
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
          title: S.of(context).admin_category_title_update,
          centerTitle: true,
          leading: const CenaButtonDefaultBack(),
          actions: [
            TextButton(
                onPressed: () {
                  if (_keyForm.currentState!.validate()) {
                    productBloc.add(OnUpdateCategoryEvent(
                        widget.category.id,
                        _nameCategoryController.text,
                        _categoryDescriptionController.text,
                        widget.category.storeId));
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
                  maxLength: 50,
                  controller: _nameCategoryController,
                  hintText: S.of(context).admin_category_example,
                  validator: RequiredValidator(
                      errorText: S.of(context).admin_category_name_required),
                ),
                const SizedBox(height: 25.0),
                CenaTextDescription(
                    text: S.of(context).admin_category_description),
                const SizedBox(height: 5.0),
                CenaFormField(
                  maxLength: 100,
                  controller: _categoryDescriptionController,
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
