import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../configs/cena_colors.dart';
import '../../../controllers/category_controller.dart';
import '../../../generated/l10n.dart';
import '../../../models/response/category_all_response.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/widgets.dart';
import '../../Admin/Category/add_category_admin_page.dart';
import '../../Admin/Category/update_category_admin_page.dart';

class CategoriesAdminPage extends StatelessWidget {
  final int storeId;
  const CategoriesAdminPage(this.storeId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Scaffold(
      backgroundColor: CenaColors.WHITE,
      appBar: CenaAppbarDefault(
        centerTitle: true,
        leading: const CenaButtonDefaultBack(),
        title: lang.admin_category_title,
        actions: [
          TextButton(
              onPressed: () => Navigator.push(
                  context, routeCena(page: AddCategoryAdminPage(storeId))),
              child: CenaTextDescription(
                  text: lang.admin_category_button_add,
                  color: CenaColors.WHITE,
                  fontSize: 16))
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          physics: const BouncingScrollPhysics(),
          children: [
            FutureBuilder<List<Category>>(
                future: categoryController.getAllCategories(storeId),
                builder: (context, snapshot) => !snapshot.hasData
                    ? Center(
                        child: Column(
                          children: [
                            const CircularProgressIndicator(),
                            CenaTextDescription(
                                text: lang.admin_category_loading)
                          ],
                        ),
                      )
                    : _ListCategories(listCategory: snapshot.data!)),
          ],
        ),
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {
  final List<Category> listCategory;

  const _ListCategories({required this.listCategory});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    List<String> myOptionCategory = [
      lang.admin_category_common,
      lang.admin_category_store
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: myOptionCategory.length,
          shrinkWrap: true,
          itemBuilder: (_, i) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Container(
                color: CenaColors.WHITE,
                child: CenaTextGroup(
                  text: myOptionCategory[i],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 1,
                      mainAxisExtent: 50),
                  itemCount: listCategory.where((element) {
                    return (i == 0 && element.storeId == i) ||
                        (i != 0 && element.storeId != 0);
                  }).length,
                  itemBuilder: (_, j) {
                    Category gridCategory = listCategory.where((element) {
                      return (i == 0 && element.storeId == i) ||
                          (i != 0 && element.storeId != 0);
                    }).elementAt(j);
                    return Container(
                      decoration: BoxDecoration(
                          color: CenaColors.WHITE,
                          borderRadius: BorderRadius.circular(1.0)),
                      child: GestureDetector(
                        onTap: gridCategory.storeId != 0
                            ? () => {
                                  Navigator.push(
                                      context,
                                      routeCena(
                                          page: UpdateCategoryAdminPage(
                                              gridCategory)))
                                }
                            : () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(FontAwesomeIcons.intercom),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CenaTextDescription(
                                        text: gridCategory.category),
                                    CenaTextDescription(
                                      text: gridCategory.description,
                                      fontSize: 12,
                                      textWidth:
                                          MediaQuery.of(context).size.width -
                                              90,
                                      textOverflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            gridCategory.storeId != 0
                                ? const Icon(
                                    FontAwesomeIcons.angleRight,
                                    size: 17,
                                  )
                                : const SizedBox(width: 10)
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
