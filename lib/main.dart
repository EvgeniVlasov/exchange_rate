import 'package:exchange_rates/providers/local_storage_provider.dart';
import 'package:exchange_rates/providers/remote_data_provider.dart';
import 'package:exchange_rates/rouiting/app_pages.dart';
import 'package:exchange_rates/servises/main_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final remoteDataProvider = RemoteDataProvider();
  final localStorageProvider =
      LocalStorageProvider(await SharedPreferences.getInstance());
  Get.put<MainService>(MainService(
      remoteDataProvider: remoteDataProvider,
      localStorageProvider: localStorageProvider));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        primaryColor: Colors.deepPurple,
      ),
      initialRoute: AppPages.main,
      getPages: AppPages.pages,
    );
  }
}
