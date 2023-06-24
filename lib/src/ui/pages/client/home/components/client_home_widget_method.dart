part of './client_home_body.dart';

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
