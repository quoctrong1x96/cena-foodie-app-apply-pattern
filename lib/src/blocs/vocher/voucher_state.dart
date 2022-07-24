part of 'voucher_bloc.dart';

@immutable
class VoucherState {}

class LoadingVoucherState extends VoucherState {}

class SuccessVoucherState extends VoucherState {}

class FailureVoucherState extends VoucherState {
  final String error;

  FailureVoucherState(this.error);
}
