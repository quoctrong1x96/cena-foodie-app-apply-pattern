// part of 'widgets.dart';

// class ManualMarketMap extends StatelessWidget {
//   const ManualMarketMap({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MyLocationMapBloc, MyLocationMapState>(
//         builder: (context, state) =>
//             (state.existsLocation) ? _buildStackMarket(context) : Container());
//   }

//   Widget _buildStackMarket(BuildContext context) {
//     final myLocationBloc = BlocProvider.of<MyLocationMapBloc>(context);

//     return Stack(
//       children: [
//         Positioned(
//           top: 50,
//           left: 20,
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   maxRadius: 20,
//                   backgroundColor: Colors.white,
//                   child: IconButton(
//                     icon: const Icon(Icons.arrow_back_ios_new_rounded,
//                         size: 20, color: CenaColors.primary),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   width: MediaQuery.of(context).size.width * .75,
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 11.0, horizontal: 8),
//                   margin: const EdgeInsets.only(left: 15.0),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.0),
//                       color: Colors.white,
//                       boxShadow: const [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 10,
//                             spreadRadius: -5)
//                       ]),
//                   child: BlocBuilder<MyLocationMapBloc, MyLocationMapState>(
//                       builder: (_, state) => CenaTextDescription(
//                           text: state.addressName,
//                           color: CenaColors.primary,
//                           fontSize: 17)),
//                 )
//               ],
//             ),
//           ),
//         ),
//         Center(
//           child: Transform.translate(
//               offset: const Offset(0, -15),
//               child: const CenaBounceInDown(
//                   child: Icon(Icons.location_on, size: 50))),
//         ),
//         Positioned(
//             bottom: 70,
//             left: 40,
//             child: MaterialButton(
//               padding: const EdgeInsets.symmetric(vertical: 15.0),
//               minWidth: MediaQuery.of(context).size.width - 80,
//               color: CenaColors.primary,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//               child: const CenaTextDescription(
//                 text: 'Confirm Address',
//                 color: Colors.white,
//                 fontSize: 17,
//               ),
//               onPressed: () {
//                 if (myLocationBloc.state.addressName != '') {
//                   Navigator.pushReplacement(
//                       context, routeCena(page: const AddStreetAddressPage()));
//                 }
//               },
//             ))
//       ],
//     );
//   }
// }
