import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../blocs/product/product_bloc.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../controllers/products_controller.dart';
import '../../../models/response/products_top_home_response.dart';
import '../../../services/url.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/cena_bottom_avigation.dart';
import '../../../widgets/widgets.dart';
import '../client_home_page.dart';
import '../detail_product/details_product_page.dart';

class SearchClientPage extends StatefulWidget {
  const SearchClientPage({Key? key}) : super(key: key);

  @override
  _SearchClientPageState createState() => _SearchClientPageState();
}

class _SearchClientPageState extends State<SearchClientPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.clear();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductsBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      final userBloc = BlocProvider.of<UserBloc>(context);
                      if (userBloc.state.address == null) {
                        userBloc.add(OnInitialCurrentAddressEvent(
                            userBloc.state.user!.uid!,
                            userBloc.state.user!.firstName! +
                                " " +
                                userBloc.state.user!.lastName!,
                            userBloc.state.user!.phone!));
                      }
                      Navigator.pushReplacement(
                          context, routeCena(page: const ClientHomePage()));
                    },
                    child: const SizedBox(
                      height: 44,
                      child: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 44,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8.0)),
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: (value) {
                          productBloc.add(OnSearchProductEvent(value));
                          if (value.isNotEmpty) {
                            productController.searchProductsForName(value);
                          }
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search products',
                            hintStyle: GoogleFonts.getFont('Inter',
                                color: Colors.grey)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              BlocBuilder<ProductsBloc, ProductsState>(
                builder: (_, state) => Expanded(
                    child: (state.searchProduct.isNotEmpty)
                        ? listProducts()
                        : _HistorySearch()),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationCena(1),
    );
  }

  Widget listProducts() {
    return StreamBuilder<List<FoodAndDrink>>(
        stream: productController.searchProducts,
        builder: (context, snapshot) {
          if (snapshot.data == null) return _HistorySearch();

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.isEmpty) {
            return ListTile(
              title: CenaTextDescription(
                  text: 'Without results for ${_searchController.text}'),
            );
          }

          final listProduct = snapshot.data!;

          return _ListProductSearch(listProduct: listProduct);
        });
  }
}

class _ListProductSearch extends StatelessWidget {
  final List<FoodAndDrink> listProduct;

  const _ListProductSearch({required this.listProduct});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listProduct.length,
        itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    routeCena(
                        page: DetailsProductPage(
                            product: listProduct[i], storeId: 1))),
                child: Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(
                    children: [
                      Container(
                        width: 90,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                scale: 8,
                                image: CachedNetworkImageProvider(
                                    URLS.BASE_URL + listProduct[i].picture))),
                      ),
                      const SizedBox(width: 5.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CenaTextDescription(
                                text: listProduct[i].nameProduct),
                            const SizedBox(height: 5.0),
                            CenaTextDescription(
                                text: '\$ ${listProduct[i].price}',
                                color: Colors.grey),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}

class _HistorySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CenaTextDescription(
            text: 'RECENT SEARCH', fontSize: 16, color: Colors.grey),
        SizedBox(height: 10.0),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          minLeadingWidth: 20,
          leading: Icon(Icons.history),
          title: CenaTextDescription(text: 'Burger', color: Colors.grey),
        )
      ],
    );
  }
}
