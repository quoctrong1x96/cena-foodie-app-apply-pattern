part of '../widgets.dart';

class CenaImageReview extends StatelessWidget {
  const CenaImageReview(this.image, {Key? key}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              )),
        )
      ],
    );
  }
}
