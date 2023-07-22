import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_convoy/MainPage/bloc/events/get_input_text_event_main_page.dart';
import 'package:pure_convoy/MainPage/bloc/main_page_bloc_bloc.dart';
import 'package:pure_convoy/MainPage/bloc/states/states_changes_main_page.dart';

class TextInputMainPage extends StatelessWidget {
  const TextInputMainPage({super.key});

  InputDecoration boxDecoration() {
    return const InputDecoration(
        filled: true,
        fillColor: Colors.brown,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.brown),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.grey),
        hintText: 'Enter your text here');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BlocBuilder<MainPageBlocBloc, MainPageBlocState>(
        builder: (context, state) {
          return TextFormField(
              keyboardType: TextInputType.multiline,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              maxLines: 8,
              autocorrect: true,
              decoration: boxDecoration(),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                context.read<MainPageBlocBloc>().add(GetTextInputMainPageEvent(text: value));
              },
              controller: state is StatesChangesMainPage && state.isCleared ? TextEditingController() : null);
        },
      ),
    );
  }
}
