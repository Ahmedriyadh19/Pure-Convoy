import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_convoy/MainPage/bloc/events/clean_button_event_main_page.dart';
import 'package:pure_convoy/MainPage/bloc/main_page_bloc_bloc.dart';

class CleanButtonMainPage extends StatelessWidget {
  const CleanButtonMainPage({super.key});

  Row icon() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.clear_rounded),
        Text('Clear the area'),
      ],
    );
  }

  dynamic successfulMsg({required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 1),
      content: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.clear_rounded,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Cleared Text area'),
        ],
      )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
          onPressed: () {
            context.read<MainPageBlocBloc>().add(CleanButtonMainPageEvent());
            successfulMsg(context: context);
          },
          child: icon()),
    );
  }
}
