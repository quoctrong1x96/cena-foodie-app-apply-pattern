part of '../widgets.dart';

class CenaImageSlide extends StatefulWidget {
  const CenaImageSlide({Key? key}) : super(key: key);

  @override
  _SlideImages createState() => _SlideImages();
}

class _SlideImages extends State<CenaImageSlide> {
  int currentPage = 0;

  List<Map<String, String>> storeImage = [
    {"image": "assets/images/store/milktea1.jpg"},
    {"image": "assets/images/store/milktea2.jpg"},
    {"image": "assets/images/store/milktea3.jpg"},
    {"image": "assets/images/store/milktea4.jpg"},
    {"image": "assets/images/store/milktea5.jpg"},
    {"image": "assets/images/store/milktea6.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: storeImage.length,
              itemBuilder: (context, index) =>
                  CenaImageReview(storeImage[index]["image"]!),
            ),
          ),
          // _buildPreviousButton(),
        ],
      ),
    );
  }

  // Widget _buildPreviousButton() {
  //   return Positioned(
  //     top: 80,
  //     right: 10,
  //     child: SizedBox(
  //       width: 40,
  //       height: 40,
  //       // ignore: deprecated_member_use
  //       child: FlatButton(
  //         padding: EdgeInsets.zero,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //             topRight: Radius.circular(8),
  //             bottomLeft: Radius.circular(8),
  //           ),
  //         ),
  //         child: Icon(
  //           Feather.arrow_left_circle,
  //           size: 21,
  //           color: AppColors.LIGHT_GREY,
  //         ),
  //         onPressed: () => {},
  //       ),
  //     ),
  //   );
  // }
}
