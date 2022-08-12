// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../../../utils/helpers/helpers.dart';
// import '../..//ui/blocs/user/user_bloc.dart';
// import '../../../utils/configs/cena_colors.dart';
// import '../../configs/cena_margins.dart';
// import '../../configs/cena_paddings.dart';
// import '../../controllers/user_controller.dart';
// import '../../resources/generated/l10n.dart';
// import '../../models/response/addresses_response.dart';
// import '../../widgets/animation_route.dart';
// import '../../widgets/widgets.dart';
// import '../map/add_street_address_page.dart';

// class ListAddressesPage extends StatefulWidget {
//   final bool isSelectAddress;
//   const ListAddressesPage({this.isSelectAddress = false, Key? key})
//       : super(key: key);

//   @override
//   _ListAddressesPageState createState() => _ListAddressesPageState();
// }

// class _ListAddressesPageState extends State<ListAddressesPage>
//     with WidgetsBindingObserver {
//   @override
//   void initState() {
//     WidgetsBinding.instance!.addObserver(this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance!.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) async {
//     if (state == AppLifecycleState.resumed) {
//       if (await Permission.location.isGranted) {
//         Navigator.push(context, routeCena(page: const AddStreetAddressPage()));
//       }
//     }
//   }

//   void accessLocation(PermissionStatus status) {
//     switch (status) {
//       case PermissionStatus.granted:
//         Navigator.push(context, routeCena(page: const AddStreetAddressPage()));
//         break;
//       case PermissionStatus.limited:
//         break;
//       case PermissionStatus.denied:
//       case PermissionStatus.restricted:
//       case PermissionStatus.permanentlyDenied:
//         openAppSettings();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final lang = S.of(context);
//     return BlocListener<UserBloc, UserState>(
//       listener: (context, state) {
//         if (state is LoadingUserState) {
//           modalLoading(context);
//         } else if (state is SuccessUserState) {
//           Navigator.pop(context);
//         } else if (state is FailureUserState) {
//           Navigator.pop(context);
//           errorMessageSnack(context, state.error);
//         }
//       },
//       child: Scaffold(
//         backgroundColor: CenaColors.LIGHT_GREY,
//         appBar: CenaAppbarDefault(
//             title: lang.client_address_title,
//             leading: const CenaButtonDefaultBack(),
//             actions: [
//               TextButton(
//                   onPressed: () async =>
//                       accessLocation(await Permission.location.request()),
//                   child: CenaTextDescription(
//                       text: lang.client_address_button_add,
//                       color: CenaColors.WHITE,
//                       fontSize: 17)),
//             ]),
//         body: FutureBuilder<List<ListAddress>?>(
//             future: userController.getAddresses(
//                 BlocProvider.of<UserBloc>(context).state.user!.uid!),
//             builder: (context, snapshot) => (!snapshot.hasData)
//                 ? const CenaShimmer()
//                 : _ListAddresses(
//                     isSelectAddress: widget.isSelectAddress,
//                     listAddress: snapshot.data!)),
//       ),
//     );
//   }
// }

