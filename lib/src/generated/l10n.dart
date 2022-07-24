// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Common`
  String get common {
    return Intl.message(
      'Common',
      name: 'common',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get common_back {
    return Intl.message(
      'Back',
      name: 'common_back',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get common_save {
    return Intl.message(
      'Save',
      name: 'common_save',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get common_are_you_sure {
    return Intl.message(
      'Are you sure?',
      name: 'common_are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get common_delete {
    return Intl.message(
      'Delete',
      name: 'common_delete',
      desc: '',
      args: [],
    );
  }

  /// `---------------------------------------------------`
  String get common_end {
    return Intl.message(
      '---------------------------------------------------',
      name: 'common_end',
      desc: '',
      args: [],
    );
  }

  /// `Store`
  String get admin {
    return Intl.message(
      'Store',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `Update category`
  String get admin_category_title_update {
    return Intl.message(
      'Update category',
      name: 'admin_category_title_update',
      desc: '',
      args: [],
    );
  }

  /// `Add category`
  String get admin_category_add {
    return Intl.message(
      'Add category',
      name: 'admin_category_add',
      desc: '',
      args: [],
    );
  }

  /// `Category name`
  String get admin_category_name {
    return Intl.message(
      'Category name',
      name: 'admin_category_name',
      desc: '',
      args: [],
    );
  }

  /// `Category is required`
  String get admin_category_name_required {
    return Intl.message(
      'Category is required',
      name: 'admin_category_name_required',
      desc: '',
      args: [],
    );
  }

  /// `Milktea`
  String get admin_category_example {
    return Intl.message(
      'Milktea',
      name: 'admin_category_example',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get admin_category_title {
    return Intl.message(
      'Categories',
      name: 'admin_category_title',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get admin_category_button_add {
    return Intl.message(
      'Add',
      name: 'admin_category_button_add',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get admin_category_loading {
    return Intl.message(
      'Loading',
      name: 'admin_category_loading',
      desc: '',
      args: [],
    );
  }

  /// `Cena Foodie category (can not edit)`
  String get admin_category_common {
    return Intl.message(
      'Cena Foodie category (can not edit)',
      name: 'admin_category_common',
      desc: '',
      args: [],
    );
  }

  /// `Store categories`
  String get admin_category_store {
    return Intl.message(
      'Store categories',
      name: 'admin_category_store',
      desc: '',
      args: [],
    );
  }

  /// `Category Description`
  String get admin_category_description {
    return Intl.message(
      'Category Description',
      name: 'admin_category_description',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------------------------`
  String get admin_product_start {
    return Intl.message(
      '--------------------------------------------',
      name: 'admin_product_start',
      desc: '',
      args: [],
    );
  }

  /// `List Foods & Drinks`
  String get admin_product_title {
    return Intl.message(
      'List Foods & Drinks',
      name: 'admin_product_title',
      desc: '',
      args: [],
    );
  }

  /// `Product was add successful`
  String get admin_product_success {
    return Intl.message(
      'Product was add successful',
      name: 'admin_product_success',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get admin_product_button_add {
    return Intl.message(
      'Add',
      name: 'admin_product_button_add',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get admin_product_sales {
    return Intl.message(
      'Sales',
      name: 'admin_product_sales',
      desc: '',
      args: [],
    );
  }

  /// `Liked`
  String get admin_product_liked {
    return Intl.message(
      'Liked',
      name: 'admin_product_liked',
      desc: '',
      args: [],
    );
  }

  /// `Viewed`
  String get admin_product_viewer {
    return Intl.message(
      'Viewed',
      name: 'admin_product_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Hide`
  String get admin_product_hidden {
    return Intl.message(
      'Hide',
      name: 'admin_product_hidden',
      desc: '',
      args: [],
    );
  }

  /// `Show`
  String get admin_product_show {
    return Intl.message(
      'Show',
      name: 'admin_product_show',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get admin_product_edit {
    return Intl.message(
      'Edit',
      name: 'admin_product_edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get admin_product_delete {
    return Intl.message(
      'Delete',
      name: 'admin_product_delete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete this product?`
  String get admin_product_delete_confirm_message {
    return Intl.message(
      'Are you sure to delete this product?',
      name: 'admin_product_delete_confirm_message',
      desc: '',
      args: [],
    );
  }

  /// `YES, DO IT`
  String get admin_product_delete_confirm_button {
    return Intl.message(
      'YES, DO IT',
      name: 'admin_product_delete_confirm_button',
      desc: '',
      args: [],
    );
  }

  /// `Without Foods & Drinks`
  String get admin_product_no_data {
    return Intl.message(
      'Without Foods & Drinks',
      name: 'admin_product_no_data',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------------------------`
  String get admin_product_end {
    return Intl.message(
      '--------------------------------------------',
      name: 'admin_product_end',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------------------------`
  String get admin_delivery_start {
    return Intl.message(
      '--------------------------------------------',
      name: 'admin_delivery_start',
      desc: '',
      args: [],
    );
  }

  /// `List delivery`
  String get admin_delivery_title {
    return Intl.message(
      'List delivery',
      name: 'admin_delivery_title',
      desc: '',
      args: [],
    );
  }

  /// `Delivery added successful`
  String get admin_delivery_success {
    return Intl.message(
      'Delivery added successful',
      name: 'admin_delivery_success',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get admin_delivery_button_add {
    return Intl.message(
      'Add',
      name: 'admin_delivery_button_add',
      desc: '',
      args: [],
    );
  }

  /// `Without Delivery men`
  String get admin_delivery_no_data {
    return Intl.message(
      'Without Delivery men',
      name: 'admin_delivery_no_data',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------------------------`
  String get admin_delivery_end {
    return Intl.message(
      '--------------------------------------------',
      name: 'admin_delivery_end',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------------------------`
  String get admin_order_start {
    return Intl.message(
      '--------------------------------------------',
      name: 'admin_order_start',
      desc: '',
      args: [],
    );
  }

  /// `List order`
  String get admin_order_title {
    return Intl.message(
      'List order',
      name: 'admin_order_title',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get admin_order_list {
    return Intl.message(
      '',
      name: 'admin_order_list',
      desc: '',
      args: [],
    );
  }

  /// `ORDER ID`
  String get admin_order_orderid {
    return Intl.message(
      'ORDER ID',
      name: 'admin_order_orderid',
      desc: '',
      args: [],
    );
  }

  /// `Time pickup`
  String get admin_order_time {
    return Intl.message(
      'Time pickup',
      name: 'admin_order_time',
      desc: '',
      args: [],
    );
  }

  /// `Receiver`
  String get admin_order_receiver {
    return Intl.message(
      'Receiver',
      name: 'admin_order_receiver',
      desc: '',
      args: [],
    );
  }

  /// `Delivery address`
  String get admin_order_address {
    return Intl.message(
      'Delivery address',
      name: 'admin_order_address',
      desc: '',
      args: [],
    );
  }

  /// `No address`
  String get admin_order_no_address {
    return Intl.message(
      'No address',
      name: 'admin_order_no_address',
      desc: '',
      args: [],
    );
  }

  /// `TOTAL`
  String get admin_order_total {
    return Intl.message(
      'TOTAL',
      name: 'admin_order_total',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get admin_order_items {
    return Intl.message(
      'items',
      name: 'admin_order_items',
      desc: '',
      args: [],
    );
  }

  /// `AMOUNT`
  String get admin_order_amount {
    return Intl.message(
      'AMOUNT',
      name: 'admin_order_amount',
      desc: '',
      args: [],
    );
  }

  /// `Push to shipper successfully!`
  String get admin_order_detail_success {
    return Intl.message(
      'Push to shipper successfully!',
      name: 'admin_order_detail_success',
      desc: '',
      args: [],
    );
  }

  /// `Order ID`
  String get admin_order_detail_title {
    return Intl.message(
      'Order ID',
      name: 'admin_order_detail_title',
      desc: '',
      args: [],
    );
  }

  /// `List of bill`
  String get admin_order_detail_list {
    return Intl.message(
      'List of bill',
      name: 'admin_order_detail_list',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get admin_order_detail_amount_total {
    return Intl.message(
      'Total amount',
      name: 'admin_order_detail_amount_total',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get admin_order_detail_customer {
    return Intl.message(
      'Customer',
      name: 'admin_order_detail_customer',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get admin_order_detail_time {
    return Intl.message(
      'Time',
      name: 'admin_order_detail_time',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get admin_order_detail_address {
    return Intl.message(
      'Address',
      name: 'admin_order_detail_address',
      desc: '',
      args: [],
    );
  }

  /// `No address`
  String get admin_order_detail_no_address {
    return Intl.message(
      'No address',
      name: 'admin_order_detail_no_address',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get admin_order_detail_delivery {
    return Intl.message(
      'Delivery',
      name: 'admin_order_detail_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Select delivery`
  String get admin_order_detail_select_delivery {
    return Intl.message(
      'Select delivery',
      name: 'admin_order_detail_select_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get admin_order_detail_count {
    return Intl.message(
      'Quantity',
      name: 'admin_order_detail_count',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get admin_order_detail_cancel {
    return Intl.message(
      'Cancel',
      name: 'admin_order_detail_cancel',
      desc: '',
      args: [],
    );
  }

  /// `usd`
  String get admin_order_detail_currency {
    return Intl.message(
      'usd',
      name: 'admin_order_detail_currency',
      desc: '',
      args: [],
    );
  }

  /// `Cancel this order?`
  String get admin_order_delete_confirm_message {
    return Intl.message(
      'Cancel this order?',
      name: 'admin_order_delete_confirm_message',
      desc: '',
      args: [],
    );
  }

  /// `YES, CANCEL IT`
  String get admin_order_delete_confirm_button {
    return Intl.message(
      'YES, CANCEL IT',
      name: 'admin_order_delete_confirm_button',
      desc: '',
      args: [],
    );
  }

  /// `NO, GO BACK`
  String get admin_order_delete_confirm_button_no {
    return Intl.message(
      'NO, GO BACK',
      name: 'admin_order_delete_confirm_button_no',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------------------------`
  String get admin_order_end {
    return Intl.message(
      '--------------------------------------------',
      name: 'admin_order_end',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------------------------`
  String get admin_dashboard_start {
    return Intl.message(
      '--------------------------------------------',
      name: 'admin_dashboard_start',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get admin_dashboard_title {
    return Intl.message(
      'Dashboard',
      name: 'admin_dashboard_title',
      desc: '',
      args: [],
    );
  }

  /// `Total order`
  String get admin_dashboard_total_order {
    return Intl.message(
      'Total order',
      name: 'admin_dashboard_total_order',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get admin_dashboard_total_detail {
    return Intl.message(
      'Details',
      name: 'admin_dashboard_total_detail',
      desc: '',
      args: [],
    );
  }

  /// `Order by status`
  String get admin_dashboard_status_order {
    return Intl.message(
      'Order by status',
      name: 'admin_dashboard_status_order',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get admin_dashboard_stauts_detail {
    return Intl.message(
      'Details',
      name: 'admin_dashboard_stauts_detail',
      desc: '',
      args: [],
    );
  }

  /// `Order by payment`
  String get admin_dashboard_payment_order {
    return Intl.message(
      'Order by payment',
      name: 'admin_dashboard_payment_order',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get admin_dashboard_payment_detail {
    return Intl.message(
      'Details',
      name: 'admin_dashboard_payment_detail',
      desc: '',
      args: [],
    );
  }

  /// `Order by customer`
  String get admin_dashboard_customer_order {
    return Intl.message(
      'Order by customer',
      name: 'admin_dashboard_customer_order',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get admin_dashboard_customer_detail {
    return Intl.message(
      'Details',
      name: 'admin_dashboard_customer_detail',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get admin_dashboard_meals_delivered {
    return Intl.message(
      'Delivered',
      name: 'admin_dashboard_meals_delivered',
      desc: '',
      args: [],
    );
  }

  /// `Dispatched`
  String get admin_dashboard_meals_dispatched {
    return Intl.message(
      'Dispatched',
      name: 'admin_dashboard_meals_dispatched',
      desc: '',
      args: [],
    );
  }

  /// `On way`
  String get admin_dashboard_meals_onway {
    return Intl.message(
      'On way',
      name: 'admin_dashboard_meals_onway',
      desc: '',
      args: [],
    );
  }

  /// `Paid out`
  String get admin_dashboard_meals_paidout {
    return Intl.message(
      'Paid out',
      name: 'admin_dashboard_meals_paidout',
      desc: '',
      args: [],
    );
  }

  /// `orders`
  String get admin_dashboard_meals_order {
    return Intl.message(
      'orders',
      name: 'admin_dashboard_meals_order',
      desc: '',
      args: [],
    );
  }

  /// `Function will update in next version`
  String get admin_dashboard_glass_new_feature {
    return Intl.message(
      'Function will update in next version',
      name: 'admin_dashboard_glass_new_feature',
      desc: '',
      args: [],
    );
  }

  /// `Please give us suggestions, improve your business situation through this statistic!\n\n >>> Click twice to comment!`
  String get admin_dashboard_glass_description {
    return Intl.message(
      'Please give us suggestions, improve your business situation through this statistic!\n\n >>> Click twice to comment!',
      name: 'admin_dashboard_glass_description',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get admin_dashboard_measurement_total {
    return Intl.message(
      'Total',
      name: 'admin_dashboard_measurement_total',
      desc: '',
      args: [],
    );
  }

  /// `Cash payment`
  String get admin_dashboard_measurement_cash {
    return Intl.message(
      'Cash payment',
      name: 'admin_dashboard_measurement_cash',
      desc: '',
      args: [],
    );
  }

  /// `Cenapay`
  String get admin_dashboard_measurement_cenapay {
    return Intl.message(
      'Cenapay',
      name: 'admin_dashboard_measurement_cenapay',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get admin_dashboard_measurement_other {
    return Intl.message(
      'Other',
      name: 'admin_dashboard_measurement_other',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get admin_dashboard_mediteranean_delivered {
    return Intl.message(
      'Delivered',
      name: 'admin_dashboard_mediteranean_delivered',
      desc: '',
      args: [],
    );
  }

  /// `orders`
  String get admin_dashboard_mediteranean_order {
    return Intl.message(
      'orders',
      name: 'admin_dashboard_mediteranean_order',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get admin_dashboard_mediteranean_sales {
    return Intl.message(
      'Sales',
      name: 'admin_dashboard_mediteranean_sales',
      desc: '',
      args: [],
    );
  }

  /// `Total orders`
  String get admin_dashboard_mediteranean_total_order {
    return Intl.message(
      'Total orders',
      name: 'admin_dashboard_mediteranean_total_order',
      desc: '',
      args: [],
    );
  }

  /// `Sold`
  String get admin_dashboard_mediteranean_sold {
    return Intl.message(
      'Sold',
      name: 'admin_dashboard_mediteranean_sold',
      desc: '',
      args: [],
    );
  }

  /// `Have not already data!`
  String get admin_dashboard_mediteranean_no_data {
    return Intl.message(
      'Have not already data!',
      name: 'admin_dashboard_mediteranean_no_data',
      desc: '',
      args: [],
    );
  }

  /// `Have not already data!`
  String get admin_dashboard_water_nodata {
    return Intl.message(
      'Have not already data!',
      name: 'admin_dashboard_water_nodata',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get admin_dashboard_water_orders {
    return Intl.message(
      'Orders',
      name: 'admin_dashboard_water_orders',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get admin_dashboard_water_total {
    return Intl.message(
      'Total',
      name: 'admin_dashboard_water_total',
      desc: '',
      args: [],
    );
  }

  /// `Mr/Mrs`
  String get admin_dashboard_water_human {
    return Intl.message(
      'Mr/Mrs',
      name: 'admin_dashboard_water_human',
      desc: '',
      args: [],
    );
  }

  /// `Bought`
  String get admin_dashboard_water_bought {
    return Intl.message(
      'Bought',
      name: 'admin_dashboard_water_bought',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------------------------`
  String get admin_dashboard_end {
    return Intl.message(
      '--------------------------------------------',
      name: 'admin_dashboard_end',
      desc: '',
      args: [],
    );
  }

  /// `------------------------------------------------`
  String get settings_start {
    return Intl.message(
      '------------------------------------------------',
      name: 'settings_start',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get settings_account {
    return Intl.message(
      'Account',
      name: 'settings_account',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get settings_account_profile {
    return Intl.message(
      'Profile',
      name: 'settings_account_profile',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get settings_account_password {
    return Intl.message(
      'Change password',
      name: 'settings_account_password',
      desc: '',
      args: [],
    );
  }

  /// `Change role`
  String get settings_account_role {
    return Intl.message(
      'Change role',
      name: 'settings_account_role',
      desc: '',
      args: [],
    );
  }

  /// `App`
  String get settings_client {
    return Intl.message(
      'App',
      name: 'settings_client',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get settings_client_address {
    return Intl.message(
      'Delivery Address',
      name: 'settings_client_address',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get settings_client_orders {
    return Intl.message(
      'Orders',
      name: 'settings_client_orders',
      desc: '',
      args: [],
    );
  }

  /// `Store management`
  String get settings_store {
    return Intl.message(
      'Store management',
      name: 'settings_store',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get settings_store_detail {
    return Intl.message(
      'Information',
      name: 'settings_store_detail',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get settings_store_category {
    return Intl.message(
      'Categories',
      name: 'settings_store_category',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get settings_store_product {
    return Intl.message(
      'Products',
      name: 'settings_store_product',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get settings_store_delivery {
    return Intl.message(
      'Delivery',
      name: 'settings_store_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Orders in stock`
  String get settings_delivery_orders {
    return Intl.message(
      'Orders in stock',
      name: 'settings_delivery_orders',
      desc: '',
      args: [],
    );
  }

  /// `Orders on way`
  String get settings_delivery_onway {
    return Intl.message(
      'Orders on way',
      name: 'settings_delivery_onway',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get settings_delivery_delivered {
    return Intl.message(
      'Delivered',
      name: 'settings_delivery_delivered',
      desc: '',
      args: [],
    );
  }

  /// `Oders`
  String get settings_store_orders {
    return Intl.message(
      'Oders',
      name: 'settings_store_orders',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get settings_system {
    return Intl.message(
      'System',
      name: 'settings_system',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get settings_system_languages {
    return Intl.message(
      'Languages',
      name: 'settings_system_languages',
      desc: '',
      args: [],
    );
  }

  /// `Change languages`
  String get settings_system_languages_title {
    return Intl.message(
      'Change languages',
      name: 'settings_system_languages_title',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get settings_system_dark_mode {
    return Intl.message(
      'Dark mode',
      name: 'settings_system_dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Light mode`
  String get settings_system_light_mode {
    return Intl.message(
      'Light mode',
      name: 'settings_system_light_mode',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Policy`
  String get settings_system_policy {
    return Intl.message(
      'Privacy & Policy',
      name: 'settings_system_policy',
      desc: '',
      args: [],
    );
  }

  /// `Secutiry`
  String get settings_system_security {
    return Intl.message(
      'Secutiry',
      name: 'settings_system_security',
      desc: '',
      args: [],
    );
  }

  /// `Term & Conditions`
  String get settings_system_term {
    return Intl.message(
      'Term & Conditions',
      name: 'settings_system_term',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get settings_system_help {
    return Intl.message(
      'Help',
      name: 'settings_system_help',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get settings_signout {
    return Intl.message(
      'Sign Out',
      name: 'settings_signout',
      desc: '',
      args: [],
    );
  }

  /// `---------------------------------------`
  String get login_start {
    return Intl.message(
      '---------------------------------------',
      name: 'login_start',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get login_welcome {
    return Intl.message(
      'Welcome back!',
      name: 'login_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Use your credentials below and login to your account.`
  String get login_description {
    return Intl.message(
      'Use your credentials below and login to your account.',
      name: 'login_description',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get login_email {
    return Intl.message(
      'Email Address',
      name: 'login_email',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get login_phone {
    return Intl.message(
      'Phone number',
      name: 'login_phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_password {
    return Intl.message(
      'Password',
      name: 'login_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get login_forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'login_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_login {
    return Intl.message(
      'Login',
      name: 'login_login',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get login_or {
    return Intl.message(
      'Or',
      name: 'login_or',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get login_register {
    return Intl.message(
      'Register',
      name: 'login_register',
      desc: '',
      args: [],
    );
  }

  /// `Login with SMS`
  String get login_with_sms {
    return Intl.message(
      'Login with SMS',
      name: 'login_with_sms',
      desc: '',
      args: [],
    );
  }

  /// `Login with email`
  String get login_with_email {
    return Intl.message(
      'Login with email',
      name: 'login_with_email',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get login_phone_number {
    return Intl.message(
      'Phone number',
      name: 'login_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get login_phone_number_hintext {
    return Intl.message(
      'Phone number',
      name: 'login_phone_number_hintext',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP - Login or Register`
  String get login_phone_otp {
    return Intl.message(
      'Send OTP - Login or Register',
      name: 'login_phone_otp',
      desc: '',
      args: [],
    );
  }

  /// `Login with google`
  String get login_with_google {
    return Intl.message(
      'Login with google',
      name: 'login_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Login with facebook`
  String get login_with_facebooK {
    return Intl.message(
      'Login with facebook',
      name: 'login_with_facebooK',
      desc: '',
      args: [],
    );
  }

  /// `Tiếng Việt`
  String get login_languages_vietnam {
    return Intl.message(
      'Tiếng Việt',
      name: 'login_languages_vietnam',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get login_languages_english {
    return Intl.message(
      'English',
      name: 'login_languages_english',
      desc: '',
      args: [],
    );
  }

  /// `Wrong credentials!`
  String get login_error_wrong {
    return Intl.message(
      'Wrong credentials!',
      name: 'login_error_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Can not connect to Server. Please try again!`
  String get login_error_server {
    return Intl.message(
      'Can not connect to Server. Please try again!',
      name: 'login_error_server',
      desc: '',
      args: [],
    );
  }

  /// `----------------------------`
  String get register_start {
    return Intl.message(
      '----------------------------',
      name: 'register_start',
      desc: '',
      args: [],
    );
  }

  /// `Register account`
  String get register_header {
    return Intl.message(
      'Register account',
      name: 'register_header',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register_button {
    return Intl.message(
      'Register',
      name: 'register_button',
      desc: '',
      args: [],
    );
  }

  /// `Picture`
  String get register_picture {
    return Intl.message(
      'Picture',
      name: 'register_picture',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get register_first_name {
    return Intl.message(
      'First name',
      name: 'register_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter you first name`
  String get register_enter_first_name {
    return Intl.message(
      'Enter you first name',
      name: 'register_enter_first_name',
      desc: '',
      args: [],
    );
  }

  /// `First name is required`
  String get register_required_first_name {
    return Intl.message(
      'First name is required',
      name: 'register_required_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get register_last_name {
    return Intl.message(
      'Last name',
      name: 'register_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get register_enter_last_name {
    return Intl.message(
      'Enter your last name',
      name: 'register_enter_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Last name is required`
  String get register_required_last_name {
    return Intl.message(
      'Last name is required',
      name: 'register_required_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get register_phone {
    return Intl.message(
      'Phone number',
      name: 'register_phone',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get register_enter_phone {
    return Intl.message(
      'Enter your phone number',
      name: 'register_enter_phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get register_email {
    return Intl.message(
      'Email',
      name: 'register_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get register_enter_email {
    return Intl.message(
      'Enter your email',
      name: 'register_enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get register_password {
    return Intl.message(
      'Password',
      name: 'register_password',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get register_enter_password {
    return Intl.message(
      '********',
      name: 'register_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password`
  String get register_repeat_password {
    return Intl.message(
      'Repeat password',
      name: 'register_repeat_password',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get register_enter_repeat_password {
    return Intl.message(
      '********',
      name: 'register_enter_repeat_password',
      desc: '',
      args: [],
    );
  }

  /// `Password do not match`
  String get register_password_notmath {
    return Intl.message(
      'Password do not match',
      name: 'register_password_notmath',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password is required`
  String get register_required_repeat_password {
    return Intl.message(
      'Repeat password is required',
      name: 'register_required_repeat_password',
      desc: '',
      args: [],
    );
  }

  /// `---------------------------------------`
  String get forgot_password_start {
    return Intl.message(
      '---------------------------------------',
      name: 'forgot_password_start',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get forgot_password_title {
    return Intl.message(
      'Reset Password',
      name: 'forgot_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get forgot_password_email {
    return Intl.message(
      'Email address',
      name: 'forgot_password_email',
      desc: '',
      args: [],
    );
  }

  /// `example@cenafoodie.com`
  String get forgot_password_examble {
    return Intl.message(
      'example@cenafoodie.com',
      name: 'forgot_password_examble',
      desc: '',
      args: [],
    );
  }

  /// `Send Instructions`
  String get forgot_password_button {
    return Intl.message(
      'Send Instructions',
      name: 'forgot_password_button',
      desc: '',
      args: [],
    );
  }

  /// `---------------------------------------`
  String get forgot_password_end {
    return Intl.message(
      '---------------------------------------',
      name: 'forgot_password_end',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------------------`
  String get admin_start {
    return Intl.message(
      '--------------------------------------',
      name: 'admin_start',
      desc: '',
      args: [],
    );
  }

  /// `Accounts`
  String get admin_group_account {
    return Intl.message(
      'Accounts',
      name: 'admin_group_account',
      desc: '',
      args: [],
    );
  }

  /// `Store management`
  String get admin_group_store_managerment {
    return Intl.message(
      'Store management',
      name: 'admin_group_store_managerment',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get admin_group_dashboard {
    return Intl.message(
      'Dashboard',
      name: 'admin_group_dashboard',
      desc: '',
      args: [],
    );
  }

  /// `System settings`
  String get admin_group_system_settings {
    return Intl.message(
      'System settings',
      name: 'admin_group_system_settings',
      desc: '',
      args: [],
    );
  }

  /// `Common settings`
  String get admin_group_common_settings {
    return Intl.message(
      'Common settings',
      name: 'admin_group_common_settings',
      desc: '',
      args: [],
    );
  }

  /// `Profile settings`
  String get admin_profile_settings {
    return Intl.message(
      'Profile settings',
      name: 'admin_profile_settings',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get admin_change_password {
    return Intl.message(
      'Change password',
      name: 'admin_change_password',
      desc: '',
      args: [],
    );
  }

  /// `Role mode`
  String get admin_change_role {
    return Intl.message(
      'Role mode',
      name: 'admin_change_role',
      desc: '',
      args: [],
    );
  }

  /// `Store`
  String get admin_store {
    return Intl.message(
      'Store',
      name: 'admin_store',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get admin_categoris {
    return Intl.message(
      'Categories',
      name: 'admin_categoris',
      desc: '',
      args: [],
    );
  }

  /// `Foods & Drinks`
  String get admin_foods_and_drinks {
    return Intl.message(
      'Foods & Drinks',
      name: 'admin_foods_and_drinks',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get admin_delivery {
    return Intl.message(
      'Delivery',
      name: 'admin_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get admin_orders {
    return Intl.message(
      'Orders',
      name: 'admin_orders',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get admin_dashboard {
    return Intl.message(
      'Dashboard',
      name: 'admin_dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get admin_languages {
    return Intl.message(
      'Languages',
      name: 'admin_languages',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get admin_dark_mode {
    return Intl.message(
      'Dark mode',
      name: 'admin_dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Night mode`
  String get admin_night_mode {
    return Intl.message(
      'Night mode',
      name: 'admin_night_mode',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Policy`
  String get admin_privacy_policy {
    return Intl.message(
      'Privacy & Policy',
      name: 'admin_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get admin_security {
    return Intl.message(
      'Security',
      name: 'admin_security',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get admin_term_conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'admin_term_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get admin_help {
    return Intl.message(
      'Help',
      name: 'admin_help',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get admin_logout {
    return Intl.message(
      'Logout',
      name: 'admin_logout',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to exit the app?`
  String get admin_confirm_exit {
    return Intl.message(
      'Do you really want to exit the app?',
      name: 'admin_confirm_exit',
      desc: '',
      args: [],
    );
  }

  /// `YES, EXIT`
  String get admin_confirm_yes {
    return Intl.message(
      'YES, EXIT',
      name: 'admin_confirm_yes',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL`
  String get admin_confirm_no {
    return Intl.message(
      'CANCEL',
      name: 'admin_confirm_no',
      desc: '',
      args: [],
    );
  }

  /// `-------------------------------------`
  String get admin_end {
    return Intl.message(
      '-------------------------------------',
      name: 'admin_end',
      desc: '',
      args: [],
    );
  }

  /// `-------------------------------------`
  String get delivery_start {
    return Intl.message(
      '-------------------------------------',
      name: 'delivery_start',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Successfully Registered`
  String get delivery_add_success {
    return Intl.message(
      'Delivery Successfully Registered',
      name: 'delivery_add_success',
      desc: '',
      args: [],
    );
  }

  /// `Add new delivery`
  String get delivery_add_title {
    return Intl.message(
      'Add new delivery',
      name: 'delivery_add_title',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get delivery_add_button {
    return Intl.message(
      'Add',
      name: 'delivery_add_button',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get delivery_add_name_title {
    return Intl.message(
      'Last name',
      name: 'delivery_add_name_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get delivery_add_name_hint {
    return Intl.message(
      'Enter your last name',
      name: 'delivery_add_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Last name is required`
  String get delivery_add_name_error {
    return Intl.message(
      'Last name is required',
      name: 'delivery_add_name_error',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get delivery_add_lastName_title {
    return Intl.message(
      'First name',
      name: 'delivery_add_lastName_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first name`
  String get delivery_add_lastName_hint {
    return Intl.message(
      'Enter your first name',
      name: 'delivery_add_lastName_hint',
      desc: '',
      args: [],
    );
  }

  /// `First name is required`
  String get delivery_add_lastName_error {
    return Intl.message(
      'First name is required',
      name: 'delivery_add_lastName_error',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get delivery_add_phone_title {
    return Intl.message(
      'Phone',
      name: 'delivery_add_phone_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get delivery_add_phone_hint {
    return Intl.message(
      'Enter your phone number',
      name: 'delivery_add_phone_hint',
      desc: '',
      args: [],
    );
  }

  /// `Phone is required`
  String get delivery_add_phone_error {
    return Intl.message(
      'Phone is required',
      name: 'delivery_add_phone_error',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get delivery_add_email_title {
    return Intl.message(
      'Email',
      name: 'delivery_add_email_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get delivery_add_email_hint {
    return Intl.message(
      'Enter your email',
      name: 'delivery_add_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get delivery_add_password_title {
    return Intl.message(
      'Password',
      name: 'delivery_add_password_title',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get delivery_add_password_hint {
    return Intl.message(
      '********',
      name: 'delivery_add_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `List orders assigned`
  String get delivery_order_list_assigned {
    return Intl.message(
      'List orders assigned',
      name: 'delivery_order_list_assigned',
      desc: '',
      args: [],
    );
  }

  /// `Withou orders here`
  String get delivery_order_list_assigned_non {
    return Intl.message(
      'Withou orders here',
      name: 'delivery_order_list_assigned_non',
      desc: '',
      args: [],
    );
  }

  /// `Orders delivered!`
  String get delivery_map_susscess {
    return Intl.message(
      'Orders delivered!',
      name: 'delivery_map_susscess',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get delivery_map_address {
    return Intl.message(
      'Address',
      name: 'delivery_map_address',
      desc: '',
      args: [],
    );
  }

  /// `PRESS - If deliverd`
  String get delivery_map_button_delivered {
    return Intl.message(
      'PRESS - If deliverd',
      name: 'delivery_map_button_delivered',
      desc: '',
      args: [],
    );
  }

  /// `Its still far away`
  String get delivery_map_still_far {
    return Intl.message(
      'Its still far away',
      name: 'delivery_map_still_far',
      desc: '',
      args: [],
    );
  }

  /// `Waiting ...`
  String get delivery_map_looking {
    return Intl.message(
      'Waiting ...',
      name: 'delivery_map_looking',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery_home_group_delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery_home_group_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Assigned`
  String get delivery_home_name_assigned {
    return Intl.message(
      'Assigned',
      name: 'delivery_home_name_assigned',
      desc: '',
      args: [],
    );
  }

  /// `On way`
  String get delivery_home_name_on_way {
    return Intl.message(
      'On way',
      name: 'delivery_home_name_on_way',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivery_home_name_delivered {
    return Intl.message(
      'Delivered',
      name: 'delivery_home_name_delivered',
      desc: '',
      args: [],
    );
  }

  /// `has changed to On way state`
  String get delivery_detail_success {
    return Intl.message(
      'has changed to On way state',
      name: 'delivery_detail_success',
      desc: '',
      args: [],
    );
  }

  /// `ORDER ID`
  String get delivery_detail_order_id {
    return Intl.message(
      'ORDER ID',
      name: 'delivery_detail_order_id',
      desc: '',
      args: [],
    );
  }

  /// `TOTAL`
  String get delivery_detail_title_total {
    return Intl.message(
      'TOTAL',
      name: 'delivery_detail_title_total',
      desc: '',
      args: [],
    );
  }

  /// `PAYMENT`
  String get delivery_detail_title_payment {
    return Intl.message(
      'PAYMENT',
      name: 'delivery_detail_title_payment',
      desc: '',
      args: [],
    );
  }

  /// `REVIEVER`
  String get delivery_detail_title_receiver {
    return Intl.message(
      'REVIEVER',
      name: 'delivery_detail_title_receiver',
      desc: '',
      args: [],
    );
  }

  /// `DATE`
  String get delivery_detail_title_date {
    return Intl.message(
      'DATE',
      name: 'delivery_detail_title_date',
      desc: '',
      args: [],
    );
  }

  /// `ADDRESS`
  String get delivery_detail_title_address {
    return Intl.message(
      'ADDRESS',
      name: 'delivery_detail_title_address',
      desc: '',
      args: [],
    );
  }

  /// `START DELIVERY`
  String get delivery_detail_button_start {
    return Intl.message(
      'START DELIVERY',
      name: 'delivery_detail_button_start',
      desc: '',
      args: [],
    );
  }

  /// `GO TO MAP`
  String get delivery_detail_button_gotomap {
    return Intl.message(
      'GO TO MAP',
      name: 'delivery_detail_button_gotomap',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get delivery_detail_quantity {
    return Intl.message(
      'Quantity',
      name: 'delivery_detail_quantity',
      desc: '',
      args: [],
    );
  }

  /// `ORDER ID`
  String get delivery_detail_cart_order_id {
    return Intl.message(
      'ORDER ID',
      name: 'delivery_detail_cart_order_id',
      desc: '',
      args: [],
    );
  }

  /// `Store`
  String get delivery_detail_cart_store {
    return Intl.message(
      'Store',
      name: 'delivery_detail_cart_store',
      desc: '',
      args: [],
    );
  }

  /// `Store address`
  String get delivery_detail_cart_store_address {
    return Intl.message(
      'Store address',
      name: 'delivery_detail_cart_store_address',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get delivery_detail_cart_time {
    return Intl.message(
      'Time',
      name: 'delivery_detail_cart_time',
      desc: '',
      args: [],
    );
  }

  /// `Receiver`
  String get delivery_detail_cart_receiver {
    return Intl.message(
      'Receiver',
      name: 'delivery_detail_cart_receiver',
      desc: '',
      args: [],
    );
  }

  /// `Delivery address`
  String get delivery_detail_cart_dilivery_address {
    return Intl.message(
      'Delivery address',
      name: 'delivery_detail_cart_dilivery_address',
      desc: '',
      args: [],
    );
  }

  /// `On way order`
  String get delivery_detail_onway_title {
    return Intl.message(
      'On way order',
      name: 'delivery_detail_onway_title',
      desc: '',
      args: [],
    );
  }

  /// `Without orders on way`
  String get delivery_detail_onway_without_order {
    return Intl.message(
      'Without orders on way',
      name: 'delivery_detail_onway_without_order',
      desc: '',
      args: [],
    );
  }

  /// `Delivered order`
  String get delivery_detail_delivered_title {
    return Intl.message(
      'Delivered order',
      name: 'delivery_detail_delivered_title',
      desc: '',
      args: [],
    );
  }

  /// `Without orders delivered`
  String get delivery_detail_delivered_without_order {
    return Intl.message(
      'Without orders delivered',
      name: 'delivery_detail_delivered_without_order',
      desc: '',
      args: [],
    );
  }

  /// `-------------------------------------`
  String get delivery_end {
    return Intl.message(
      '-------------------------------------',
      name: 'delivery_end',
      desc: '',
      args: [],
    );
  }

  /// `-------------------------------------`
  String get profile_edit_start {
    return Intl.message(
      '-------------------------------------',
      name: 'profile_edit_start',
      desc: '',
      args: [],
    );
  }

  /// `My profiles`
  String get profile_edit_title {
    return Intl.message(
      'My profiles',
      name: 'profile_edit_title',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get profile_edit_account {
    return Intl.message(
      'Account',
      name: 'profile_edit_account',
      desc: '',
      args: [],
    );
  }

  /// `Change avatar`
  String get profile_edit_change_avatar {
    return Intl.message(
      'Change avatar',
      name: 'profile_edit_change_avatar',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get profile_edit_username {
    return Intl.message(
      'Username',
      name: 'profile_edit_username',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get profile_edit_phone {
    return Intl.message(
      'Phone',
      name: 'profile_edit_phone',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_edit_profile {
    return Intl.message(
      'Profile',
      name: 'profile_edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get profile_edit_lastName {
    return Intl.message(
      'Last name',
      name: 'profile_edit_lastName',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get profile_edit_firtname {
    return Intl.message(
      'First name',
      name: 'profile_edit_firtname',
      desc: '',
      args: [],
    );
  }

  /// `Change your last name`
  String get profile_edit_lastName_title {
    return Intl.message(
      'Change your last name',
      name: 'profile_edit_lastName_title',
      desc: '',
      args: [],
    );
  }

  /// `Your lastName has changed successfully!`
  String get profile_edit_lastName_success {
    return Intl.message(
      'Your lastName has changed successfully!',
      name: 'profile_edit_lastName_success',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get profile_edit_lastName_label {
    return Intl.message(
      'Last name',
      name: 'profile_edit_lastName_label',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get profile_edit_lastName_button_save {
    return Intl.message(
      'Save',
      name: 'profile_edit_lastName_button_save',
      desc: '',
      args: [],
    );
  }

  /// `Nothing to change`
  String get profile_edit_lastName_no_to_change {
    return Intl.message(
      'Nothing to change',
      name: 'profile_edit_lastName_no_to_change',
      desc: '',
      args: [],
    );
  }

  /// `Your firstName has changed successfully!`
  String get profile_edit_firstName_success {
    return Intl.message(
      'Your firstName has changed successfully!',
      name: 'profile_edit_firstName_success',
      desc: '',
      args: [],
    );
  }

  /// `Change first name`
  String get profile_edit_firstName_title {
    return Intl.message(
      'Change first name',
      name: 'profile_edit_firstName_title',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get profile_edit_firstName_label {
    return Intl.message(
      'First name',
      name: 'profile_edit_firstName_label',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get profile_edit_firstName_button_save {
    return Intl.message(
      'Save',
      name: 'profile_edit_firstName_button_save',
      desc: '',
      args: [],
    );
  }

  /// `-------------------------------------`
  String get profile_edit_end {
    return Intl.message(
      '-------------------------------------',
      name: 'profile_edit_end',
      desc: '',
      args: [],
    );
  }

  /// `---------------------------------`
  String get password_start {
    return Intl.message(
      '---------------------------------',
      name: 'password_start',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get password_title {
    return Intl.message(
      'Change password',
      name: 'password_title',
      desc: '',
      args: [],
    );
  }

  /// `Your password change successful!`
  String get password_success {
    return Intl.message(
      'Your password change successful!',
      name: 'password_success',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get password_current {
    return Intl.message(
      'Current password',
      name: 'password_current',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get password_new {
    return Intl.message(
      'New password',
      name: 'password_new',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password`
  String get password_repeat {
    return Intl.message(
      'Repeat password',
      name: 'password_repeat',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get password_error_wrong {
    return Intl.message(
      'Passwords do not match',
      name: 'password_error_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password is required`
  String get password_error_required {
    return Intl.message(
      'Repeat password is required',
      name: 'password_error_required',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get password_button_save {
    return Intl.message(
      'Save',
      name: 'password_button_save',
      desc: '',
      args: [],
    );
  }

  /// `-------------------------`
  String get password_end {
    return Intl.message(
      '-------------------------',
      name: 'password_end',
      desc: '',
      args: [],
    );
  }

  /// `---------------------------------`
  String get avatar_start {
    return Intl.message(
      '---------------------------------',
      name: 'avatar_start',
      desc: '',
      args: [],
    );
  }

  /// `Profile image`
  String get avatar_title {
    return Intl.message(
      'Profile image',
      name: 'avatar_title',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get avatar_change_avatar {
    return Intl.message(
      'Change',
      name: 'avatar_change_avatar',
      desc: '',
      args: [],
    );
  }

  /// `Change profile image successful`
  String get avatar_change_success {
    return Intl.message(
      'Change profile image successful',
      name: 'avatar_change_success',
      desc: '',
      args: [],
    );
  }

  /// `-----------------------------------`
  String get avatar_end {
    return Intl.message(
      '-----------------------------------',
      name: 'avatar_end',
      desc: '',
      args: [],
    );
  }

  /// `----------------------------------------`
  String get store_info_start {
    return Intl.message(
      '----------------------------------------',
      name: 'store_info_start',
      desc: '',
      args: [],
    );
  }

  /// `Store information`
  String get store_info_title {
    return Intl.message(
      'Store information',
      name: 'store_info_title',
      desc: '',
      args: [],
    );
  }

  /// `Update store successful`
  String get store_info_update_success {
    return Intl.message(
      'Update store successful',
      name: 'store_info_update_success',
      desc: '',
      args: [],
    );
  }

  /// `Review in app`
  String get store_info_review {
    return Intl.message(
      'Review in app',
      name: 'store_info_review',
      desc: '',
      args: [],
    );
  }

  /// `Avatar settings`
  String get store_info_avatar {
    return Intl.message(
      'Avatar settings',
      name: 'store_info_avatar',
      desc: '',
      args: [],
    );
  }

  /// `Change avatar`
  String get store_info_change_avatar {
    return Intl.message(
      'Change avatar',
      name: 'store_info_change_avatar',
      desc: '',
      args: [],
    );
  }

  /// `Informations`
  String get store_info_information {
    return Intl.message(
      'Informations',
      name: 'store_info_information',
      desc: '',
      args: [],
    );
  }

  /// `Store name`
  String get store_info_name {
    return Intl.message(
      'Store name',
      name: 'store_info_name',
      desc: '',
      args: [],
    );
  }

  /// `Open time`
  String get store_info_open {
    return Intl.message(
      'Open time',
      name: 'store_info_open',
      desc: '',
      args: [],
    );
  }

  /// `Close time`
  String get store_info_close {
    return Intl.message(
      'Close time',
      name: 'store_info_close',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get store_info_rate {
    return Intl.message(
      'Rating',
      name: 'store_info_rate',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get store_info_catregories {
    return Intl.message(
      'Categories',
      name: 'store_info_catregories',
      desc: '',
      args: [],
    );
  }

  /// `Change avatar`
  String get store_avatar_title {
    return Intl.message(
      'Change avatar',
      name: 'store_avatar_title',
      desc: '',
      args: [],
    );
  }

  /// `Picture Change Successfully`
  String get store_avatar_success {
    return Intl.message(
      'Picture Change Successfully',
      name: 'store_avatar_success',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get store_avatar_change {
    return Intl.message(
      'Change',
      name: 'store_avatar_change',
      desc: '',
      args: [],
    );
  }

  /// `liked`
  String get store_order_like {
    return Intl.message(
      'liked',
      name: 'store_order_like',
      desc: '',
      args: [],
    );
  }

  /// `comments`
  String get store_order_comments {
    return Intl.message(
      'comments',
      name: 'store_order_comments',
      desc: '',
      args: [],
    );
  }

  /// `min`
  String get store_order_min {
    return Intl.message(
      'min',
      name: 'store_order_min',
      desc: '',
      args: [],
    );
  }

  /// `Add new product`
  String get store_product_add_title {
    return Intl.message(
      'Add new product',
      name: 'store_product_add_title',
      desc: '',
      args: [],
    );
  }

  /// `Product added successfully`
  String get store_product_add_success {
    return Intl.message(
      'Product added successfully',
      name: 'store_product_add_success',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get store_product_add_button_save {
    return Intl.message(
      'Save',
      name: 'store_product_add_button_save',
      desc: '',
      args: [],
    );
  }

  /// `Store name`
  String get store_product_add_store_name {
    return Intl.message(
      'Store name',
      name: 'store_product_add_store_name',
      desc: '',
      args: [],
    );
  }

  /// `Product name`
  String get store_product_add_product_name {
    return Intl.message(
      'Product name',
      name: 'store_product_add_product_name',
      desc: '',
      args: [],
    );
  }

  /// `Product name`
  String get store_product_add_product_hint {
    return Intl.message(
      'Product name',
      name: 'store_product_add_product_hint',
      desc: '',
      args: [],
    );
  }

  /// `Product name is required`
  String get store_product_add_product_name_error {
    return Intl.message(
      'Product name is required',
      name: 'store_product_add_product_name_error',
      desc: '',
      args: [],
    );
  }

  /// `Product description`
  String get store_product_add_product_description {
    return Intl.message(
      'Product description',
      name: 'store_product_add_product_description',
      desc: '',
      args: [],
    );
  }

  /// `Product description is required`
  String get store_product_add_product_description_error {
    return Intl.message(
      'Product description is required',
      name: 'store_product_add_product_description_error',
      desc: '',
      args: [],
    );
  }

  /// `Picture`
  String get store_product_add_picture {
    return Intl.message(
      'Picture',
      name: 'store_product_add_picture',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get store_product_add_category {
    return Intl.message(
      'Category',
      name: 'store_product_add_category',
      desc: '',
      args: [],
    );
  }

  /// `Select category`
  String get store_product_add_category_select {
    return Intl.message(
      'Select category',
      name: 'store_product_add_category_select',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get store_product_add_price {
    return Intl.message(
      'Price',
      name: 'store_product_add_price',
      desc: '',
      args: [],
    );
  }

  /// `00.00$`
  String get store_product_add_price_hint {
    return Intl.message(
      '00.00\$',
      name: 'store_product_add_price_hint',
      desc: '',
      args: [],
    );
  }

  /// `Price is required`
  String get store_product_add_price_erorr {
    return Intl.message(
      'Price is required',
      name: 'store_product_add_price_erorr',
      desc: '',
      args: [],
    );
  }

  /// `Product updated successfully!`
  String get store_product_update_success {
    return Intl.message(
      'Product updated successfully!',
      name: 'store_product_update_success',
      desc: '',
      args: [],
    );
  }

  /// `Update product`
  String get store_product_update_title {
    return Intl.message(
      'Update product',
      name: 'store_product_update_title',
      desc: '',
      args: [],
    );
  }

  /// `----------------------------------------`
  String get store_info_end {
    return Intl.message(
      '----------------------------------------',
      name: 'store_info_end',
      desc: '',
      args: [],
    );
  }

  /// `---------------------------------`
  String get client_location_start {
    return Intl.message(
      '---------------------------------',
      name: 'client_location_start',
      desc: '',
      args: [],
    );
  }

  /// `Please enable location to use Cena Foodie`
  String get client_location_error {
    return Intl.message(
      'Please enable location to use Cena Foodie',
      name: 'client_location_error',
      desc: '',
      args: [],
    );
  }

  /// `Cena Foodie is not allowed to access location`
  String get client_location_permition_error {
    return Intl.message(
      'Cena Foodie is not allowed to access location',
      name: 'client_location_permition_error',
      desc: '',
      args: [],
    );
  }

  /// `Location permission is permanently denied, Cena Foodie cannot claim permission`
  String get client_location_permition_disabled {
    return Intl.message(
      'Location permission is permanently denied, Cena Foodie cannot claim permission',
      name: 'client_location_permition_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Good morning`
  String get client_home_good_morning {
    return Intl.message(
      'Good morning',
      name: 'client_home_good_morning',
      desc: '',
      args: [],
    );
  }

  /// `Good afternoon`
  String get client_home_good_afternoon {
    return Intl.message(
      'Good afternoon',
      name: 'client_home_good_afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good night`
  String get client_home_good_night {
    return Intl.message(
      'Good night',
      name: 'client_home_good_night',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get client_home_good {
    return Intl.message(
      'Good',
      name: 'client_home_good',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to ear or drink today?`
  String get client_home_question {
    return Intl.message(
      'What do you want to ear or drink today?',
      name: 'client_home_question',
      desc: '',
      args: [],
    );
  }

  /// `Address revieve`
  String get client_home_address_title {
    return Intl.message(
      'Address revieve',
      name: 'client_home_address_title',
      desc: '',
      args: [],
    );
  }

  /// `Without address`
  String get client_home_without_address {
    return Intl.message(
      'Without address',
      name: 'client_home_without_address',
      desc: '',
      args: [],
    );
  }

  /// `Store near by`
  String get client_home_store_near_you {
    return Intl.message(
      'Store near by',
      name: 'client_home_store_near_you',
      desc: '',
      args: [],
    );
  }

  /// `Looking for your lacation ...`
  String get client_home_looking_for_address {
    return Intl.message(
      'Looking for your lacation ...',
      name: 'client_home_looking_for_address',
      desc: '',
      args: [],
    );
  }

  /// `sold`
  String get client_store_food_row_sold {
    return Intl.message(
      'sold',
      name: 'client_store_food_row_sold',
      desc: '',
      args: [],
    );
  }

  /// `liked`
  String get client_store_food_row_liked {
    return Intl.message(
      'liked',
      name: 'client_store_food_row_liked',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get client_store_order_item {
    return Intl.message(
      'items',
      name: 'client_store_order_item',
      desc: '',
      args: [],
    );
  }

  /// `List address`
  String get client_address_title {
    return Intl.message(
      'List address',
      name: 'client_address_title',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get client_address_button_add {
    return Intl.message(
      'Add',
      name: 'client_address_button_add',
      desc: '',
      args: [],
    );
  }

  /// `Without address`
  String get client_address_without_address {
    return Intl.message(
      'Without address',
      name: 'client_address_without_address',
      desc: '',
      args: [],
    );
  }

  /// `Confirm delete`
  String get client_address_dialog_title {
    return Intl.message(
      'Confirm delete',
      name: 'client_address_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure delete this address?`
  String get client_address_dialog_message {
    return Intl.message(
      'Are you sure delete this address?',
      name: 'client_address_dialog_message',
      desc: '',
      args: [],
    );
  }

  /// `DO NOT`
  String get client_address_dialog_no {
    return Intl.message(
      'DO NOT',
      name: 'client_address_dialog_no',
      desc: '',
      args: [],
    );
  }

  /// `DELETE`
  String get client_address_dialog_yes {
    return Intl.message(
      'DELETE',
      name: 'client_address_dialog_yes',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get client_address_button_edit {
    return Intl.message(
      'Edit',
      name: 'client_address_button_edit',
      desc: '',
      args: [],
    );
  }

  /// `Update cart`
  String get client_product_detail_update {
    return Intl.message(
      'Update cart',
      name: 'client_product_detail_update',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get client_product_detail_add {
    return Intl.message(
      'Add to cart',
      name: 'client_product_detail_add',
      desc: '',
      args: [],
    );
  }

  /// `SoldOut`
  String get client_product_detail_soldout {
    return Intl.message(
      'SoldOut',
      name: 'client_product_detail_soldout',
      desc: '',
      args: [],
    );
  }

  /// `My orders`
  String get client_cart_checkout_appbar_header {
    return Intl.message(
      'My orders',
      name: 'client_cart_checkout_appbar_header',
      desc: '',
      args: [],
    );
  }

  /// `Waiting ....`
  String get client_cart_checkout_looking_for {
    return Intl.message(
      'Waiting ....',
      name: 'client_cart_checkout_looking_for',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get client_cart_checkout_items {
    return Intl.message(
      'items',
      name: 'client_cart_checkout_items',
      desc: '',
      args: [],
    );
  }

  /// `Delete items from cart`
  String get client_cart_checkout_dialog_tile {
    return Intl.message(
      'Delete items from cart',
      name: 'client_cart_checkout_dialog_tile',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to remove them from the cart?`
  String get client_cart_checkout_dialog_message {
    return Intl.message(
      'Do you want to remove them from the cart?',
      name: 'client_cart_checkout_dialog_message',
      desc: '',
      args: [],
    );
  }

  /// `KEEP`
  String get client_cart_checkout_dialog_confirm_no {
    return Intl.message(
      'KEEP',
      name: 'client_cart_checkout_dialog_confirm_no',
      desc: '',
      args: [],
    );
  }

  /// `REMOVE ITS`
  String get client_cart_checkout_diolog_confirm_yes {
    return Intl.message(
      'REMOVE ITS',
      name: 'client_cart_checkout_diolog_confirm_yes',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get client_cart_checkout_total {
    return Intl.message(
      'Total',
      name: 'client_cart_checkout_total',
      desc: '',
      args: [],
    );
  }

  /// `Promotion & Payment`
  String get client_cart_checkout_button_checkout {
    return Intl.message(
      'Promotion & Payment',
      name: 'client_cart_checkout_button_checkout',
      desc: '',
      args: [],
    );
  }

  /// `Without product`
  String get client_cart_checkout_without_product {
    return Intl.message(
      'Without product',
      name: 'client_cart_checkout_without_product',
      desc: '',
      args: [],
    );
  }

  /// `Order successfully!`
  String get client_payment_success {
    return Intl.message(
      'Order successfully!',
      name: 'client_payment_success',
      desc: '',
      args: [],
    );
  }

  /// `Checkout order`
  String get client_payment_title {
    return Intl.message(
      'Checkout order',
      name: 'client_payment_title',
      desc: '',
      args: [],
    );
  }

  /// `Free ship`
  String get client_payment_promotion_freeship {
    return Intl.message(
      'Free ship',
      name: 'client_payment_promotion_freeship',
      desc: '',
      args: [],
    );
  }

  /// `Order detail`
  String get client_payment_order_detail {
    return Intl.message(
      'Order detail',
      name: 'client_payment_order_detail',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get client_payment_total_items {
    return Intl.message(
      'Total',
      name: 'client_payment_total_items',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get client_payment_items {
    return Intl.message(
      'items',
      name: 'client_payment_items',
      desc: '',
      args: [],
    );
  }

  /// `VAT + service fee`
  String get client_payment_fee_vat {
    return Intl.message(
      'VAT + service fee',
      name: 'client_payment_fee_vat',
      desc: '',
      args: [],
    );
  }

  /// `Fee shipping`
  String get client_payment_fee_shipping {
    return Intl.message(
      'Fee shipping',
      name: 'client_payment_fee_shipping',
      desc: '',
      args: [],
    );
  }

  /// `Promotions`
  String get client_payment_promotion_title {
    return Intl.message(
      'Promotions',
      name: 'client_payment_promotion_title',
      desc: '',
      args: [],
    );
  }

  /// `Total order`
  String get client_payment_total_order {
    return Intl.message(
      'Total order',
      name: 'client_payment_total_order',
      desc: '',
      args: [],
    );
  }

  /// `Payment methods`
  String get client_payment_payment_method {
    return Intl.message(
      'Payment methods',
      name: 'client_payment_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Address delivery`
  String get client_payment_address_delivery {
    return Intl.message(
      'Address delivery',
      name: 'client_payment_address_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Non address`
  String get client_payment_address_non {
    return Intl.message(
      'Non address',
      name: 'client_payment_address_non',
      desc: '',
      args: [],
    );
  }

  /// `Select address`
  String get client_payment_address_select {
    return Intl.message(
      'Select address',
      name: 'client_payment_address_select',
      desc: '',
      args: [],
    );
  }

  /// `Receiver`
  String get client_payment_receiver {
    return Intl.message(
      'Receiver',
      name: 'client_payment_receiver',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get client_payment_note {
    return Intl.message(
      'Note',
      name: 'client_payment_note',
      desc: '',
      args: [],
    );
  }

  /// `ORDER ID`
  String get client_orders_key {
    return Intl.message(
      'ORDER ID',
      name: 'client_orders_key',
      desc: '',
      args: [],
    );
  }

  /// `TOTAL`
  String get client_orders_total {
    return Intl.message(
      'TOTAL',
      name: 'client_orders_total',
      desc: '',
      args: [],
    );
  }

  /// `SHIPPER`
  String get client_orders_shipper {
    return Intl.message(
      'SHIPPER',
      name: 'client_orders_shipper',
      desc: '',
      args: [],
    );
  }

  /// `UnAssign`
  String get client_orders_unasignee {
    return Intl.message(
      'UnAssign',
      name: 'client_orders_unasignee',
      desc: '',
      args: [],
    );
  }

  /// `DATE`
  String get client_orders_date {
    return Intl.message(
      'DATE',
      name: 'client_orders_date',
      desc: '',
      args: [],
    );
  }

  /// `ADDRESS`
  String get client_orders_address {
    return Intl.message(
      'ADDRESS',
      name: 'client_orders_address',
      desc: '',
      args: [],
    );
  }

  /// `FOLLOW IN MAP`
  String get client_orders_button_follow_shipper {
    return Intl.message(
      'FOLLOW IN MAP',
      name: 'client_orders_button_follow_shipper',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get client_orders_count {
    return Intl.message(
      'Quantity',
      name: 'client_orders_count',
      desc: '',
      args: [],
    );
  }

  /// `My orders`
  String get client_orders_home_title {
    return Intl.message(
      'My orders',
      name: 'client_orders_home_title',
      desc: '',
      args: [],
    );
  }

  /// `ORDER ID`
  String get client_orders_home_key {
    return Intl.message(
      'ORDER ID',
      name: 'client_orders_home_key',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get client_orders_home_total {
    return Intl.message(
      'Total',
      name: 'client_orders_home_total',
      desc: '',
      args: [],
    );
  }

  /// `Payment type`
  String get client_orders_home_payment_type {
    return Intl.message(
      'Payment type',
      name: 'client_orders_home_payment_type',
      desc: '',
      args: [],
    );
  }

  /// `Receiver`
  String get client_orders_home_receiver {
    return Intl.message(
      'Receiver',
      name: 'client_orders_home_receiver',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get client_orders_home_time {
    return Intl.message(
      'Time',
      name: 'client_orders_home_time',
      desc: '',
      args: [],
    );
  }

  /// `Shipper`
  String get client_orders_home_shipper {
    return Intl.message(
      'Shipper',
      name: 'client_orders_home_shipper',
      desc: '',
      args: [],
    );
  }

  /// `Quantity of orders`
  String get client_orders_home_quantity_cart {
    return Intl.message(
      'Quantity of orders',
      name: 'client_orders_home_quantity_cart',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get client_orders_home_items {
    return Intl.message(
      'items',
      name: 'client_orders_home_items',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get client_orders_home_amount {
    return Intl.message(
      'Amount',
      name: 'client_orders_home_amount',
      desc: '',
      args: [],
    );
  }

  /// `---------------------------------`
  String get client_location_end {
    return Intl.message(
      '---------------------------------',
      name: 'client_location_end',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------------------`
  String get auth_start {
    return Intl.message(
      '--------------------------------------',
      name: 'auth_start',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OTP!`
  String get auth_verify_phone_error_invalid_otp {
    return Intl.message(
      'Invalid OTP!',
      name: 'auth_verify_phone_error_invalid_otp',
      desc: '',
      args: [],
    );
  }

  /// `Your OTP was expired`
  String get auth_verify_phone_error_expired {
    return Intl.message(
      'Your OTP was expired',
      name: 'auth_verify_phone_error_expired',
      desc: '',
      args: [],
    );
  }

  /// `Cannot connect OTP Server, please try other ways!`
  String get auth_verify_phone_error_server_otp {
    return Intl.message(
      'Cannot connect OTP Server, please try other ways!',
      name: 'auth_verify_phone_error_server_otp',
      desc: '',
      args: [],
    );
  }

  /// `Your phone invalid`
  String get auth_verify_phone_error_invalid_phone {
    return Intl.message(
      'Your phone invalid',
      name: 'auth_verify_phone_error_invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Your device have too many request OTP`
  String get auth_verify_phone_error_too_many_request {
    return Intl.message(
      'Your device have too many request OTP',
      name: 'auth_verify_phone_error_too_many_request',
      desc: '',
      args: [],
    );
  }

  /// `Identify by PhoneNumber`
  String get auth_verify_phone_title {
    return Intl.message(
      'Identify by PhoneNumber',
      name: 'auth_verify_phone_title',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number Verification`
  String get auth_verify_phone_verify_info {
    return Intl.message(
      'Phone Number Verification',
      name: 'auth_verify_phone_verify_info',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to `
  String get auth_verify_phone_enter_your_otp {
    return Intl.message(
      'Enter the code sent to ',
      name: 'auth_verify_phone_enter_your_otp',
      desc: '',
      args: [],
    );
  }

  /// `*Please fill up all the cells properly`
  String get auth_verify_phone_enter_full_otp {
    return Intl.message(
      '*Please fill up all the cells properly',
      name: 'auth_verify_phone_enter_full_otp',
      desc: '',
      args: [],
    );
  }

  /// `Did not receive the code? `
  String get auth_verify_phone_did_not_recieve_otp {
    return Intl.message(
      'Did not receive the code? ',
      name: 'auth_verify_phone_did_not_recieve_otp',
      desc: '',
      args: [],
    );
  }

  /// `RESEND`
  String get auth_verify_phone_button_resend {
    return Intl.message(
      'RESEND',
      name: 'auth_verify_phone_button_resend',
      desc: '',
      args: [],
    );
  }

  /// `Please waiting for verify!`
  String get auth_verify_phone_please_wait_verify_phone {
    return Intl.message(
      'Please waiting for verify!',
      name: 'auth_verify_phone_please_wait_verify_phone',
      desc: '',
      args: [],
    );
  }

  /// `VERIFY`
  String get auth_verify_phone_button_verify {
    return Intl.message(
      'VERIFY',
      name: 'auth_verify_phone_button_verify',
      desc: '',
      args: [],
    );
  }

  /// `Register successfully!`
  String get auth_registry_success {
    return Intl.message(
      'Register successfully!',
      name: 'auth_registry_success',
      desc: '',
      args: [],
    );
  }

  /// `Email already exists`
  String get auth_registry_exist_email {
    return Intl.message(
      'Email already exists',
      name: 'auth_registry_exist_email',
      desc: '',
      args: [],
    );
  }

  /// `Phone already exists`
  String get auth_registry_exist_phone {
    return Intl.message(
      'Phone already exists',
      name: 'auth_registry_exist_phone',
      desc: '',
      args: [],
    );
  }

  /// `FirstName have special character`
  String get auth_registry_have_special_character_firstName {
    return Intl.message(
      'FirstName have special character',
      name: 'auth_registry_have_special_character_firstName',
      desc: '',
      args: [],
    );
  }

  /// `LastName have special character`
  String get auth_registry_have_special_character_lastName {
    return Intl.message(
      'LastName have special character',
      name: 'auth_registry_have_special_character_lastName',
      desc: '',
      args: [],
    );
  }

  /// `Must choose a picture`
  String get auth_registry_must_select_avatar {
    return Intl.message(
      'Must choose a picture',
      name: 'auth_registry_must_select_avatar',
      desc: '',
      args: [],
    );
  }

  /// `Have some error in server, please try again`
  String get auth_registry_error_server {
    return Intl.message(
      'Have some error in server, please try again',
      name: 'auth_registry_error_server',
      desc: '',
      args: [],
    );
  }

  /// `Phone is required`
  String get auth_registry_error_phone_required {
    return Intl.message(
      'Phone is required',
      name: 'auth_registry_error_phone_required',
      desc: '',
      args: [],
    );
  }

  /// `Enter the correct phone number format`
  String get auth_registry_error_phone_must_10_digits {
    return Intl.message(
      'Enter the correct phone number format',
      name: 'auth_registry_error_phone_must_10_digits',
      desc: '',
      args: [],
    );
  }

  /// `Enter the correct email`
  String get auth_registry_error_email_invalid {
    return Intl.message(
      'Enter the correct email',
      name: 'auth_registry_error_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get auth_registry_error_email_required {
    return Intl.message(
      'Email is required',
      name: 'auth_registry_error_email_required',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get auth_registry_error_password_required {
    return Intl.message(
      'Password is required',
      name: 'auth_registry_error_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Password not less than 10 chacracter`
  String get auth_registry_error_password_minimum_10_characters {
    return Intl.message(
      'Password not less than 10 chacracter',
      name: 'auth_registry_error_password_minimum_10_characters',
      desc: '',
      args: [],
    );
  }

  /// `Choose picture`
  String get auth_registry_picture {
    return Intl.message(
      'Choose picture',
      name: 'auth_registry_picture',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------------------`
  String get auth_end {
    return Intl.message(
      '--------------------------------------',
      name: 'auth_end',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
