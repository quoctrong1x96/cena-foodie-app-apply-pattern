import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../blocs/cart/cart_bloc.dart';
import '../../../../configs/cena_colors.dart';
import '../../../../configs/cena_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../../models/product_cart.dart';
import '../../../../models/response/products_top_home_response.dart';
import '../../../../services/url.dart';
import '../../detail_product/details_product_page.dart';

class FoodRow extends StatelessWidget {
  final FoodAndDrink foodAndDrink;
  final int sale;
  final int like;
  final int? discount;
  final int storeId;

  const FoodRow({
    Key? key,
    required this.foodAndDrink,
    required this.storeId,
    this.like = 200,
    this.discount = 20,
    this.sale = 999,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsProductPage(
                      product: foodAndDrink,
                      storeId: storeId,
                    )));
      },
      child: Container(
        color: CenaColors.WHITE,
        height: (100),
        // width: double.infinity,
        child: Row(
          children: <Widget>[
            Image.network(
              URLS.BASE_URL + foodAndDrink.picture,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFoodName(),
                  _buildLikeSales(context),
                  const SizedBox(height: 25),
                  _buildPriceDiscount(),
                ],
              ),
            ),
            _buildAddToCart()
          ],
        ),
      ),
    );
  }

  Widget _buildFoodName() {
    return SizedBox(
      height: 25,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              foodAndDrink.nameProduct,
              textAlign: TextAlign.left,
              style: foodAndDrink.nameProduct.length < 15
                  ? CenaTextStyles.foodName
                  : foodAndDrink.nameProduct.length < 30
                      ? CenaTextStyles.blackS14Bold
                      : CenaTextStyles.blackS12Bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLikeSales(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              sale.toString(),
              textAlign: TextAlign.left,
              style: CenaTextStyles.smallDescription,
            ),
            Text(
              " ${S.of(context).client_store_food_row_sold} | ",
              style: CenaTextStyles.smallDescription,
            ),
            Text(
              like.toString() +
                  " ${S.of(context).client_store_food_row_liked} ",
              textAlign: TextAlign.left,
              style: CenaTextStyles.smallDescription,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDiscount() {
    double discountPrice = foodAndDrink.price;
    NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
    if (discount! > 0) {
      String discountString =
          (foodAndDrink.price / 100 * (100 - discount!)).toString();
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
                discount! > 0
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
                discount! > 0
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

  Widget _buildAddToCart() {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      final cartBloc = BlocProvider.of<CartBloc>(context);
      int quantity = 0;
      if (state.products != null) {
        final ProductCart productCart = state.products!.firstWhere(
            (element) =>
                element.uidProduct == foodAndDrink.id.toString() &&
                element.storeId == storeId,
            orElse: () => ProductCart(
                storeId: storeId,
                uidProduct: foodAndDrink.id.toString(),
                imageProduct: foodAndDrink.picture,
                nameProduct: foodAndDrink.nameProduct,
                price: foodAndDrink.price,
                quantity: 0));
        quantity = productCart.quantity;
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          quantity > 0
              ? GestureDetector(
                  onTap: () {
                    if (quantity > 1) {
                      cartBloc.add(OnDecreaseProductQuantityEvent(
                          foodAndDrink.id.toString(), storeId));
                    }
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    margin: const EdgeInsets.only(top: 10, left: 25),
                    decoration: BoxDecoration(
                        color:
                            quantity > 1 ? CenaColors.primary : CenaColors.GREY,
                        borderRadius: BorderRadius.circular(1)),
                    child: Center(
                      child: Text(
                        "-",
                        style: CenaTextStyles.whiteS18Bold,
                      ),
                    ),
                  ),
                )
              : const SizedBox(width: 10),
          quantity > 0
              ? Container(
                  margin: const EdgeInsets.only(left: 26),
                  child: Text(
                      quantity < 10
                          ? "0" + quantity.toString()
                          : quantity.toString(),
                      style: CenaTextStyles.blackS18),
                )
              : const SizedBox(width: 10),
          quantity <= 0
              ? const SizedBox(width: 10)
              : GestureDetector(
                  onTap: () {
                    cartBloc.add(OnIncreaseProductQuantityEvent(
                        foodAndDrink.id.toString(), storeId));
                  },
                  child: Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.only(bottom: 10, left: 25),
                      decoration: BoxDecoration(
                          color: CenaColors.primary,
                          borderRadius: BorderRadius.circular(1)),
                      child: Center(
                        child: Text(
                          "+",
                          style: CenaTextStyles.whiteS18Bold,
                        ),
                      )),
                )
        ],
      );
    });
  }

  // Future<void> _itemAddToCart(
  //     {required BuildContext context, CartLineItem? cartLineItem}) async {
  //   await CenaCart.getInstance.addToCart(
  //       cartLineItem: cartLineItem!, storeId: cartLineItem.cartStoreId!);
  //   context.read<CartProvider>().changeCart(cartLineItem.productId!);
  //   showStatusAlert(context,
  //       title: "Thành công",
  //       subtitle: "Bạn đã thêm đơn hàng thành công vào giỏ",
  //       duration: 1,
  //       icon: Icons.add_shopping_cart);
  // }
}

