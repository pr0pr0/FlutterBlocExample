import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Helper/Hive/AdapterHelper.dart';
import 'package:foodapp/Helper/Routes/AppRoutes.dart';
import 'package:foodapp/Helper/Routes/AppRouting.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  intiHiveDB().whenComplete(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [...AppRouting.blocs(context)],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        title: '',
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [AppRouting.observer],
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRouting.generateRouteSetting,
      ),
    );
  }
}

Future<void> intiHiveDB() async {
  await Hive.initFlutter();
   AdapterHelper().adapter();
}
