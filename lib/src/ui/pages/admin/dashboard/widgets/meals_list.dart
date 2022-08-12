import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../data/models/entities/dashboard/dashboard_status.dart';
import '../../../../../utils/configs/cena_colors.dart';
import '../../../../../utils/configs/cena_text_styles.dart';
import '../../../../resources/generated/l10n.dart';

class MealsListView extends StatefulWidget {
  const MealsListView(
      {Key? key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.dashboardStatus})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  final DashboardStatus? dashboardStatus;

  @override
  _MealsListViewState createState() => _MealsListViewState();
}

class _MealsListViewState extends State<MealsListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  // Future<bool> getData() async {
  //   await Future<dynamic>.delayed(const Duration(milliseconds: 50));
  //   return true;
  // }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: SizedBox(
              height: 216,
              width: double.infinity,
              child: ListView(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                scrollDirection: Axis.horizontal,
                children: [
                  MealsView(
                    mealsModel: MealsModel(
                        amount: widget.dashboardStatus == null
                            ? 0
                            : widget.dashboardStatus!.deliveredAmount,
                        image: 'Assets/Logo/logo-white.png',
                        name: lang.admin_dashboard_meals_delivered,
                        orders: widget.dashboardStatus == null
                            ? 0
                            : widget.dashboardStatus!.delivered),
                    animationCount: 0,
                    animationController: animationController!,
                  ),
                  MealsView(
                    mealsModel: MealsModel(
                        amount: widget.dashboardStatus == null
                            ? 0
                            : widget.dashboardStatus!.dispatchedAmount,
                        image: 'Assets/Logo/logo-white.png',
                        name: lang.admin_dashboard_meals_dispatched,
                        orders: widget.dashboardStatus == null
                            ? 0
                            : widget.dashboardStatus!.delivered),
                    animationCount: 1,
                    animationController: animationController!,
                  ),
                  MealsView(
                    mealsModel: MealsModel(
                        amount: widget.dashboardStatus == null
                            ? 0
                            : widget.dashboardStatus!.onwayAmount,
                        image: 'Assets/Logo/logo-white.png',
                        name: lang.admin_dashboard_meals_onway,
                        orders: widget.dashboardStatus == null
                            ? 0
                            : widget.dashboardStatus!.onway),
                    animationCount: 2,
                    animationController: animationController!,
                  ),
                  MealsView(
                    mealsModel: MealsModel(
                        amount: widget.dashboardStatus == null
                            ? 0
                            : widget.dashboardStatus!.paidoutAmount,
                        image: 'Assets/Logo/logo-white.png',
                        name: lang.admin_dashboard_meals_paidout,
                        orders: widget.dashboardStatus == null
                            ? 0
                            : widget.dashboardStatus!.paidout),
                    animationCount: 3,
                    animationController: animationController!,
                  ),
                ],
                // : (BuildContext context, int index) {
                //   final Animation<double> animation =
                //       Tween<double>(begin: 0.0, end: 1.0).animate(
                //           CurvedAnimation(
                //               parent: animationController!,
                //               curve: Interval((1 / count) * index, 1.0,
                //                   curve: Curves.fastOutSlowIn)));
                //   animationController?.forward();

                // return ;
                // },
              ),
            ),
          ),
        );
      },
    );
  }
}

class MealsModel {
  String image;
  String name;
  int orders;
  int amount;
  MealsModel(
      {this.amount = 0, this.image = "", this.name = "", this.orders = 0});
}

class MealsView extends StatelessWidget {
  const MealsView(
      {Key? key,
      this.mealsModel,
      this.animationController,
      this.animationCount})
      : super(key: key);

  final MealsModel? mealsModel;
  final AnimationController? animationController;
  final int? animationCount;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(
            parent: animationController!,
            curve: Interval((1 / 4) * animationCount!, 1.0,
                curve: Curves.fastOutSlowIn)));
    animationController?.forward();
    NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: SizedBox(
              width: 155,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, left: 8, right: 8, bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: CenaColors.primary.withOpacity(0.6),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: const LinearGradient(
                          colors: [
                            CenaColors.primary,
                            CenaColors.secondary,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(54.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 54, left: 16, right: 16, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Text(
                            //   mealsModel!.name,
                            //   textAlign: TextAlign.center,
                            //   style: CenaTextStyles.whiteS14Bold,
                            // ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        mealsModel!.name,
                                        maxLines: 2,
                                        style: CenaTextStyles.whiteS16Bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  mealsModel!.orders.toString(),
                                  textAlign: TextAlign.center,
                                  style: CenaTextStyles.whiteS16,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, bottom: 3),
                                  child: Text(
                                    S.of(context).admin_dashboard_meals_order,
                                    style: CenaTextStyles.whiteS12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  numberFormat
                                      .format((mealsModel!.amount).toInt())
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: CenaTextStyles.whiteS16,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, bottom: 3),
                                  child: Text(
                                    'vnđ',
                                    style: CenaTextStyles.whiteS12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 5,
                    left: 0,
                    child: SizedBox(
                      width: 45,
                      height: 45,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        color: CenaColors.WHITE,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(mealsModel!.image),
                        ),
                      ),
                      width: 80,
                      height: 80,
                      child:
                          Image.asset(mealsModel!.image, fit: BoxFit.fitHeight),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