class DynamicallyCheckbox extends StatefulWidget {
  const DynamicallyCheckbox({Key? key}) : super(key: key);

  @override
  DynamicallyCheckboxState createState() => DynamicallyCheckboxState();
}

class DynamicallyCheckboxState extends State {
  Map<String, bool> list = {
    'Thạnh dừa': false,
    'Sương sáo': false,
    'Trân châu trắng': false,
    'Bánh Flan': false,
    'Thạch cà phê': false,
  };

  var holder_1 = <dynamic>[];

  void getItems() {
    list.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: ListView(
          children: list.keys.map((String key) {
            return CheckboxListTile(
              title: Text(key),
              value: list[key],
              activeColor: Colors.deepPurple[400],
              checkColor: Colors.white,
              onChanged: (bool? value) {
                setState(() {
                  list[key] = value!;
                });
              },
            );
          }).toList(),
        ),
      ),
    ]);
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: press,
          child: SizedBox(
            width: 90,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    //color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: CenaColors.GREY,
                      width: 1,
                    ),
                  ),
                  child: SvgPicture.asset(
                    icon!,
                    color: CenaColors.primary,
                    height: 30,
                    width: 30,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12.0),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 90,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  //color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: CenaColors.GREY,
                    width: 1,
                  ),
                ),
                child: SvgPicture.asset(
                  icon!,
                  color: CenaColors.primary,
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                text!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12.0),
              )
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class RadioGroup extends StatefulWidget {
  RadioGroup({Key? key, required this.listRadio}) : super(key: key);
  List<FruitsList> listRadio;
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class FruitsList {
  String name;
  int index;
  FruitsList({required this.name, required this.index});
}

List<FruitsList> radioGroupSugar = [
  FruitsList(
    index: 1,
    name: "Ít đường",
  ),
  FruitsList(
    index: 2,
    name: "Đường bình thường",
  ),
  FruitsList(
    index: 3,
    name: "Nhiều đường",
  ),
];

List<FruitsList> radioGroupIce = [
  FruitsList(
    index: 1,
    name: "Đá chung",
  ),
  FruitsList(
    index: 2,
    name: "Đá riêng",
  ),
  // FruitsList(
  //   index: 3,
  //   name: "Nhiều đá",
  // ),
];

class RadioGroupWidget extends State<RadioGroup> {
  // Default Radio Button Item
  String radioItem = 'Ít đá';

  // Group Value for Radio Button.
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: SizedBox(
          height: 350.0,
          child: Column(
            children: widget.listRadio
                .map((data) => RadioListTile(
                      title: Text(data.name),
                      groupValue: id,
                      value: data.index,
                      onChanged: (val) {
                        setState(() {
                          radioItem = data.name;
                          id = data.index;
                        });
                      },
                    ))
                .toList(),
          ),
        )),
      ],
    );
  }
}
