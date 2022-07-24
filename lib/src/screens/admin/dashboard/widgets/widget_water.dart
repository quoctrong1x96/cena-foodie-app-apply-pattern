import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../configs/cena_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../../models/dashboard/dashboard_personal.dart';

class WaterView extends StatefulWidget {
  const WaterView(
      {Key? key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.dashboardPersonal})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  final List<DashboardPersonal>? dashboardPersonal;

  @override
  _WaterViewState createState() => _WaterViewState();
}

class _WaterViewState extends State<WaterView> with TickerProviderStateMixin {
  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
    final lang = S.of(context);
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: CenaColors.WHITE,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: CenaColors.GREY.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 16, right: 16, bottom: 16),
                  child: widget.dashboardPersonal!.isEmpty
                      ? Text(lang.admin_dashboard_water_nodata)
                      : Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4, bottom: 3),
                                            child: Text(
                                              widget
                                                  .dashboardPersonal![0].orders
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 32,
                                                color: CenaColors.primary,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, bottom: 8),
                                            child: Text(
                                              lang.admin_dashboard_water_orders,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                letterSpacing: -0.2,
                                                color: CenaColors.primary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, top: 2, bottom: 14),
                                        child: Text(
                                          '${lang.admin_dashboard_water_total} ${numberFormat.format(widget.dashboardPersonal![0].amount)} vnđ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            color: CenaColors.textBlack
                                                .withOpacity(0.7),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: Image.asset(
                                                'Assets/Logo/logo-white.png'),
                                          ),
                                          Flexible(
                                            child: Text(
                                              '${lang.admin_dashboard_water_human}: ${widget.dashboardPersonal![0].userName}',
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                letterSpacing: 0.0,
                                                color: CenaColors.secondary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 4, right: 4, top: 8, bottom: 16),
                                  //   child: Container(
                                  //     height: 2,
                                  //     decoration: BoxDecoration(
                                  //       color: CenaColors.WHITE,
                                  //       borderRadius: const BorderRadius.all(
                                  //           Radius.circular(4.0)),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 16),
                                  //   child: Column(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     crossAxisAlignment: CrossAxisAlignment.end,
                                  //     children: <Widget>[
                                  //       Row(
                                  //         mainAxisAlignment: MainAxisAlignment.start,
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.center,
                                  //         children: <Widget>[
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(left: 4),
                                  //             child: Icon(
                                  //               Icons.access_time,
                                  //               color: CenaColors.textBlack
                                  //                   .withOpacity(0.5),
                                  //               size: 16,
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding:
                                  //                 const EdgeInsets.only(left: 4.0),
                                  //             child: Text(
                                  //               'Đầu tiên trong ngày: 07:00',
                                  //               textAlign: TextAlign.center,
                                  //               style: TextStyle(
                                  //                 fontWeight: FontWeight.w500,
                                  //                 fontSize: 14,
                                  //                 letterSpacing: 0.0,
                                  //                 color: CenaColors.textBlack
                                  //                     .withOpacity(0.5),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Padding(
                                  //         padding: const EdgeInsets.only(top: 4),
                                  //         child: Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.start,
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.center,
                                  //           children: <Widget>[
                                  //             SizedBox(
                                  //               width: 24,
                                  //               height: 24,
                                  //               child: Image.asset(
                                  //                   'Assets/Logo/logo-white.png'),
                                  //             ),
                                  //             const Flexible(
                                  //               child: Text(
                                  //                 'Nguyễn Văn A - Mã đơn #123',
                                  //                 textAlign: TextAlign.start,
                                  //                 style: TextStyle(
                                  //                   fontWeight: FontWeight.w500,
                                  //                   fontSize: 12,
                                  //                   letterSpacing: 0.0,
                                  //                   color: CenaColors.secondary,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: widget.dashboardPersonal!.length,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            widget.dashboardPersonal![index]
                                                .userName,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                              color: CenaColors.textBlack,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            ' ${lang.admin_dashboard_water_bought}: ${widget.dashboardPersonal![index].orders.toString()}',
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                              color: CenaColors.textBlack,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                            // SizedBox(
                            //   width: 34,
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: <Widget>[
                            //       Container(
                            //         decoration: BoxDecoration(
                            //           color: CenaColors.LIGHT_GREY,
                            //           shape: BoxShape.circle,
                            //           boxShadow: <BoxShadow>[
                            //             BoxShadow(
                            //                 color:
                            //                     CenaColors.primary.withOpacity(0.4),
                            //                 offset: const Offset(4.0, 4.0),
                            //                 blurRadius: 8.0),
                            //           ],
                            //         ),
                            //         child: const Padding(
                            //           padding: EdgeInsets.all(6.0),
                            //           child: Icon(
                            //             Icons.add,
                            //             color: CenaColors.primary,
                            //             size: 24,
                            //           ),
                            //         ),
                            //       ),
                            //       const SizedBox(
                            //         height: 28,
                            //       ),
                            //       Container(
                            //         decoration: BoxDecoration(
                            //           color: CenaColors.LIGHT_GREY,
                            //           shape: BoxShape.circle,
                            //           boxShadow: <BoxShadow>[
                            //             BoxShadow(
                            //                 color:
                            //                     CenaColors.primary.withOpacity(0.4),
                            //                 offset: const Offset(4.0, 4.0),
                            //                 blurRadius: 8.0),
                            //           ],
                            //         ),
                            //         child: const Padding(
                            //           padding: EdgeInsets.all(6.0),
                            //           child: Icon(
                            //             Icons.remove,
                            //             color: CenaColors.primary,
                            //             size: 24,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(left: 16, right: 8, top: 16),
                            //   child: Container(
                            //     width: 60,
                            //     height: 160,
                            //     decoration: BoxDecoration(
                            //       color: CenaColors.WHITE,
                            //       borderRadius: const BorderRadius.only(
                            //           topLeft: Radius.circular(80.0),
                            //           bottomLeft: Radius.circular(80.0),
                            //           bottomRight: Radius.circular(80.0),
                            //           topRight: Radius.circular(80.0)),
                            //       boxShadow: <BoxShadow>[
                            //         BoxShadow(
                            //             color: CenaColors.GREY.withOpacity(0.4),
                            //             offset: const Offset(2, 2),
                            //             blurRadius: 4),
                            //       ],
                            //     ),
                            //     child: const WaveView(
                            //       percentageValue: 60.0,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
