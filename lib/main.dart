import 'package:app_enum_hydrated_bloc/blocs/selected/selected_bloc.dart';
import 'package:app_enum_hydrated_bloc/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

// Flutter Example: Using New Flutter Enums with Hydrated Bloc
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(RepositoryProvider(
      create: (context) => SelectedBloc(),
      child: const MyApp(),
    )),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedBloc(),
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
