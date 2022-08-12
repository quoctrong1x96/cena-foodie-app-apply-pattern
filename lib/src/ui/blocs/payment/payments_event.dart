part of 'payments_bloc.dart';

@immutable
abstract class PaymentsEvent {}

class OnSelectTypePaymentMethodEvent extends PaymentsEvent {
  final String typePayment;
  final IconData icon;
  final Color color;
  final int index;

  OnSelectTypePaymentMethodEvent(
      this.index, this.typePayment, this.icon, this.color);
}

class OnClearTypePaymentMethodEvent extends PaymentsEvent {}
