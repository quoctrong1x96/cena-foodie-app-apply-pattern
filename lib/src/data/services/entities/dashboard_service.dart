import '../../models/entities/dashboard/dashboard_delivered.dart';
import '../../models/entities/dashboard/dashboard_pay_type.dart';
import '../../models/entities/dashboard/dashboard_personal.dart';
import '../../models/entities/dashboard/dashboard_product.dart';
import '../../models/entities/dashboard/dashboard_status.dart';
import '../../models/ui/ui_response.dart';

enum TypeOfTime { date, month, year, allTime, fromTo }

abstract class IDashboardService {
  ///Get dashboard Status by type of time
  Future<UiResponse<DashboardStatus?>> statusByPeriod(
      {required TypeOfTime typeOfTime,
      required int storeId,
      required String timeFormatDDmmYYYY});

  Future<UiResponse<DashboardPayType?>> paymentByPeriod(
      {required TypeOfTime typeOfTime,
      required int storeId,
      required String timeFormatDDmmYYYY});

  Future<UiResponse<List<DashboardDelivered>?>> deliveredByPeriod(
      {required TypeOfTime typeOfTime,
      required int storeId,
      required String timeFormatDDmmYYYY,
      required int page});

  Future<UiResponse<List<DashboardPersonal>?>> personalByPeriod(
      {required TypeOfTime typeOfTime,
      required int storeId,
      required String timeFormatDDmmYYYY});

  Future<UiResponse<List<DashboardProduct>?>> productByPeriod(
      {required TypeOfTime typeOfTime,
      required int storeId,
      required String timeFormatDDmmYYYY});
}
