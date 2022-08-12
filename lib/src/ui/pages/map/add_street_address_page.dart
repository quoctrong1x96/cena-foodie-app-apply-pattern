// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:group_button/group_button.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../../blocs/my_location/my_location_map_bloc.dart';
// import '../..//ui/blocs/user/user_bloc.dart';
// import '../../../utils/configs/cena_colors.dart';
// import '../../configs/cena_paddings.dart';
// import '../../../utils/helpers/helpers.dart';
// import '../../widgets/animation_route.dart';
// import '../../widgets/snackbars/cena_snackbar_toast.dart';
// import '../../widgets/widgets.dart';
// import '../profile/list_addresses_page.dart';
// import 'map_address_page.dart';

// class AddStreetAddressPage extends StatefulWidget {
//   const AddStreetAddressPage({Key? key}) : super(key: key);

//   @override
//   _AddStreetAddressPageState createState() => _AddStreetAddressPageState();
// }

// class _AddStreetAddressPageState extends State<AddStreetAddressPage> {
//   late TextEditingController _receiverAddressController;
//   late TextEditingController _receiverNumberAddressController;
//   late TextEditingController _buildingAddressController;
//   late TextEditingController _doorAddressController;
//   late TextEditingController _noteAddressController;
//   late GroupButtonController _groupButtonController;
//   final _keyForm = GlobalKey<FormState>();

//   @override
//   void initState() {
//     getPersonalInformation();
//     super.initState();
//   }

//   Future<void> getPersonalInformation() async {
//     final userBloc = BlocProvider.of<UserBloc>(context).state.user!;

//     _receiverAddressController = TextEditingController(
//         text: "${userBloc.firstName}  ${userBloc.lastName}");
//     _receiverNumberAddressController =
//         TextEditingController(text: userBloc.phone);

//     _buildingAddressController = TextEditingController();
//     _doorAddressController = TextEditingController();
//     _noteAddressController = TextEditingController();
//     _groupButtonController = GroupButtonController();
//   }

//   @override
//   void dispose() {
//     _receiverAddressController.clear();
//     _receiverAddressController.dispose();
//     _buildingAddressController.clear();
//     _buildingAddressController.dispose();
//     _receiverNumberAddressController.clear();
//     _receiverNumberAddressController.dispose();
//     _doorAddressController.clear();
//     _doorAddressController.dispose();
//     _noteAddressController.clear();
//     _noteAddressController.dispose();

//     super.dispose();
//   }

//   void func(String? string) {}

//   @override
//   Widget build(BuildContext context) {
//     final myLocationBloc = BlocProvider.of<MyLocationMapBloc>(context);

//     double screenWidth = MediaQuery.of(context).size.width;

//     return BlocListener<UserBloc, UserState>(
//       listener: (context, state) {
//         if (state is LoadingUserState) {
//           modalLoading(context);
//         } else if (state is SuccessUserState) {
//           Navigator.pop(context);
//           cenaToastSuccess("Address added successfully");
//           Navigator.pop(context);
//           Navigator.pushReplacement(
//               context, routeCena(page: const ListAddressesPage()));
//         } else if (state is FailureUserState) {
//           Navigator.pop(context);
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content:
//                   CenaTextDescription(text: state.error, color: Colors.white),
//               backgroundColor: Colors.red));
//         }
//       },
//       child: Scaffold(
//         backgroundColor: CenaColors.GREY,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: const CenaTextAppbar(text: 'New Address'),
//           centerTitle: true,
//           elevation: 0,
//           leading: InkWell(
//             onTap: () => Navigator.pop(context),
//             child: Row(
//               children: const [
//                 SizedBox(width: 10.0),
//                 Icon(Icons.arrow_back, color: CenaColors.primary),
//               ],
//             ),
//           ),
//         ),
//         body: SafeArea(
//           child: Form(
//             key: _keyForm,
//             child: ListView(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 5.0),
//                 CenaButtonLineText(
//                   text: "",
//                   labelWidth: screenWidth - 4 * AppConstants.padding_left,
//                   textOverflow: TextOverflow.ellipsis,
//                   label: myLocationBloc.state.addressName == ""
//                       ? "Address in map"
//                       : myLocationBloc.state.addressName,
//                   onPressed: _openMap,
//                   fontSize: 14,
//                 ),
//                 const SizedBox(height: 5.0),
//                 CenaInputNoLabelBox(
//                   hintText: "Receiver",
//                   textEditingController: _receiverAddressController,
//                 ),
//                 const SizedBox(height: 1),
//                 CenaInputNoLabelBox(
//                   hintText: "Receiver's phone number",
//                   textEditingController: _receiverNumberAddressController,
//                 ),

//                 const SizedBox(height: 1),
//                 CenaInputNoLabelBox(
//                   hintText: "Building, floor (option)",
//                   textEditingController: _buildingAddressController,
//                 ),
//                 const SizedBox(height: 1),
//                 CenaInputNoLabelBox(
//                   hintText: "Door (option)",
//                   textEditingController: _doorAddressController,
//                 ),
//                 const SizedBox(height: 5.0),
//                 CenaGroupRadio(
//                     options: const ["Nhà ở", "Nhà trọ", "Công ty", "Khác"],
//                     controller: _groupButtonController),
//                 const SizedBox(height: 5.0),
//                 CenaInputNoLabelBox(
//                   hintText: "Note for shipper & store (option)",
//                   textEditingController: _noteAddressController,
//                   maxLines: 5,
//                 ),
//                 CenaButton(
//                   text: "Lưu",
//                   height: 40,
//                   onPressed: _buttonSave,
//                 ),

//                 // SizedBox(height: 20.0),
//                 // TextCena(text: 'Location'),
//                 // SizedBox(height: 5.0),
//                 // InkWell(
//                 //   onTap:
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _buttonSave() {
//     final myLocationBloc = BlocProvider.of<MyLocationMapBloc>(context);
//     if (_keyForm.currentState!.validate()) {
//       final userBloc = BlocProvider.of<UserBloc>(context);
//       userBloc.add(OnAddNewAddressEvent(
//           userBloc.state.user!.uid!,
//           _groupButtonController.selectedIndex!.toString(),
//           _receiverAddressController.text.trim(),
//           _receiverNumberAddressController.text.trim(),
//           _buildingAddressController.text.trim(),
//           _doorAddressController.text.trim(),
//           _noteAddressController.text.trim(),
//           myLocationBloc.state.addressName,
//           myLocationBloc.state.locationCentral!));
//     }
//   }

//   void _openMap() async {
//     final permissionGPS = await Permission.location.isGranted;
//     final gpsActive = await Geolocator.isLocationServiceEnabled();

//     if (permissionGPS && gpsActive) {
//       Navigator.push(context,
//           navigatorPageFadeInCena(context, const MapLocationAddressPage()));
//     } else {
//       Navigator.pop(context);
//     }
//   }
// }