// class _ListAddresses extends StatelessWidget {
//   final List<ListAddress> listAddress;
//   final bool isSelectAddress;
//   const _ListAddresses(
//       {this.isSelectAddress = false, Key? key, required this.listAddress})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final userBloc = BlocProvider.of<UserBloc>(context);
//     final lang = S.of(context);
//     return (listAddress.isNotEmpty)
//         ? ListView.builder(
//             itemCount: listAddress.length,
//             itemBuilder: (_, i) => Dismissible(
//                   key: Key(listAddress[i].id.toString()),
//                   direction: DismissDirection.endToStart,
//                   background: Container(),
//                   confirmDismiss: (DismissDirection direction) async {
//                     return await showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: CenaTextDescription(
//                               text: lang.client_address_dialog_title),
//                           content: CenaTextDescription(
//                               text: lang.client_address_dialog_message),
//                           actions: <Widget>[
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 70.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   InkWell(
//                                       onTap: () =>
//                                           Navigator.of(context).pop(false),
//                                       child: CenaTextDescription(
//                                         text: lang.client_address_dialog_no,
//                                         fontSize: 16,
//                                         color: CenaColors.primary,
//                                       )),
//                                   InkWell(
//                                     onTap: () =>
//                                         Navigator.of(context).pop(true),
//                                     child: CenaTextDescription(
//                                       text: lang.client_address_dialog_yes,
//                                       fontSize: 16,
//                                       color: CenaColors.secondary,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   onDismissed: (direction) => userBloc.add(
//                       OnDeleteStreetAddressEvent(userBloc.state.user!.uid!,
//                           listAddress[i].id.toString())),
//                   secondaryBackground: Container(
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.only(
//                         right: AppConstants.padding_right),
//                     margin: const EdgeInsets.only(top: CenaMargins.topButton),
//                     decoration: const BoxDecoration(
//                         color: Color.fromARGB(255, 243, 25, 189)),
//                     child: const Icon(Icons.delete_sweep_rounded,
//                         color: Colors.white, size: 38),
//                   ),
//                   child: Container(
//                     height: 96,
//                     width: MediaQuery.of(context).size.width,
//                     margin: const EdgeInsets.only(top: CenaMargins.topButton),
//                     decoration: BoxDecoration(color: CenaColors.WHITE),
//                     child: _buildAddressLine(
//                         isSelectAddress, listAddress[i], userBloc, context),
//                   ),
//                 ))
//         : _WithoutListAddress();
//   }

//   Widget _buildAddressLine(bool isSelectAddres, ListAddress address,
//       UserBloc userBloc, BuildContext context) {
//     late Icon icon;
//     late String text;

//     switch (address.type) {
//       case 0:
//         icon = const Icon(
//           Icons.home,
//           color: CenaColors.secondary,
//           size: 16,
//         );
//         text = " Nhà ở";
//         break;
//       case 1:
//         icon = const Icon(
//           Icons.house,
//           color: CenaColors.secondary,
//           size: 16,
//         );
//         text = " Nhà trọ";
//         break;
//       case 2:
//         icon = const Icon(Icons.shopping_bag,
//             color: CenaColors.secondary, size: 16);
//         text = " Công ty";
//         break;
//       case 3:
//         icon = const Icon(Icons.archive, color: CenaColors.secondary, size: 16);
//         text = " Khác";
//         break;
//       default:
//         icon = const Icon(Icons.home, color: CenaColors.secondary, size: 16);
//         text = " Nhà ở";
//     }
//     return GestureDetector(
//       onTap: () {
//         userBloc.add(OnSelectAddressButtonEvent(
//             cenaConvert.convertListAddressToAddress(address)));
//         if (isSelectAddress) {
//           Navigator.pop(context);
//         }
//       },
//       child: Row(
//         children: [
//           BlocBuilder<UserBloc, UserState>(
//               builder: (_, state) => (state.address!.id == address.id)
//                   ? const Icon(Icons.check_box_rounded,
//                       color: CenaColors.primary)
//                   : const Icon(Icons.check_box_outline_blank)),
//           Expanded(
//             child: Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: AppConstants.padding_all5,
//                       vertical: CenaPaddings.all10),
//                   child: Column(children: [
//                     Row(
//                       children: [
//                         icon,
//                         CenaTextDescription(
//                           text: text,
//                           color: CenaColors.secondary,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 16,
//                           textAlign: TextAlign.left,
//                         )
//                       ],
//                     ),
//                     Container(
//                       color: CenaColors.WHITE,
//                       height: 32,
//                       alignment: Alignment.topLeft,
//                       child: Column(
//                         children: [
//                           Flexible(
//                             child: CenaTextDescription(
//                               text: address.addressDetail!,
//                               fontSize: 14,
//                               maxLine: 2,
//                             ),
//                             flex: 3,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         CenaTextDescription(
//                           text: address.receiver! + " - " + address.phone!,
//                           textAlign: TextAlign.left,
//                           fontSize: 14,
//                           color: CenaColors.dartGrey,
//                         ),
//                       ],
//                     )
//                   ]),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//               height: 80,
//               width: 40,
//               child: TextButton(
//                 child: CenaTextDescription(
//                   text: S.of(context).client_address_button_edit,
//                   color: CenaColors.LIGHT_GREY,
//                   fontSize: 12,
//                 ),
//                 onPressed: () {},
//               ))
//         ],
//       ),
//     );
//   }
// }

// class _WithoutListAddress extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SvgPicture.asset('Assets/my-location.svg', height: 400),
//           CenaTextDescription(
//               text: S.of(context).client_address_without_address,
//               fontSize: 25,
//               fontWeight: FontWeight.w500,
//               color: CenaColors.secondary),
//           const SizedBox(height: 80),
//         ],
//       ),
//     );
//   }
// }
