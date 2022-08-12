part of '../widgets.dart';

class CenaImageCirclePicker extends StatelessWidget {
  final bool isEditImage;
  final ImagePicker _picker = ImagePicker();
  final double height;
  final String? image;
  CenaImageCirclePicker(this.isEditImage, this.height, this.image, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return SizedBox(
      height: height,
      width: height,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => isEditImage
            ? modalPictureRegister(
                ctx: context,
                onPressedChange: () async {
                  Navigator.pop(context);
                  final XFile? imagePath = await _picker.pickImage(
                      source: ImageSource.gallery, imageQuality: 50);
                  if (imagePath != null) {
                    userBloc.add(OnChangeImageProfileEvent(
                        userBloc.state.user!.id, imagePath.path));
                  }
                },
                onPressedTake: () async {
                  Navigator.pop(context);
                  final XFile? photoPath = await _picker.pickImage(
                      source: ImageSource.camera, imageQuality: 50);
                  if (photoPath != null) {
                    userBloc.add(OnChangeImageProfileEvent(
                        userBloc.state.user!.id, photoPath.path));
                  }
                })
            : {},
        child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) => image != null
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: height - 5 <= 0 ? 10 : height - 5,
                      width: height - 5 <= 0 ? 10 : height - 5,
                      decoration: BoxDecoration(
                          color: CenaColors.primary,
                          shape: BoxShape.circle,
                          image: image.toString() != ""
                              ? DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      ImagesUltils.getImageApiUrl(
                                          image.toString())),
                                  fit: BoxFit.cover)
                              : null),
                    ),
                  )
                : state.user?.image != null
                    ? Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: height - 5 <= 0 ? 10 : height - 5,
                          width: height - 5 <= 0 ? 10 : height - 5,
                          decoration: BoxDecoration(
                              color: CenaColors.primary,
                              shape: BoxShape.circle,
                              image: state.user!.image.toString() != ""
                                  ? DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          ImagesUltils.getImageApiUrl(
                                              state.user!.image.toString())),
                                      fit: BoxFit.cover)
                                  : null),
                        ),
                      )
                    : const CircularProgressIndicator()),
      ),
    );
  }
}
