import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../data/models/ui/page_arguments.dart';
import '../../../../utils/constants/route_constants.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../../utils/navigation_utils.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/store/store_bloc.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';
import 'components/components.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

enum LoginType { byPhone, byEmail, byGoogle, byFacebook }

class _LoginPageState extends State<LoginPage> {
  LoginType _loginType = LoginType.byPhone;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is LoadingAuthState) {
          modalLoading(context);
        } else if (state is FailureAuthState) {
          _catchAuthError(context, state, lang);
        } else if (state.rolId != '') {
          _loginSuccessLogic(BlocProvider.of<UserBloc>(context), state,
              BlocProvider.of<StoreBloc>(context), context);
        }
      },
      child: Scaffold(
        // backgroundColor: Theme.of(context).primaryColorLight,
        body: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 100),
                child: Column(
                  // physics: const BouncingScrollPhysics(),
                  children: [
                    const LoginHeader(),
                    const SizedBox(height: 10.0),
                    _buildSwitchButton(context),
                    const SizedBox(height: 20.0),
                    _loginType == LoginType.byPhone
                        ? const LoginWithPhone()
                        : const LoginWithEmail(),
                    _buildDivide(context),
                    SocialButtons(),
                    const Expanded(child: SizedBox(height: 10)),
                    TextButton(
                      onPressed: () => NavigationUtils.push(
                        context,
                        RouteConstants.register,
                        args: PageArguments(
                            transitionType: PageTransitionType.rightToLeft),
                      ),
                      child: Text(S.of(context).login_register,
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginSuccessLogic(UserBloc userBloc, AuthState state,
      StoreBloc storeBloc, BuildContext context) {
    userBloc.add(OnGetUserEvent(state.user!));
    if (state.store != null) {
      storeBloc.add(OnGetStoreEvent(state.store!));
    }
    NavigationUtils.pop(context);

    if (state.rolId == '1') {
      NavigationUtils.replace(context, RouteConstants.admin_home,
          args: PageArguments(transitionType: PageTransitionType.bottomToTop));
    } else if (state.rolId == '3') {
      NavigationUtils.clearStack(context,
          newRouteName: RouteConstants.delivery_home);
    } else if (state.rolId == '2') {
      final userBloc = BlocProvider.of<UserBloc>(context);
      if (userBloc.state.address == null) {
        userBloc.add(OnInitialCurrentAddressEvent(
            state.user!.id,
            state.user!.firstName + " " + state.user!.lastName,
            state.user!.phone));
      }
      NavigationUtils.clearStack(context,
          newRouteName: RouteConstants.get_current_address_of_user);
    }
  }

  void _catchAuthError(BuildContext context, FailureAuthState state, S lang) {
    NavigationUtils.pop(context);

    switch (state.error) {
      case "error_session_expire":
        cenaToastError(lang.login_error_wrong);
        break;
      default:
        cenaToastError(lang.login_error_server);
    }
  }

  void setStateLoginType(LoginType loginTypeState) {
    setState(() {
      _loginType = loginTypeState;
    });
  }

  Widget _buildSwitchButton(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 150,
          decoration: BoxDecoration(
            border: Border(
                bottom: _loginType == LoginType.byPhone
                    ? BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.5,
                      )
                    : BorderSide.none),
          ),
          child: OutlinedButton(
            onPressed: () => setStateLoginType(LoginType.byPhone),
            style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(style: BorderStyle.none),
            )),
            child: Text(S.of(context).login_with_sms,
                style: _loginType == LoginType.byPhone
                    ? TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold)
                    : const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
          ),
        ),
        Container(
          width: 150,
          decoration: BoxDecoration(
            border: Border(
                bottom: _loginType == LoginType.byEmail
                    ? BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.5,
                      )
                    : BorderSide.none),
          ),
          child: OutlinedButton(
            onPressed: () => setStateLoginType(LoginType.byEmail),
            style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(style: BorderStyle.none),
            )),
            child: Text(S.of(context).login_with_email,
                style: _loginType == LoginType.byEmail
                    ? TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold)
                    : const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
          ),
        ),
      ],
    );
    //
  }

  Widget _buildDivide(BuildContext context) {
    final _theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 10),
            Container(
                height: 1,
                width: 50,
                color: _theme.primaryColorDark.withAlpha(60)),
            CenaTextDescription(
              text: S.of(context).login_or,
              fontSize: 16,
              color: _theme.primaryColorDark.withAlpha(60),
            ),
            Container(
                height: 1,
                width: 50,
                color: _theme.primaryColorDark.withAlpha(60)),
            const SizedBox(height: 10),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
