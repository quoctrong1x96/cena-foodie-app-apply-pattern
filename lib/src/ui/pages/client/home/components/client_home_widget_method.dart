part of './client_home_body.dart';

InkWell _buildCartButton(BuildContext context) {
  return InkWell(
    onTap: () => NavigationUtils.push(context, RouteConstants.cart_client),
    child: Stack(
      children: [
        const Icon(Icons.shopping_bag_outlined, size: 30),
        Positioned(
          right: 0,
          bottom: 5,
          child: Container(
              height: 20,
              width: 15,
              decoration: const BoxDecoration(
                  color: Color(0xff0C6CF2), shape: BoxShape.circle),
              child: Center(
                  child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) => CenaTextDescription(
                          text: state.quantityCart.toString(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)))),
        ),
      ],
    ),
  );
}

Row _buildUserInformation(AuthBloc authBloc, BuildContext context) {
  return Row(
    children: [
      Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(ImagesUltils.getImageApiUrl(
                    authBloc.state.user!.image.toString())))),
      ),
      const SizedBox(width: 8.0),
      CenaTextDescription(
          text: CenaDate.getDateCena(context) +
              ', ${authBloc.state.user!.lastName.toUpperCase()}',
          fontSize: 17,
          color: CenaColors.secondary),
    ],
  );
}

Container _buildQuestion(S lang) {
  return Container(
      padding: const EdgeInsets.only(right: 50.0),
      child: CenaTextDescription(
          text: lang.client_home_question,
          fontSize: 28,
          maxLine: 2,
          fontWeight: FontWeight.w500));
}

GestureDetector _buildAddress(BuildContext context, S lang) {
  return GestureDetector(
    onTap: () => NavigationUtils.push(context, RouteConstants.client_address),
    child: Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(15.0)),
          child: const Icon(Icons.place_outlined,
              size: 38, color: CenaColors.primary),
        ),
        const SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CenaTextDescription(text: lang.client_home_address_title),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CenaTextDescription(
                    text: (state.address != null)
                        ? state.address!.receiver!.name! +
                            " - " +
                            state.address!.receiver!.phoneNumber!
                        : "No body",
                  ),
                  CenaTextDescription(
                    text: (state.address != null)
                        ? state.address!.detail!
                        : lang.client_home_without_address,
                    color: CenaColors.primary,
                    fontSize: 17,
                    textOverflow: TextOverflow.ellipsis,
                    textWidth: 250,
                    maxLine: 1,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}

FutureBuilder<UiResponse<List<Category>>> _buildCategory(
    ICategoryService _categoryService) {
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
    },
  );
}
