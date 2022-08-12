import 'package:cached_network_image/cached_network_image.dart';
import 'package:cenafoodie/src/utils/image_ultils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/entities/response/products_top_home_response.dart';
import '../../../../utils/configs/cena_text_styles.dart';
import '../../../blocs/product/product_bloc.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';
import '../../Admin/Products/add_new_product_page.dart';
import '../../Admin/Products/update_product_page.dart';

class ListProductsPage extends StatefulWidget {
  const ListProductsPage({Key? key}) : super(key: key);

  @override
  State<ListProductsPage> createState() => _ListProductsPageState();
}

class _ListProductsPageState extends State<ListProductsPage> {
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return BlocListener<ProductsBloc, ProductsState>(
      listener: (context, state) {
        if (state is LoadingProductsState) {
          modalLoading(context);
        } else if (state is SuccessProductsState) {
          Navigator.pop(context);
          cenaToastSuccess(lang.admin_product_success);
          setState(() {});
        } else if (state is FailureProductsState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: CenaColors.LIGHT_GREY,
        appBar: CenaAppbarDefault(
          title: lang.admin_product_title,
          leading: const CenaButtonDefaultBack(),
          actions: [
            TextButton(
                onPressed: () => Navigator.push(
                    context, routeCena(page: const AddNewProductPage())),
                child: CenaTextDescription(
                    text: lang.admin_product_button_add,
                    fontSize: 16,
                    color: CenaColors.WHITE))
          ],
        ),
        // body: FutureBuilder<List<FoodAndDrink>>(
        //     future: productController.getProductsTopHome(
        //       BlocProvider.of<StoreBloc>(context).state.store!.id!,
        //     ),
        //     builder: (context, snapshot) => (!snapshot.hasData)
        //         ? const CenaShimmer()
        //         : _GridViewListProduct(listProducts: snapshot.data!)),
      ),
    );
  }
}

// ignore: unused_element
class _GridViewListProduct extends StatelessWidget {
  final List<FoodAndDrink> listProducts;

  const _GridViewListProduct({required this.listProducts});

