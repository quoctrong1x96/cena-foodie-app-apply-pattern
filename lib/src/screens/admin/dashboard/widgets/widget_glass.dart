import 'package:flutter/material.dart';

import '../../../../configs/cena_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../../widgets/snackbars/cena_snackbar_toast.dart';

class GlassView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const GlassView({Key? key, this.animationController, this.animation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 0, bottom: 24),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: CenaColors.primary,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                            // boxShadow: <BoxShadow>[
                            //   BoxShadow(
                            //       color: FitnessAppTheme.grey.withOpacity(0.2),
                            //       offset: Offset(1.1, 1.1),
                            //       blurRadius: 10.0),
                            // ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 72, bottom: 12, right: 16, top: 12),
                                child: InkWell(
                                  onDoubleTap: () {
                                    cenaToastInfo(
                                        lang.admin_dashboard_glass_new_feature);
                                  },
                                  child: Text(
                                    lang.admin_dashboard_glass_description,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: 0.0,
                                      color: CenaColors.WHITE,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        left: 0,
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset("Assets/Logo/logo-white.png"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
