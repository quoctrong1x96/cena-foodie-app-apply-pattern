// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../ui/blocs/user/user_bloc.dart';
// import '../../../../utils/configs/cena_colors.dart';
// import '../../../generated/l10n.dart';
// import '../../../../utils/helpers/helpers.dart';
// import '../../../widgets/animation_route.dart';
// import '../../../widgets/snackbars/cena_snackbar_toast.dart';
// import '../../../widgets/widgets.dart';
// import '../edit_profile_page.dart';

// class EditProfileImagePage extends StatefulWidget {
//   const EditProfileImagePage({Key? key}) : super(key: key);

//   @override
//   _EditProfileImagePageState createState() => _EditProfileImagePageState();
// }

// class _EditProfileImagePageState extends State<EditProfileImagePage> {
//   final _keyForm = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final lang = S.of(context);
//     return BlocListener<UserBloc, UserState>(
//       listener: (context, state) {
//         if (state is LoadingUserState) {
//           modalLoading(context);
//         } else if (state is SuccessUserState) {
//           cenaToastSuccess(lang.avatar_change_success);
//           Navigator.pop(context);
//           Navigator.pop(context);
//           Navigator.pop(context);
//           Navigator.pushReplacement(
//               context, routeCena(page: const EditProfilePage()));
//         } else if (state is FailureUserState) {
//           Navigator.pop(context);
//           errorMessageSnack(context, state.error);
//         }
//       },
//       child: Scaffold(
//         backgroundColor: CenaColors.LIGHT_GREY,
//         appBar: AppBar(
//           title: CenaTextAppbar(text: lang.avatar_title),
//           backgroundColor: CenaColors.LIGHT_GREY,
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
//               key: _keyForm,
//               child: ListView(
//                 physics: const BouncingScrollPhysics(),
//                 children: [
//                   const SizedBox(height: 10),
//                   CenaButtonLineImage(
//                     text: lang.avatar_change_avatar,
//                     onPressed: _changeProfileImages,
//                   ),
//                 ],
//               )),
//         ),
//       ),
//     );
//   }

//   void _changeProfileImages() {
//     final userBloc = BlocProvider.of<UserBloc>(context);
//     final ImagePicker _picker = ImagePicker();
//     modalPictureRegister(
//         ctx: context,
//         onPressedChange: () async {
//           Navigator.pop(context);
//           final XFile? imagePath = await _picker.pickImage(
//               source: ImageSource.gallery, imageQuality: 50);
//           if (imagePath != null) {
//             userBloc.add(OnChangeImageProfileEvent(
//                 userBloc.state.user!.uid!, imagePath.path));
//           }
//         },
//         onPressedTake: () async {
//           Navigator.pop(context);
//           final XFile? photoPath = await _picker.pickImage(
//               source: ImageSource.camera, imageQuality: 50);
//           if (photoPath != null) {
//             userBloc.add(OnChangeImageProfileEvent(
//                 userBloc.state.user!.uid!, photoPath.path));
//           }
//         });
//   }
// }
