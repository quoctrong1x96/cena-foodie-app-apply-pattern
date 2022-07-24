import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../widgets/widgets.dart';
import 'cena_webview_widget.dart';

class CenaTerms extends StatefulWidget {
  const CenaTerms({Key? key}) : super(key: key);

  @override
  CenaTermsState createState() => CenaTermsState();
}

class CenaTermsState extends State<CenaTerms> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CenaAppbarDefault(
          title: S.of(context).admin_privacy_policy,
          leading: const CenaButtonDefaultBack(),
        ),
        body: CenaWebViewWidget(
          url: Localizations.localeOf(context).toString() == "vi"
              ? "https://sites.google.com/view/cenafoodie-policy/%C4%91i%E1%BB%81u-kho%E1%BA%A3n-v%C3%A0-%C4%91i%E1%BB%81u-ki%E1%BB%87n"
              : "https://sites.google.com/view/cenafoodie-policy/terms-coditions",
        ));
  }
}
