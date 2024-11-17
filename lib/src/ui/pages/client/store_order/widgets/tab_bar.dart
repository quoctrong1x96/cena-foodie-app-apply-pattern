import 'package:flutter/material.dart';

import '../../../../../data/app_locator.dart';
import '../../../../../data/models/entities/product/product.dart';
import '../../../../../data/models/entities/store/store.dart';
import '../../../../../data/services/entities/product_service.dart';
import '../../../../../utils/configs/cena_colors.dart';
import '../../../../widgets/widgets.dart';
import 'food_row.dart';

class CustomTabs extends StatefulWidget {
  final Store store;
  const CustomTabs({Key? key, required this.store}) : super(key: key);
  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late List<Product> _foodAndDrinks;
  late List<String> _categories = [];
  late List<double> _categoriesHeight = [];
  final _productService = locator<IProductService>();
  bool _isLoading = true;
  bool _isAnimation = false;
  final double _productHeight = 100.0;
  final double _categoryHeight = 50.0;
  late TabController _tabCategoryController;
  List<TabCategory> _listTabCategory = [];

  Future<void> _getProductsOfStore() async {
    final int _storeId = widget.store.id;

    List<Product> cenaProducts = await _productService
        .fetchAll(storeId: _storeId)
        .then((value) => value.data!);
    List<String> categories = [];
    List<double> categoriesHeight = [];
    List<TabCategory> listTabCategory = [];

    for (var product in cenaProducts) {
      if (categories.isNotEmpty) {
        if (categories.firstWhere((element) => element == product.category,
                orElse: () => "") ==
            "") {
          categories.add(product.category!);
          categoriesHeight.add(cenaProducts
                      .where((element) => element.category == product.category!)
                      .length *
                  _productHeight +
              _categoryHeight);
        }
      } else {
        categories.add(product.category!);
        categoriesHeight.add(cenaProducts
                    .where((element) => element.category == product.category!)
                    .length *
                _productHeight +
            _categoryHeight);
      }
    }

    for (int i = 0; i < categories.length; i++) {
      listTabCategory
          .add(TabCategory(category: categories[i], selected: (i == 0)));
    }
    setState(() {
      _foodAndDrinks = cenaProducts;
      _isLoading = false;
      _categories = categories;
      _listTabCategory = listTabCategory;
      _tabCategoryController = TabController(
          vsync: this, length: _categories.length, initialIndex: 0);
      _tabCategoryController.addListener(_handleTabSelection);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _getProductsOfStore();
    setState(() {});
  }

  _handleTabSelection() {
    if (_tabCategoryController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Column(
            children: const [
              CenaShimmer(),
              SizedBox(height: 5),
              CenaShimmer(),
              SizedBox(height: 5),
              CenaShimmer()
            ],
          )
        : Column(
            children: [
              Container(
                color: Colors.white,
                child: _listTabCategory.isNotEmpty
                    ? TabBar(
                        controller: _tabCategoryController,
                        isScrollable: true,
                        tabs: _listTabCategory
                            .map((e) => _TabCategoryWidget(
                                category: e.category, selected: e.selected))
                            .toList(),
                      )
                    : const SizedBox(),
              ),
              ListView.builder(
                itemCount: _categories.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, i) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 1.0),
                    Container(
                      height: _categoryHeight,
                      width: MediaQuery.of(context).size.width,
                      child: CenaTextGroup(
                        text: _categories[i],
                        // color: CenaColors.,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 1,
                              mainAxisExtent: 100),
                      itemCount: _foodAndDrinks
                          .where(
                              (element) => _categories[i] == element.category)
                          .length,
                      itemBuilder: (_, j) => Container(
                        decoration: BoxDecoration(
                            color: Colors.blue, //CenaColors.WHITE,
                            borderRadius: BorderRadius.circular(1.0)),
                        child: GestureDetector(
                          onTap: () => {},
                          child: Container(
                            color: Colors.indigo,
                            child: FoodRow(
                              product: _foodAndDrinks
                                  .where((element) =>
                                      _categories[i] == element.category)
                                  .elementAt(j),
                              storeId: widget.store.id,
                              discount: 10,
                              like: 100,
                              sale: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

class TabCategory {
  String category;
  bool selected;
  TabCategory({required this.category, required this.selected});
}

class _TabCategoryWidget extends StatelessWidget {
  final bool selected;
  final String category;
  const _TabCategoryWidget(
      {Key? key, required this.category, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ));
  }
}

class TabButton extends StatelessWidget {
  final String text;
  final int selectedPage;
  final int pageNumber;
  final VoidCallback onPressed;
  const TabButton(
      {Key? key,
      required this.text,
      required this.selectedPage,
      required this.pageNumber,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          // color:
          //     selectedPage == pageNumber ? kPrimaryColor : Colors.transparent,
          border: selectedPage == pageNumber
              ? const Border(
                  bottom: BorderSide(color: CenaColors.primary),
                )
              : null,
        ),
        padding: EdgeInsets.symmetric(
          vertical: selectedPage == pageNumber ? 10 : 0,
          horizontal: selectedPage == pageNumber ? 16 : 0,
        ),
        margin: EdgeInsets.symmetric(
          vertical: selectedPage == pageNumber ? 0 : 10,
          horizontal: selectedPage == pageNumber ? 0 : 16,
        ),
        child: Text(
          text,
          style: TextStyle(
            color:
                selectedPage == pageNumber ? CenaColors.primary : Colors.black,
          ),
        ),
      ),
    );
  }
}
