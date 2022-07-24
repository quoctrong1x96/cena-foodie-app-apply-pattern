import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TypePaymentMethod {
  final int uid;
  final String typePayment;
  final IconData icon;
  final Color color;

  TypePaymentMethod(this.uid, this.typePayment, this.icon, this.color);

  static List<TypePaymentMethod> listTypePayment = [
    TypePaymentMethod(
        1, 'CASH PAYMENT', FontAwesomeIcons.moneyBill, Colors.green[800]!),
    TypePaymentMethod(
        2, 'CENA FOODIE PAYMENT', FontAwesomeIcons.handshake, Colors.lightBlue),
    TypePaymentMethod(
        3, 'CREDIT CARD', FontAwesomeIcons.creditCard, const Color(0xff002C8B)),
    TypePaymentMethod(4, 'GOOGLE PAY', FontAwesomeIcons.google, Colors.black),
    TypePaymentMethod(
        5, 'PAYPAL', FontAwesomeIcons.paypal, const Color(0xff002C8B)),
  ];
}

List<String> listTypePaymentVN = [
  'TIỀN MẶT',
  'VÍ CENA FOODIE',
  'THẺ TÍN DỤNG',
  'VÍ GOOGLE',
  'PAYPAL'
];

List<String> listTypePayment = [
  'CASH PAYMENT',
  'CENA FOODIE PAYMENT',
  'CREDIT CARD',
  'GOOGLE PAY',
  'PAYPAL'
];
