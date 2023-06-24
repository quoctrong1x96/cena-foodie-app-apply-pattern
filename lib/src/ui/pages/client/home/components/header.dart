part of './components.dart';

class ClientHomeHeader extends StatelessWidget {
  const ClientHomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        profileButton(context),
        Expanded(child: searchButton()),
        callCenterButton(context),
        scannerButton(context),
        notificationButton(context),
        buildCartButton(context),
      ],
    );
  }

  Widget scannerButton(BuildContext context) {
    return Container(
      width: 30,
      alignment: Alignment.center,
      child: SizedBox.fromSize(
        size: const Size(25, 25),
        child: ClipOval(
          child: Material(
            child: InkWell(
              onTap: () => {},
              child: Image.asset(
                'Assets/icons/scanner.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget notificationButton(BuildContext context) {
    return Container(
      width: 30,
      alignment: Alignment.center,
      child: SizedBox.fromSize(
        size: const Size(30, 30),
        child: ClipOval(
          child: Material(
            child: InkWell(
              onTap: () => {},
              child: const Icon(FontAwesomeIcons.bell),
            ),
          ),
        ),
      ),
    );
  }

  Widget callCenterButton(BuildContext context) {
    return Container(
      width: 30,
      alignment: Alignment.center,
      child: SizedBox.fromSize(
        size: const Size(20, 20),
        child: ClipOval(
          child: Material(
            child: InkWell(
              onTap: () => {},
              child: Image.asset('Assets/icons/headphone.png'),
            ),
          ),
        ),
      ),
    );
  }

  Widget searchButton() {
    return InkWell(
      onTap: () => {},
      child: CenaFormField(
        minHeight: 40,
        controller: TextEditingController(),
        width: 100,
        prefixIcon: FontAwesomeIcons.magnifyingGlass,
        hintText: "Search",
      ),
    );
  }

  Widget profileButton(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Container(
      alignment: Alignment.center,
      width: 40,
      child: SizedBox.fromSize(
        size: const Size(30, 30),
        child: ClipOval(
          child: Material(
            color: Theme.of(context).primaryColorLight,
            child: InkWell(
              onTap: () => {},
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        ImagesUltils.getImageApiUrl(
                          authBloc.state.user!.image.toString(),
                        ),
                      ),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildCartButton(BuildContext context) {
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
}
