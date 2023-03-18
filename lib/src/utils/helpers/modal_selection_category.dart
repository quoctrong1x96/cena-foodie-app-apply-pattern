part of 'helpers.dart';

void modalSelectionCategory(
  BuildContext ctx,
  int storeId,
  ICategoryService categoryService,
) {
  showModalBottomSheet(
    context: ctx,
    barrierColor: Colors.black26,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))),
    builder: (ctx) => Container(
      height: 470,
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(ctx).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 4,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.grey[300]),
            ),
          ),
          const SizedBox(height: 20.0),
          const CenaTextDescription(
              text: 'Select Category',
              fontWeight: FontWeight.w500,
              fontSize: 19),
          const SizedBox(height: 10.0),
          Expanded(
              child: FutureBuilder<UiResponse<List<Category>>>(
                  future: categoryService.fetchAllByStore(storeId: storeId),
                  builder: (_, snapshot) {
                    return !snapshot.hasData
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            height: 350,
                            child: ListView.builder(
                              itemCount: snapshot.data!.data!.length,
                              itemBuilder: (context, i) => InkWell(
                                onTap: () =>
                                    BlocProvider.of<ProductsBloc>(context).add(
                                        OnSelectCategoryEvent(
                                            snapshot.data!.data![i].id,
                                            snapshot.data!.data![i].category)),
                                child: Container(
                                  height: 40,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: CenaColors.primary,
                                                    width: 3.5),
                                                borderRadius:
                                                    BorderRadius.circular(6.0)),
                                          ),
                                          const SizedBox(width: 10.0),
                                          CenaTextDescription(
                                              text: snapshot
                                                  .data!.data![i].category)
                                        ],
                                      ),
                                      BlocBuilder<ProductsBloc, ProductsState>(
                                        builder: (context, state) =>
                                            state.idCategory ==
                                                    snapshot.data!.data![i].id
                                                ? const Icon(Icons.check)
                                                : Container(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                  }))
        ],
      ),
    ),
  );
}
