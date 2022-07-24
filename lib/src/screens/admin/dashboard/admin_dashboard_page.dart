import '../../../controllers/dashboard_controller.dart';
import '../../../helpers/cena_indicator.dart';
import '../../../models/dashboard/dashboard_view_model.dart';
import '../../../models/dashboard_type.dart';
import 'widgets/meals_list.dart';
import 'widgets/widget_glass.dart';
import 'widgets/widget_measurement.dart';
import 'widgets/widget_mediteranean_diet.dart';
import 'widgets/widget_tiltle.dart';
import 'widgets/widget_water.dart';
import '../../../configs/cena_colors.dart';
import '../../../configs/cena_text_styles.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminDashboardPage extends StatefulWidget {
  final int storeId;
  const AdminDashboardPage(this.storeId, {Key? key}) : super(key: key);

  @override
  _AdminDashboardPageState createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage>
    with TickerProviderStateMixin {
  //Animation
  Animation<double>? topBarAnimation;
  AnimationController? animationController;

  List<Widget> listViews = <Widget>[];

  //state of Widget
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  DateTime selectedCurrentDate = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime selectedMonth = DateTime.now();
  DateTime selectedYear = DateTime.now();
  bool _isLoading = true;
  DashboardView dashboardView = DashboardView(storeId: -1);
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController!,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    _controller = TabController(length: dashboardType.length, vsync: this);

    _controller.addListener(() async {
      setLoaded();
      if (mounted) {
        setState(() {
          _selectedIndex = _controller.index;
        });
      }

      changeSelectedTab();
      getData(dashboardTypeDes[_selectedIndex]);
    });
    selectedCurrentDate = selectedDay;
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          if (mounted) {
            setState(() {
              topBarOpacity = 1.0;
            });
          }
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          if (mounted) {
            setState(() {
              topBarOpacity = scrollController.offset / 24;
            });
          }
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          if (mounted) {
            setState(() {
              topBarOpacity = 0.0;
            });
          }
        }
      }
    });
    getInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return DefaultTabController(
        length: dashboardType.length,
        child: Container(
            color: CenaColors.WHITE,
            child: Scaffold(
              appBar: CenaAppbarDefault(
                title: lang.admin_dashboard_title,
                leading: const CenaButtonDefaultBack(),
                preferredSizeInput: 80,
                bottom: TabBar(
                    indicatorWeight: 2,
                    controller: _controller,
                    labelColor: CenaColors.primary,
                    unselectedLabelColor: Colors.grey,
                    indicator: CenaIndicatorTabBar(),
                    isScrollable: true,
                    onTap: (int index) async {
                      _selectedIndex = index;
                      changeSelectedTab();
                      await getData(dashboardTypeDes[index]);
                    },
                    tabs: List<Widget>.generate(
                        dashboardType.length,
                        (i) => Tab(
                            child: Text(
                                Localizations.localeOf(context).toString() ==
                                        "vi"
                                    ? dashboardTypeVN[i]
                                    : dashboardType[i],
                                style: CenaTextStyles.blackS17)))),
              ),
              backgroundColor: Colors.transparent,
              body: TabBarView(
                controller: _controller,
                children: dashboardTypeDesVN
                    .map(
                      (e) => _isLoading
                          ? Column(
                              children: const [
                                CenaShimmer(),
                                SizedBox(height: 10),
                                CenaShimmer(),
                                SizedBox(height: 10),
                                CenaShimmer(),
                              ],
                            )
                          : Stack(
                              children: <Widget>[
                                _isLoading
                                    ? const CenaShimmer()
                                    : ListView(
                                        controller: scrollController,
                                        padding: EdgeInsets.only(
                                          top: AppBar().preferredSize.height +
                                              MediaQuery.of(context)
                                                  .padding
                                                  .top +
                                              24,
                                          bottom: 62 +
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        children: [
                                            TitleView(
                                              titleTxt: lang
                                                  .admin_dashboard_total_order,
                                              subTxt: lang
                                                  .admin_dashboard_total_detail,
                                              animation: Tween<double>(
                                                      begin: 0.0, end: 1.0)
                                                  .animate(CurvedAnimation(
                                                      parent:
                                                          animationController!,
                                                      curve: const Interval(
                                                          (1 / 9) * 0, 1.0,
                                                          curve: Curves
                                                              .fastOutSlowIn))),
                                              animationController:
                                                  animationController!,
                                            ),
                                            MediterranesnDietView(
                                              dashboardProduct: dashboardView
                                                  .dashboardProducts,
                                              dashboardStatus:
                                                  dashboardView.dashboardStatus,
                                              animation: Tween<double>(
                                                      begin: 0.0, end: 1.0)
                                                  .animate(CurvedAnimation(
                                                      parent:
                                                          animationController!,
                                                      curve: const Interval(
                                                          (1 / 9) * 1, 1.0,
                                                          curve: Curves
                                                              .fastOutSlowIn))),
                                              animationController:
                                                  animationController!,
                                            ),
                                            TitleView(
                                              titleTxt: lang
                                                  .admin_dashboard_status_order,
                                              subTxt: lang
                                                  .admin_dashboard_stauts_detail,
                                              animation: Tween<double>(
                                                      begin: 0.0, end: 1.0)
                                                  .animate(CurvedAnimation(
                                                      parent:
                                                          animationController!,
                                                      curve: const Interval(
                                                          (1 / 9) * 2, 1.0,
                                                          curve: Curves
                                                              .fastOutSlowIn))),
                                              animationController:
                                                  animationController!,
                                            ),
                                            MealsListView(
                                              dashboardStatus:
                                                  dashboardView.dashboardStatus,
                                              mainScreenAnimation: Tween<
                                                          double>(
                                                      begin: 0.0, end: 1.0)
                                                  .animate(CurvedAnimation(
                                                      parent:
                                                          animationController!,
                                                      curve: const Interval(
                                                          (1 / 9) * 3, 1.0,
                                                          curve: Curves
                                                              .fastOutSlowIn))),
                                              mainScreenAnimationController:
                                                  animationController,
                                            ),
                                            TitleView(
                                              titleTxt: lang
                                                  .admin_dashboard_payment_order,
                                              subTxt: lang
                                                  .admin_dashboard_payment_detail,
                                              animation: Tween<double>(
                                                      begin: 0.0, end: 1.0)
                                                  .animate(CurvedAnimation(
                                                      parent:
                                                          animationController!,
                                                      curve: const Interval(
                                                          (1 / 9) * 4, 1.0,
                                                          curve: Curves
                                                              .fastOutSlowIn))),
                                              animationController:
                                                  animationController!,
                                            ),
                                            BodyMeasurementView(
                                              dashboardPayType: dashboardView
                                                  .dashboardPayType,
                                              animation: Tween<double>(
                                                      begin: 0.0, end: 1.0)
                                                  .animate(CurvedAnimation(
                                                      parent:
                                                          animationController!,
                                                      curve: const Interval(
                                                          (1 / 9) * 5, 1.0,
                                                          curve: Curves
                                                              .fastOutSlowIn))),
                                              animationController:
                                                  animationController!,
                                            ),
                                            TitleView(
                                              titleTxt: lang
                                                  .admin_dashboard_customer_order,
                                              subTxt: lang
                                                  .admin_dashboard_customer_detail,
                                              animation: Tween<double>(
                                                      begin: 0.0, end: 1.0)
                                                  .animate(CurvedAnimation(
                                                      parent:
                                                          animationController!,
                                                      curve: const Interval(
                                                          (1 / 9) * 6, 1.0,
                                                          curve: Curves
                                                              .fastOutSlowIn))),
                                              animationController:
                                                  animationController!,
                                            ),
                                            WaterView(
                                              dashboardPersonal: dashboardView
                                                  .dashboardPersonal,
                                              mainScreenAnimation: Tween<
                                                          double>(
                                                      begin: 0.0, end: 1.0)
                                                  .animate(CurvedAnimation(
                                                      parent:
                                                          animationController!,
                                                      curve: const Interval(
                                                          (1 / 9) * 7, 1.0,
                                                          curve: Curves
                                                              .fastOutSlowIn))),
                                              mainScreenAnimationController:
                                                  animationController!,
                                            ),
                                            GlassView(
                                                animation: Tween<double>(
                                                        begin: 0.0, end: 1.0)
                                                    .animate(CurvedAnimation(
                                                        parent:
                                                            animationController!,
                                                        curve: const Interval(
                                                            (1 / 9) * 8, 1.0,
                                                            curve: Curves
                                                                .fastOutSlowIn))),
                                                animationController:
                                                    animationController!),
                                          ]),
                                getAppBarUI(e),
                                // SizedBox(
                                //   height: MediaQuery.of(context).padding.bottom,
                                // )
                              ],
                            ),
                    )
                    .toList(),
              ),
            )));
  }

  Widget getAppBarUI(String description) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: CenaColors.GREY.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:
                              CenaColors.GREY.withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  Localizations.localeOf(context).toString() ==
                                          "vi"
                                      ? description
                                      : dashboardTypeDes.elementAt(
                                          dashboardTypeDesVN
                                              .indexOf(description)),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: CenaColors.DARK,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: _isLoading ? () {} : previousDate,
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: topBarOpacity > 0.1
                                        ? CenaColors.WHITE
                                        : CenaColors.textBlack,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: InkWell(
                                      onTap: _isLoading ? () {} : selectDate,
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: topBarOpacity > 0.1
                                            ? CenaColors.WHITE
                                            : CenaColors.textBlack,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    formatDate(selectedCurrentDate),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      letterSpacing: -0.2,
                                      color: CenaColors.DARK,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: _isLoading ? () {} : nextDate,
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: topBarOpacity > 0.1
                                        ? CenaColors.WHITE
                                        : CenaColors.textBlack,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Future<void> selectDate() async {
    DatePickerMode mode = DatePickerMode.day;
    switch (dashboardType[_selectedIndex]) {
      case "HÔM NAY":
        mode = DatePickerMode.day;
        break;
      case "THÁNG":
        mode = DatePickerMode.day;
        break;
      case "NĂM":
        mode = DatePickerMode.year;
        break;
      default:
        mode = DatePickerMode.day;
        break;
    }

    await showDatePicker(
            context: context,
            initialDate: selectedCurrentDate,
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDatePickerMode: mode,
            firstDate: DateTime(2022),
            lastDate: DateTime(2025))
        .then((date) {
      setStateSelectedDate(date!);
    });
    getData(dashboardTypeDes[_selectedIndex]);
  }

  Future<void> changeSelectedTab() async {
    await Future.delayed(const Duration(milliseconds: 1));
    if (mounted) {
      setState(() {
        switch (dashboardType[_selectedIndex]) {
          case "HÔM NAY":
            selectedCurrentDate = selectedDay;
            break;
          case "THÁNG":
            selectedCurrentDate = selectedMonth;
            break;
          case "NĂM":
            selectedCurrentDate = selectedYear;
            break;
          default:
            selectedCurrentDate = selectedDay;
            break;
        }
      });
    }
  }

  void setStateSelectedDate(DateTime date) {
    if (mounted) {
      setState(() {
        _isLoading = true;
        selectedCurrentDate = date;
        switch (dashboardType[_selectedIndex]) {
          case "HÔM NAY":
            selectedDay = date;
            break;
          case "THÁNG":
            selectedMonth = date;
            break;
          case "NĂM":
            selectedYear = date;
            break;
          default:
            selectedDay = date;
            break;
        }
      });
    }
  }

  Future<void> nextDate() async {
    var tempDate = selectedCurrentDate;

    switch (dashboardType[_selectedIndex]) {
      case "HÔM NAY":
        tempDate = tempDate.add(const Duration(days: 1));
        break;
      case "THÁNG":
        tempDate = DateTime(tempDate.year, tempDate.month + 1, tempDate.day);
        break;
      case "NĂM":
        tempDate = DateTime(tempDate.year + 1, tempDate.month, tempDate.day);
        break;
      default:
        tempDate = tempDate.subtract(const Duration(days: 1));
        break;
    }
    setStateSelectedDate(tempDate);
    await getData(dashboardTypeDes[_selectedIndex]);
  }

  String formatDate(DateTime time) {
    switch (dashboardType[_selectedIndex]) {
      case "HÔM NAY":
        return DateFormat('dd/MM/yyyy').format(time);
      case "THÁNG":
        return DateFormat('MM/yyyy').format(time);
      case "NĂM":
        return DateFormat('yyyy').format(time);
      default:
        return DateFormat('dd/MM/yyyy').format(time);
    }
  }

  String formatDateAPI(DateTime time) {
    switch (dashboardType[_selectedIndex]) {
      case "HÔM NAY":
        return DateFormat('ddMMyyyy').format(time);
      case "THÁNG":
        return DateFormat('MMyyyy').format(time);
      case "NĂM":
        return DateFormat('yyyy').format(time);
      default:
        return DateFormat('ddMMyyyy').format(time);
    }
  }

  Future<void> previousDate() async {
    var tempDate = selectedCurrentDate;

    switch (dashboardType[_selectedIndex]) {
      case "HÔM NAY":
        tempDate = tempDate.subtract(const Duration(days: 1));
        break;
      case "THÁNG":
        tempDate = DateTime(tempDate.year, tempDate.month - 1, tempDate.day);
        break;
      case "NĂM":
        tempDate = DateTime(tempDate.year - 1, tempDate.month, tempDate.day);
        break;
      default:
        tempDate = tempDate.subtract(const Duration(days: 1));
        break;
    }
    setStateSelectedDate(tempDate);
    await getData(dashboardTypeDes[_selectedIndex]);
  }

  void setLoaded() {
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void setLoading() {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  Future<DashboardView> getDashboardDate() async {
    DashboardView dashboard = DashboardView(storeId: widget.storeId);
    await dashboard.updateAll(
        TypeOfTime.date, widget.storeId, formatDateAPI(selectedCurrentDate), 0);
    return dashboard;
  }

  Future<DashboardView> getDashboardMonth() async {
    DashboardView dashboard = DashboardView(storeId: widget.storeId);
    await dashboard.updateAll(TypeOfTime.month, widget.storeId,
        formatDateAPI(selectedCurrentDate), 0);
    return dashboard;
  }

  Future<DashboardView> getDashboardYear() async {
    DashboardView dashboard = DashboardView(storeId: widget.storeId);
    await dashboard.updateAll(
        TypeOfTime.year, widget.storeId, formatDateAPI(selectedCurrentDate), 0);
    return dashboard;
  }

  Future<void> getInitialData() async {
    await getData("Trong ngày: ");
  }

  Future<DashboardView> getData(String dashboardType) async {
    DashboardView dashboard = DashboardView(storeId: -1);
    setLoading();
    switch (dashboardType) {
      case "Trong ngày: ":
        dashboard = await getDashboardDate();
        break;
      case "Trong tháng: ":
        dashboard = await getDashboardMonth();
        break;
      case "Trong năm:":
        dashboard = await getDashboardYear();
        break;
      default:
        dashboard = await getDashboardDate();
    }
    await Future.delayed(const Duration(milliseconds: 1000));

    if (mounted) {
      setState(() {
        dashboardView = dashboard;
        _isLoading = false;
      });
    }
    animationController?.forward();
    return dashboard;
  }
}
