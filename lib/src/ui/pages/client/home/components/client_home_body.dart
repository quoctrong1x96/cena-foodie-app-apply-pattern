import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/app_locator.dart';
import '../../../../../data/models/entities/address/address.dart';
import '../../../../../data/models/entities/category/category.dart';
import '../../../../../data/models/entities/store/store.dart';
import '../../../../../data/models/ui/page_arguments.dart';
import '../../../../../data/models/ui/ui_response.dart';
import '../../../../../data/services/entities/category_service.dart';
import '../../../../../data/services/entities/store_service.dart';
import '../../../../../utils/configs/cena_colors.dart';
import '../../../../../utils/constants/route_constants.dart';
import '../../../../../utils/helpers/date.dart';
import '../../../../../utils/image_ultils.dart';
import '../../../../../utils/navigation_utils.dart';
import '../../../../blocs/auth/auth_bloc.dart';
import '../../../../blocs/cart/cart_bloc.dart';
import '../../../../blocs/client_store/client_store_bloc.dart';
import '../../../../blocs/user/user_bloc.dart';
import '../../../../resources/generated/l10n.dart';
import '../../../../widgets/cena_bottom_avigation.dart';
import '../../../../widgets/row/cena_row_store.dart';
import '../../../../widgets/widgets.dart';

part './client_home_widget_method.dart';

class ClientHomeBody extends StatefulWidget {
  const ClientHomeBody({Key? key}) : super(key: key);

  @override
  State<ClientHomeBody> createState() => _ClientHomeBodyState();
}

class _ClientHomeBodyState extends State<ClientHomeBody> {
  final ScrollController _scrollController = ScrollController();
  final _categoryService = locator<ICategoryService>();

  List<Store> stores = [];
  bool _isLoading = false, _allLoaded = false;
  final int storesPerLoading = 7;

  @override
  void initState() {
    super.initState();
    storeFetchPerPage();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        storeFetchPerPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final lang = S.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildUserInformation(authBloc, context),
                _buildCartButton(context)
              ],
            ),
            const SizedBox(height: 20.0),
            _buildQuestion(lang),
            const SizedBox(height: 20.0),
            _buildAddress(context, lang),
            const SizedBox(height: 20.0),
            _buildCategory(_categoryService),
            const SizedBox(height: 20.0),
            _buildListStore(stores),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationCena(0),
    );
  }

  Widget _buildListStore(List<Store> stores) {
    return Column(children: [
      LayoutBuilder(builder: (context, constraints) {
        if (stores.isEmpty) {
          return Column(
            children: const [
              CenaRowStoreShimmer(),
              SizedBox(height: 10.0),
              CenaRowStoreShimmer(),
              SizedBox(height: 10.0),
              CenaRowStoreShimmer(),
              SizedBox(height: 10.0),
              CenaRowStoreShimmer(),
            ],
          );
        } else {
          final clientStoreBloc = BlocProvider.of<ClientStoreBloc>(context);
          return Stack(children: [
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    mainAxisExtent: 100),
                itemCount: stores.length + (_allLoaded ? 1 : 0),
                itemBuilder: (_, i) {
                  if (i < stores.length) {
                    return Container(
                        decoration: BoxDecoration(
                          color: CenaColors.DARK,
                        ),
                        child: CenaRowStore(
                          storeId: stores[i].id,
                          name: stores[i].storeName,
                          image: stores[i].image,
                          rating: 4.5,
                          space: double.parse(
                              double.parse((stores[i].distance!.toString()))
                                  .toStringAsFixed(2)),
                          time: 15,
                          voucher: "Store mới giảm 30%",
                          categories: stores[i].categories!,
                          onTab: () {
                            clientStoreBloc.add(OnOpenStoreEvent(stores[i]));
                            NavigationUtils.push(
                                context, RouteConstants.store_order,
                                args:
                                    PageArguments(data: {'stores': stores[i]}));
                          },
                        )

                        // GestureDetector(
                        //   onTap: () => {
                        //     //  Navigator.push(
                        //     //       context,
                        //     //       MaterialPageRoute(
                        //     //           builder: (_) =>
                        //     //               DetailsProductPage(product: listProduct![i])))
                        //   },
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Hero(
                        //           tag: stores![i].id!,
                        //           child: CenaImageCache(url:
                        //               ImagesUltils.get(stores[i].image),
                        //               height: 150)),
                        //       CenaTextDescription(
                        //           text: stores[i].storeName!,
                        //           textOverflow: TextOverflow.ellipsis,
                        //           fontWeight: FontWeight.w500,
                        //           color: CenaColors.primary,
                        //           fontSize: 19),
                        //       const SizedBox(height: 5.0),
                        //       const CenaTextDescription(
                        //           text: '100.000 vnđ',
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w500)
                        //     ],
                        //   ),
                        // ),
                        );
                  } else {
                    return SizedBox(
                      width: constraints.maxWidth,
                      height: 50,
                      child: const Center(
                        child:
                            CenaTextDescription(text: "Nothing more to load!"),
                      ),
                    );
                  }
                }),
            if (_isLoading) ...[
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    width: constraints.maxWidth,
                    height: 80,
                    child: const Center(child: CircularProgressIndicator()),
                  ))
            ]
          ]);
        }
      }),
    ]);
  }

  int whatIsPaginationOf(List<Store> stores) {
    if (stores.isEmpty) {
      return 0;
    } else {
      return ((stores.length + 1) / storesPerLoading).round();
    }
  }

  Future<void> storeFetchPerPage() async {
    final Address? address = BlocProvider.of<UserBloc>(context).state.address;
    if (_allLoaded) {
      return;
    }
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    final _storeService = locator<IStoreService>();
    UiResponse<List<Store>> list = await _storeService.getNearby(
        limit: storesPerLoading,
        offset: whatIsPaginationOf(stores) * storesPerLoading,
        lat: address!.latitude!,
        lng: address.longitude!);
    await Future.delayed(const Duration(milliseconds: 500));
    if (list.hasData) {
      for (var store in list.data!) {
        stores.add(store);
      }
    }
    if (mounted) {
      setState(() {
        _isLoading = false;
        _allLoaded = list.hasData;
      });
    }
  }
}
