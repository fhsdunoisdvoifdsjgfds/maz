import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import 'adapters.dart';
import '../models/inc_exp.dart';
import '../models/profile.dart';

int timestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String dateToString(DateTime date) {
  return DateFormat('MMM dd yyyy').format(date);
}

String formatNumber(int number) {
  return '\$ ${NumberFormat('#,###').format(number).replaceAll(',', ' ')}';
}

double statusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

List<IncExp> incexpList = [];
bool onboard = true;
int userId = 0;
Profile profile = Profile(
  name: '',
  email: '',
  username: '',
  image: '',
);

Future<int> getRandomId() async {
  final random = Random();
  int randomNumber = 1000 + random.nextInt(4001);
  await SharedPreferences.getInstance().then((prefs) {
    prefs.setInt('userId', randomNumber);
  });
  return randomNumber;
}

Future getData() async {
  await SharedPreferences.getInstance().then((prefs) async {
    userId = prefs.getInt('userId') ?? await getRandomId();
    onboard = prefs.getBool('onboard') ?? true;
    profile.name = prefs.getString('profileName') ?? '';
    profile.email = prefs.getString('profileEmail') ?? '';
    profile.username = prefs.getString('profileUsername') ?? '';
    profile.image = prefs.getString('profileImage') ?? '';
  });
}

Future saveOnboarding() async {
  await SharedPreferences.getInstance().then((prefs) {
    prefs.setBool('onboard', false);
  });
}

Future saveProfile(Profile model) async {
  await SharedPreferences.getInstance().then((prefs) {
    profile = model;
    prefs.setString('profileName', model.name);
    prefs.setString('profileEmail', model.email);
    prefs.setString('profileUsername', model.username);
    prefs.setString('profileImage', model.image);
  });
}

Future initDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(IncExpAdapter());
  await getData();
}

Future getModelss() async {
  final boxxx = await Hive.openBox('incexpgbox');
  List data = boxxx.get('incexpList') ?? [];
  incexpList = data.cast<IncExp>();
}

Future updateModelss() async {
  final boxxx = await Hive.openBox('incexpgbox');
  boxxx.put('incexpList', incexpList);
  incexpList = await boxxx.get('incexpList');
}

String getCategoryAsset(String cat) {
  if (cat == 'Investment') return 'assets/cat1.svg';
  if (cat == 'Food') return 'assets/cat2.svg';
  if (cat == 'Transport') return 'assets/cat3.svg';
  if (cat == 'Procurement') return 'assets/cat4.svg';
  if (cat == 'Rest') return 'assets/cat5.svg';
  if (cat == 'Passive') return 'assets/cat6.svg';
  if (cat == 'Salary') return 'assets/cat7.svg';
  if (cat == 'Rent') return 'assets/cat8.svg';
  if (cat == 'Business') return 'assets/cat9.svg';
  if (cat == 'Freelance') return 'assets/cat10.svg';
  if (cat == 'Investment ') return 'assets/cat11.svg';
  if (cat == 'Dividends') return 'assets/cat12.svg';
  if (cat == 'Royalty') return 'assets/cat13.svg';
  return 'assets/cat1.svg';
}

List<String> getCategories(bool isIncome) {
  return isIncome
      ? [
          'Passive',
          'Salary',
          'Rent',
          'Business',
          'Freelance',
          'Investment ',
          'Dividends',
          'Royalty',
        ]
      : [
          'Investment',
          'Food',
          'Transport',
          'Procurement',
          'Rest',
        ];
}

String getCurrentWeekday() {
  return DateFormat('E').format(DateTime.now());
}

int getTotalAmount() {
  int incomes = 0;
  int expenses = 0;
  for (IncExp model in incexpList) {
    model.isIncome ? incomes += model.amount : expenses += model.amount;
  }
  return incomes - expenses;
}

double getTodayAmount(bool isIncome) {
  final today = DateTime.now();
  return incexpList.where((model) {
    final date = DateTime.fromMillisecondsSinceEpoch(model.id * 1000);
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day &&
        model.isIncome == isIncome;
  }).fold(0, (sum, model) => sum + model.amount);
}

List<double> getWeekAmounts(bool isIncome) {
  final now = DateTime.now();
  final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  List<double> weeklyAmounts = List.filled(7, 0);
  for (var model in incexpList) {
    final date = DateTime.fromMillisecondsSinceEpoch(model.id * 1000);
    if (date.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
        date.isBefore(startOfWeek.add(const Duration(days: 7))) &&
        model.isIncome == isIncome) {
      int weekdayIndex = date.weekday - 1;
      weeklyAmounts[weekdayIndex] += model.amount;
    }
  }
  return weeklyAmounts;
}

List<double> getMonthAmounts(bool isIncome) {
  final today = DateTime.now();
  final List<double> weeklyAmounts = List.filled(4, 0.0);
  for (final model in incexpList) {
    final date = DateTime.fromMillisecondsSinceEpoch(model.id * 1000);
    if (date.year == today.year &&
        date.month == today.month &&
        model.isIncome == isIncome) {
      final weekIndex = ((date.day - 1) ~/ 7);
      weeklyAmounts[weekIndex] += model.amount;
    }
  }
  return weeklyAmounts;
}
