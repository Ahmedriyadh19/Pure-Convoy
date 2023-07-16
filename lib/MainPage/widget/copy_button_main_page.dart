import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_convoy/MainPage/bloc/main_page_bloc_bloc.dart';
import 'package:pure_convoy/MainPage/events/copy_button_event_main_page.dart';
import 'package:pure_convoy/MainPage/states/states_changes_main_page.dart';

class CopyButtonMainPage extends StatelessWidget {
  const CopyButtonMainPage({super.key});

  Row icon() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.copy_rounded),
        Text('Clear & copy'),
      ],
    );
  }

  dynamic successfulMsg({
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 1),
      content: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.copy_rounded,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Copied to clipboard'),
        ],
      )),
    ));
  }

  dynamic emptyMsg({
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 1),
      content: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Empty text'),
        ],
      )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<MainPageBlocBloc, MainPageBlocState>(
        builder: (context, state) {
          return ElevatedButton(
              onPressed: () {
                context.read<MainPageBlocBloc>().add(CopyButtonMainPageEvent());
                state is StatesChangesMainPage && state.text.isNotEmpty ? successfulMsg(context: context) : emptyMsg(context: context);
              },
              child: icon());
        },
      ),
    );
  }
}
