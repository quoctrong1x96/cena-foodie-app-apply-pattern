import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/models/entities/product/product.dart';
import '../../../../data/models/entities/store/store.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../../utils/image_ultils.dart';
import '../../../blocs/product/product_bloc.dart';
import '../../../blocs/store/store_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';
import 'list_products_page.dart';

class UpdateProductPage extends StatefulWidget {
  final Product product;
  const UpdateProductPage(this.product, {Key? key}) : super(key: key);

  @override
  _UpdateProductPageState createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late Store store;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _nameController.text = widget.product.nameProduct!;
    _descriptionController.text = widget.product.description!;
    _priceController.text = widget.product.price.toString();
  }

  @override
  void dispose() {
    _nameController.clear();
    _nameController.dispose();
    _descriptionController.clear();
    _descriptionController.dispose();
    _priceController.clear();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductsBloc>(context);
    final storeBloc = BlocProvider.of<StoreBloc>(context);
    store = storeBloc.state.store!;
    final lang = S.of(context);

    return BlocListener<ProductsBloc, ProductsState>(
      listener: (context, state) {
        if (state is LoadingProductsState) {
          modalLoading(context);
        } else if (state is SuccessProductsState) {
          cenaToastSuccess(lang.store_product_update_success);
          Navigator.pushReplacement(
              context, routeCena(page: const ListProductsPage()));
        } else if (state is FailureProductsState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  CenaTextDescription(text: state.error, color: Colors.white),
              backgroundColor: Colors.red));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CenaAppbarDefault(
          title: lang.store_product_update_title,
          centerTitle: true,
          leading: CenaButtonDefaultBack(action: () {
            Navigator.pop(context);
            productBloc.add(OnUnSelectCategoryEvent());
            productBloc.add(OnUnSelectMultipleImagesEvent());
          }),
          actions: [
            TextButton(
                onPressed: () {
                  productBloc.add(OnUpdateProductEvent(
                      store,
                      widget.product.id,
                      _nameController.text,
                      _descriptionController.text,
                      _priceController.text,
                      productBloc.state.images,
                      (productBloc.state.idCategory + 1).toString()));
                },
                child: CenaTextDescription(
                  text: lang.store_product_add_button_save,
                  color: CenaColors.WHITE,
                  fontSize: 16,
                ))
          ],
        ),
        body: Form(
          key: _keyForm,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            children: [
              const SizedBox(height: 10.0),
              CenaTextDescription(text: lang.store_product_add_store_name),
              const SizedBox(height: 5.0),
              CenaFormField(
                hintText: '${store.id} - ${store.storeName}',
                readOnly: true,
              ),
              const SizedBox(height: 10.0),
              CenaTextDescription(text: lang.store_product_add_product_name),
              const SizedBox(height: 5.0),
              CenaFormField(
                controller: _nameController,
                hintText: lang.store_product_add_product_hint,
                validator: RequiredValidator(
                    errorText: lang.store_product_add_product_name_error),
              ),
              const SizedBox(height: 20.0),
              CenaTextDescription(
                  text: lang.store_product_add_product_description),
              const SizedBox(height: 5.0),
              CenaFormField(
                controller: _descriptionController,
                maxLine: 5,
                validator: RequiredValidator(
                    errorText:
                        lang.store_product_add_product_description_error),
              ),
              const SizedBox(height: 20.0),
              CenaTextDescription(text: lang.store_product_add_price),
              const SizedBox(height: 5.0),
              CenaFormField(
                controller: _priceController,
                hintText: lang.store_product_add_price_hint,
                keyboardType: TextInputType.number,
                validator: RequiredValidator(
                    errorText: lang.store_product_add_price_erorr),
              ),
              const SizedBox(height: 20.0),
              CenaTextDescription(text: lang.store_product_add_picture),
              const SizedBox(height: 10.0),
              InkWell(
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();

                  final List<XFile>? images = await _picker.pickMultiImage();

                  if (images != null) {
                    productBloc.add(OnSelectMultipleImagesEvent(images));
                  }
                },
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0)),
                  child: BlocBuilder<ProductsBloc, ProductsState>(
                      builder: (context, state) => state.images != null &&
                              state.images!.isNotEmpty
                          ? ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.images?.length,
                              itemBuilder: (_, i) => Container(
                                    height: 100,
                                    width: 120,
                                    margin: const EdgeInsets.only(right: 10.0),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(
                                                File(state.images![i].path)),
                                            fit: BoxFit.cover)),
                                  ))
                          : CenaImageCache(
                              url: ImagesUltils.getImageApiUrl(
                                  widget.product.picture))),
                ),
              ),
              const SizedBox(height: 20.0),
              CenaTextDescription(text: lang.store_product_add_category),
              const SizedBox(height: 5.0),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.0)),
                child: Container(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.grey,
                            blurRadius: 7,
                            spreadRadius: -5.0)
                      ]),
                  child: InkWell(
                    onTap: () => modalSelectionCategory(
                        context, storeBloc.state.store!.id),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue, width: 3.5),
                                  borderRadius: BorderRadius.circular(6.0)),
                            ),
                            const SizedBox(width: 8.0),
                            BlocBuilder<ProductsBloc, ProductsState>(
                              builder: (context, state) => state.category ==
                                          null ||
                                      state.category == ''
                                  ? CenaTextDescription(
                                      text: widget.product.category!,
                                    )
                                  : CenaTextDescription(text: state.category!),
                            )
                          ],
                        ),
                        const Icon(Icons.navigate_next_rounded)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
