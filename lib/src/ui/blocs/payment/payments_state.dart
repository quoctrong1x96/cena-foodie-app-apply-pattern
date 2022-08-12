part of 'payments_bloc.dart';

@immutable
class PaymentsState {
  final String typePaymentMethod;
  final IconData iconPayment;
  final Color colorPayment;
  final int index;

  const PaymentsState(
      {this.typePaymentMethod = 'CASH PAYMENT',
      this.index = 0,
      this.iconPayment = FontAwesomeIcons.moneyBill,
      this.colorPayment = const Color(0xFF2E7D32)});

  PaymentsState copyWith(
          {String? typePaymentMethod,
          IconData? iconPayment,
          int? index,
          Color? colorPayment}) =>
      PaymentsState(
          typePaymentMethod: typePaymentMethod ?? this.typePaymentMethod,
          iconPayment: iconPayment ?? this.iconPayment,
          index: index ?? this.index,
          colorPayment: colorPayment ?? this.colorPayment);
}
