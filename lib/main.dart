import 'package:flutter/material.dart';
import 'package:flutter_cov19_app/app/services/api.dart';
import 'package:flutter_cov19_app/app/services/api_service.dart';
import 'package:flutter_cov19_app/repositories/data_repository.dart';
import 'package:flutter_cov19_app/ui/dashboard.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() async {
  Intl.defaultLocale = 'en_GB';
  await initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(apiService: APIService(API.sandbox())),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'COV-19 Tracker',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF101010),
            cardColor: Color(0xFF222222),
          ),
          home: Dashboard()),
    );
  }
}
