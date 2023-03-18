import '../../models/entities/address/address.dart';
import '../../models/entities/dashboard/dashboard_delivered.dart';
import '../../models/entities/dashboard/dashboard_pay_type.dart';
import '../../models/entities/dashboard/dashboard_personal.dart';
import '../../models/entities/dashboard/dashboard_product.dart';
import '../../models/entities/dashboard/dashboard_status.dart';
import '../../models/ui/ui_response.dart';
import '../../services/entities/dashboard_service.dart';
import '../base_repository.dart';

class DashboardRepository extends BaseRepository implements IDashboardService {
  @override
  Future<UiResponse<List<DashboardDelivered>?>> deliveredByPeriod(
      {required TypeOfTime typeOfTime,
      required int storeId,
      required String timeFormatDDmmYYYY,
      required int page}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.addAddress(userId: 1, address: Address(id: 1));
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<DashboardPayType?>> paymentByPeriod(
      {required TypeOfTime typeOfTime,
      required int storeId,
      required String timeFormatDDmmYYYY}) {
    // TODO: implement paymentByPeriod
    throw UnimplementedError();
  }

  @override
  Future<UiResponse<List<DashboardPersonal>?>> personalByPeriod(
      {required TypeOfTime typeOfTime,
      required int storeId,
      required String timeFormatDDmmYYYY}) {
    // TODO: implement personalByPeriod
    throw UnimplementedError();
  }

  @override
  Future<UiResponse<List<DashboardProduct>?>> productByPeriod(
      {required TypeOfTime typeOfTime,
      required int storeId,
      required String timeFormatDDmmYYYY}) {
    // TODO: implement productByPeriod
    throw UnimplementedError();
  }

  @override
  Future<UiResponse<DashboardStatus?>> statusByPeriod(
      {required TypeOfTime typeOfTime,
      required int storeId,
      required String timeFormatDDmmYYYY}) {
    // TODO: implement statusByPeriod
    throw UnimplementedError();
  }
}
