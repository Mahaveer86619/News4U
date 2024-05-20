import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news4u/config/theme/theme.dart';
import 'package:news4u/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news4u/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news4u/features/daily_news/presentation/screens/home/home_screen.dart';
import 'package:news4u/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetTopHeadlines()),
      child: MaterialApp(
        title: 'news4u',
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        darkTheme: darkMode,
        home: const SafeArea(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
