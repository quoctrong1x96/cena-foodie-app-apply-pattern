import 'package:cenafoodie/src/utils/constants/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../data/app_locator.dart';
import '../../../../data/services/entities/user_service.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/navigation_utils.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../widgets/snackbar/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';

class EnterReferencePage extends StatefulWidget {
  const EnterReferencePage({Key? key}) : super(key: key);

  @override
  State<EnterReferencePage> createState() => _EnterReferencePageState();
}

class _EnterReferencePageState extends State<EnterReferencePage> {
  late TextEditingController? _textController = TextEditingController();
  FocusNode? _focusText;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CenaAppBarDefault(
        title: "Invite code",
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 90.0),
                _buildIcon(),
                const SizedBox(height: 20.0),
                _buildTextMain(),
                const SizedBox(height: 20.0),
                _buildDescription(),
                const SizedBox(height: 40.0),
                _buildInputReference(_textController, _focusText, context),
                const SizedBox(height: 80.0),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: InkWell(
                        onTap: () {
                          final userBloc = BlocProvider.of<UserBloc>(context);
                          userBloc.add(OnInitialCurrentAddressEvent(
                              userBloc.state.user!.id,
                              "${userBloc.state.user!.firstName} ${userBloc.state.user!.lastName}",
                              userBloc.state.user!.phone));

                          NavigationUtils.clearStack(context,
                              newRouteName:
                                  RouteConstants.get_current_address_of_user);
                        },
                        child: const CenaTextDescription(
                            text: 'Skip, I will fill later'))),
                const SizedBox(height: 20.0),
              ],
            ),
            // Container(
            //     margin: const EdgeInsets.only(bottom: 15.0),
            //     child: const CenaTextDescription(
            //         text:
            //             'Did not receive the email? Check your spam filter.',
            //         color: Colors.grey,
            //         maxLine: 2)),
          ],
        ),
      ),
    );
  }
Container _buildInputReference(TextEditingController? textController,
    FocusNode? focusText, BuildContext context) {
  final userService = locator<IUserService>();
  final userBloc = BlocProvider.of<UserBloc>(context);

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CenaFormField(
          controller: textController!,
          focusNode: focusText,
          width: MediaQuery.of(context).size.width - 110,
          hintText: "INVITE CODE",
          maxLength: 10,
          validator: RequiredValidator(
              errorText: "You must input code OR press skip button").call,
        ),
        CenaIconButton(
          width: 50.0,
          backgroundColor: CenaColors.primary,
          leadingIcon: const Icon(FontAwesomeIcons.arrowRight),
          onPressed: () async {
            if (!mounted) return; // Ensure the widget is still mounted

            final userId = userBloc.state.user!.id;

            var data = await userService.enterReferenceCode(
              userId: userId,
              code: textController.value.text,
            );

            if (!mounted) return; // Check again after async operation

            if (!data.hasError) {
              userBloc.add(
                OnInitialCurrentAddressEvent(
                  userId,
                  "${userBloc.state.user!.firstName} ${userBloc.state.user!.lastName}",
                  userBloc.state.user!.phone,
                ),
              );

              // Use a post-frame callback to safely navigate after async operation
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  NavigationUtils.clearStack(
                    context,
                    newRouteName: RouteConstants.get_current_address_of_user,
                  );
                }
              });
            } else {
              cenaToastError(data.errorMessage!);
            }
          },
        ),
      ],
    ),
  );
}



  CenaTextDescription _buildDescription() {
    return const CenaTextDescription(
        text:
            'Check your invite code at "Profiles" -> Menu "Invite code"',
        maxLine: 2,
        textAlign: TextAlign.center);
  }

  CenaTextDescription _buildTextMain() {
    return const CenaTextDescription(
        text: 'Input your invite code',
        textAlign: TextAlign.center,
        fontSize: 32,
        fontWeight: FontWeight.w500);
  }

  Align _buildIcon() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.only(top: 50.0),
        height: 110,
        width: 110,
        decoration: BoxDecoration(
            color: CenaColors.primary.withOpacity(.1),
            borderRadius: BorderRadius.circular(20.0)),
        child: const Icon(FontAwesomeIcons.envelopeOpenText,
            size: 60, color: CenaColors.primary),
      ),
    );
  }
}

@immutable
class ShakeWidget extends StatelessWidget {
  final Duration duration;
  final double deltaX;
  final Widget child;
  final Curve curve;

  const ShakeWidget({
    Key? key,
    this.duration = const Duration(milliseconds: 500),
    this.deltaX = 20,
    this.curve = Curves.bounceOut,
    required this.child,
  }) : super(key: key);

  /// convert 0-1 to 0-1-0
  double shake(double animation) =>
      2 * (0.5 - (0.5 - curve.transform(animation)).abs());

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: key,
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (context, animation, child) => Transform.translate(
        offset: Offset(deltaX * shake(animation), 0),
        child: child,
      ),
      child: child,
    );
  }
}
