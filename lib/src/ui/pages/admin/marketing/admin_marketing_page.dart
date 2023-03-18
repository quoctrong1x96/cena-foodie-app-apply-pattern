import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../widgets/animation_route.dart';
import '../../../widgets/widgets.dart';
import 'admin_voucher_manager_page.dart';

class AdminMarketingPage extends StatelessWidget {
  const AdminMarketingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://amber.edu.vn/wp-content/uploads/2019/09/descubra-o-que-e-marketing-e-saiba-como-aplica-lo-em-sua-empresa_22120191332560.png',
      'https://brandinfo.biz/smallimages/images/companies/brandinfo/marketing-la-gi.jpg',
      'https://www.feedough.com/wp-content/uploads/2020/08/what-is-marketing.png',
      'https://cache.digistar.vn/wp-content/uploads/2018/02/marketing-online-la-gi-trong-ky-nguyen-so-4.0-1.png',
      'https://ninjateam.org/wp-content/uploads/2019/07/Marketing-plugins.png',
    ];

    return Scaffold(
      appBar: const CenaAppbarDefault(
        leading: CenaButtonDefaultBack(),
        title: "Marketing Online",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIdx) {
                return Center(
                    child: CenaImageCache(
                        url: images[index], fit: BoxFit.cover, width: 1000));
              },
            ),
          ),
          const CenaTextGroup(text: "Quản lý bán hàng"),
          SizedBox(
            height: 120.0,
            child: ListView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                _btnVoucherWithBadge(
                    context,
                    () => Navigator.push(
                        context, routeCena(page: const VoucherManagerPage())),
                    "Mã giảm giá của tôi",
                    "Hot",
                    FontAwesomeIcons.googlePlay),
                _btnVoucherWithBadge(context, () {}, "Chương trình của tôi",
                    "Hot", FontAwesomeIcons.moneyCheck),
                _btnVoucherWithBadge(context, () {}, "Quảng cáo Cena Foodie",
                    "Hot", FontAwesomeIcons.addressBook),
              ],
            ),
          ),
          const CenaTextGroup(text: "Quản lý quảng bá"),
          SizedBox(
            height: 120.0,
            child: ListView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                _btnVoucherNormal(context, () => null, "Ưu đã follow",
                    FontAwesomeIcons.boxTissue),
                _btnVoucherNormal(context, () => null, "Combo khuyến mãi",
                    FontAwesomeIcons.mobileScreenButton),
                _btnVoucherNormal(context, () => null, "Ưu đã follow",
                    FontAwesomeIcons.coins),
                _btnVoucherNormal(context, () => null,
                    "Chương trình Cena Foodie", FontAwesomeIcons.computer),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // void _openVoucherScreen() {}

  Widget _btnVoucherWithBadge(BuildContext context, Function()? onTab,
      String buttonText, String textBadge, IconData icon) {
    return GestureDetector(
      onTap: onTab,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 0,
                fillColor: Theme.of(context).primaryColor.withOpacity(0.3),
                child: Icon(
                  icon,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Theme.of(context).primaryColor),
                  alignment: Alignment.center,
                  child: Text(
                    textBadge,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Theme.of(context).primaryColorLight),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Theme.of(context).primaryColorDark),
            ),
            width: 80,
          )
        ],
      )),
    );
  }

  Widget _btnVoucherNormal(BuildContext context, Function()? onTab,
      String buttonText, IconData icon) {
    return GestureDetector(
      onTap: onTab,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).primaryColor, spreadRadius: 2),
              ],
            ),
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 0,
              child: Icon(
                icon,
                size: 20.0,
                color: Theme.of(context).primaryColor,
              ),
              padding: const EdgeInsets.all(5.0),
              shape: const CircleBorder(),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Theme.of(context).primaryColorDark),
            ),
            width: 70,
          )
        ],
      )),
    );
  }
}
