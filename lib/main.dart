import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_webapp/colors.dart';
import 'package:my_webapp/pages/home_page/home_page.dart';
import 'data/bloc/places/places_bloc.dart';
import 'data/repositories/places_repository.dart';
import 'firebase_options.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('ru'),
      startLocale: const Locale('ru'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return RepositoryProvider(
      create: (context) =>
          PlacesRepository(firebaseFirestore: FirebaseFirestore.instance),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PlacesBloc(placesRepository: context.read<PlacesRepository>())..add(TakePlacesEvent()),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              iconTheme: IconThemeData(size: width / 30, color: itemIconsColor),
              textTheme: TextTheme(
                  bodySmall: const TextStyle(fontSize: 12),
                  bodyMedium: const TextStyle(fontSize: 14),
                  bodyLarge: TextStyle(
                      fontSize: width / 58,
                      color: bodyLargeColor,
                      fontWeight: FontWeight.bold),
                  displayLarge:
                      TextStyle(fontSize: width / 30, color: titleColor))),
          // darkTheme: ThemeData.dark(),
          home: const HomePage(),
        ),
      ),
    );
  }
}

