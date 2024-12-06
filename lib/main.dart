import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wepsysproject_task_managment_app/blocs/bloc_exports.dart';
import 'package:wepsysproject_task_managment_app/screens/tabs_page.dart';
import 'package:wepsysproject_task_managment_app/services/app_router.dart';
import 'package:wepsysproject_task_managment_app/services/app_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(
          create: (context) => SwitchBloc(),
        )
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'task managment',
            debugShowCheckedModeBanner: false,
            theme: state.switchValue? AppThemes.appThemeData[AppTheme.lightTheme]:
            AppThemes.appThemeData[AppTheme.darkTheme],
            home: const TabsPage(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
