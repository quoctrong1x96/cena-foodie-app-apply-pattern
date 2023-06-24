part of './components.dart';

class ClientHomeFeature extends StatefulWidget {
  const ClientHomeFeature({Key? key}) : super(key: key);

  @override
  State<ClientHomeFeature> createState() => _ClientHomeFeatureState();
}

class _ClientHomeFeatureState extends State<ClientHomeFeature> {
  final _categoryService = locator<ICategoryService>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UiResponse<List<Category>>>(
        future: _categoryService.fetchAllByStore(storeId: 0),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const CenaShimmer()
              : SizedBox(
                  height: 45,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, i) => InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => NavigationUtils.push(
                          context, RouteConstants.search_by_category),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10.0),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            color: const Color(0xff5469D4).withOpacity(.1),
                            borderRadius: BorderRadius.circular(25.0)),
                        child: CenaTextDescription(
                            text: snapshot.data!.data![i].category),
                      ),
                    ),
                  ),
                );
        });
  }
}