  @override
  Widget build(BuildContext context) {
    if (listProducts.isNotEmpty) {
      final lang = S.of(context);
      List<String> categories = [];
      for (var product in listProducts) {
        if (categories.isNotEmpty) {
          if (categories.firstWhere((element) => element == product.category,
                  orElse: () => "") ==
              "") {
            categories.add(product.category);
          }
        } else {
          categories.add(product.category);
        }
      }
      return ListView.builder(
        itemCount: categories.length,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, i) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            Container(
              color: CenaColors.WHITE,
              width: MediaQuery.of(context).size.width,
              child: CenaTextGroup(
                text: categories[i],
                // color: CenaColors.,
                fontWeight: FontWeight.bold,
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 1,
                  mainAxisExtent: 120),
              itemCount: listProducts
                  .where((element) => categories[i] == element.category)
                  .length,
              itemBuilder: (_, j) => Container(
                decoration: BoxDecoration(
                    color: CenaColors.WHITE,
                    borderRadius: BorderRadius.circular(1.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  scale: 7,
                                  image: CachedNetworkImageProvider(
                                      ImagesUltils.getImageApiUrl(listProducts
                                          .where((element) =>
                                              categories[i] == element.category)
                                          .elementAt(j)
                                          .picture)),
                                  fit: BoxFit.cover)),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    CenaTextDescription(
                                      text: listProducts
                                          .where((element) =>
                                              categories[i] == element.category)
                                          .elementAt(j)
                                          .nameProduct,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                                _buildPriceDiscount(listProducts
                                    .where((element) =>
                                        categories[i] == element.category)
                                    .elementAt(j))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 5.0),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.cartShopping,
                              size: 14,
                              color: CenaColors.textBlack.withOpacity(0.8),
                            ),
                            const SizedBox(width: 5.0),
                            CenaTextDescription(
                                text: lang.admin_product_sales + " ",
                                fontSize: 14,
                                color: CenaColors.textBlack.withOpacity(0.8)),
                            CenaTextDescription(
                                text: listProducts
                                    .where((element) =>
                                        categories[i] == element.category)
                                    .elementAt(j)
                                    .sales
                                    .toString(),
                                fontSize: 14,
                                color: CenaColors.textBlack.withOpacity(0.8))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.thumbsUp,
                                size: 14,
                                color: CenaColors.textBlack.withOpacity(0.8)),
                            const SizedBox(width: 5.0),
                            CenaTextDescription(
                              text: lang.admin_product_liked + " ",
                              fontSize: 14,
                              color: CenaColors.textBlack.withOpacity(0.8),
                            ),
                            CenaTextDescription(
                                text: listProducts
                                    .where((element) =>
                                        categories[i] == element.category)
                                    .elementAt(j)
                                    .liked
                                    .toString(),
                                fontSize: 14,
                                color: CenaColors.textBlack.withOpacity(0.8))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.solidEye,
                                size: 14,
                                color: CenaColors.textBlack.withOpacity(0.8)),
                            const SizedBox(width: 5.0),
                            CenaTextDescription(
                              text: lang.admin_product_viewer + " ",
                              fontSize: 14,
                              color: CenaColors.textBlack.withOpacity(0.8),
                            ),
                            CenaTextDescription(
                                text: listProducts
                                    .where((element) =>
                                        categories[i] == element.category)
                                    .elementAt(j)
                                    .viewer
                                    .toString(),
                                fontSize: 14,
                                color: CenaColors.textBlack.withOpacity(0.8))
                          ],
                        ),
                        const SizedBox(width: 5.0),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            modalActiveOrInactiveProduct(
                                context,
                                listProducts[i].storeId,
                                listProducts[i].status,
                                listProducts[i].nameProduct,
                                listProducts[i].id,
                                listProducts[i].picture);
                          },
                          child: Container(
                              width: 100,
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                  child: listProducts[i].status == 1
                                      ? Text(lang.admin_product_hidden)
                                      : Text(
                                          lang.admin_product_show,
                                          style: const TextStyle(
                                              color: CenaColors.primary),
                                        )),
                              decoration: BoxDecoration(
                                  border: Border.all(color: CenaColors.GREY),
                                  borderRadius: BorderRadius.circular(2.0))),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                routeCena(
                                    page: UpdateProductPage(listProducts[i])));
                          },
                          child: Container(
                              width: 100,
                              padding: const EdgeInsets.all(5.0),
                              child:
                                  Center(child: Text(lang.admin_product_edit)),
                              decoration: BoxDecoration(
                                  border: Border.all(color: CenaColors.GREY),
                                  borderRadius: BorderRadius.circular(2.0))),
                        ),
                        TextButton(
                          onPressed: () => modalDeleteProduct(
                              context,
                              listProducts[i].storeId,
                              listProducts[i].nameProduct,
                              listProducts[i].picture,
                              listProducts[i].id),
                          child: Container(
                              width: 100,
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                  child: Text(lang.admin_product_delete)),
                              decoration: BoxDecoration(
                                  border: Border.all(color: CenaColors.GREY),
                                  borderRadius: BorderRadius.circular(2.0))),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return _WithoutListFoodsAndDrinks();
    }
  }

  Widget _buildPriceDiscount(FoodAndDrink foodAndDrink) {
    int discount = 10;
    double discountPrice = foodAndDrink.price;
    NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
    if (discount > 0) {
      String discountString =
          (foodAndDrink.price / 100 * (100 - discount)).toString();
      discountString = discountString.substring(0, discountString.length - 2);
      discountPrice = double.parse(discountString);
    }
    return SizedBox(
        height: 25,
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                discount > 0
                    ? Text(
                        numberFormat.format(foodAndDrink.price).toString(),
                        overflow: TextOverflow.ellipsis,
                        style: CenaTextStyles.foodPriceDiscount,
                      )
                    : Text(
                        numberFormat.format(foodAndDrink.price).toString(),
                        overflow: TextOverflow.ellipsis,
                        style: CenaTextStyles.foodPriceNonDiscount,
                      ),
                discount > 0
                    ? Text(
                        numberFormat.format(discountPrice).toString(),
                        overflow: TextOverflow.ellipsis,
                        style: CenaTextStyles.foodPrice,
                      )
                    : const SizedBox(),
                const SizedBox(
                  width: 30,
                ),
              ],
            )));
  }
}

class _WithoutListFoodsAndDrinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('Assets/no-data.svg', height: 400),
            CenaTextDescription(
                text: S.of(context).admin_product_no_data,
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: CenaColors.secondary),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
