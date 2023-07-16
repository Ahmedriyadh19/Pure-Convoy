import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_convoy/MainPage/bloc/main_page_bloc_bloc.dart';
import 'package:pure_convoy/MainPage/widget/clean_button_main_page.dart';
import 'package:pure_convoy/MainPage/widget/copy_button_main_page.dart';
import 'package:pure_convoy/MainPage/widget/text_input_main_page.dart';

class MainPageUi extends StatelessWidget {
  const MainPageUi({super.key});

  AppBar upBar() {
    return AppBar(
      title: const Text('Pure Convoy'),
      centerTitle: true,
    );
  }

  Row options() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CleanButtonMainPage(),
        CopyButtonMainPage(),
      ],
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        shrinkWrap: true,
        children: [const TextInputMainPage(), options()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageBlocBloc(),
      child: Scaffold(
        appBar: upBar(),
        body: body(),
      ),
    );
  }
}
