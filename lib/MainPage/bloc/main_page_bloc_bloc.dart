import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pure_convoy/MainPage/events/clean_button_event_main_page.dart';
import 'package:pure_convoy/MainPage/events/copy_button_event_main_page.dart';
import 'package:pure_convoy/MainPage/events/get_input_text_event_main_page.dart';
import 'package:pure_convoy/MainPage/models/converter_string.dart';
import 'package:pure_convoy/MainPage/states/states_changes_main_page.dart';

part 'main_page_bloc_event.dart';
part 'main_page_bloc_state.dart';

class MainPageBlocBloc extends Bloc<MainPageBlocEvent, MainPageBlocState> {
  String text = '';
  MainPageBlocBloc() : super(MainPageBlocInitial()) {
    on<MainPageBlocEvent>((event, emit) {
      if (event is CopyButtonMainPageEvent) {
        if (text.isNotEmpty || text != '') {
          ConverterString converter = ConverterString(text: text);
          converter.copyToClipboard();
          emit(
            StatesChangesMainPage(text: converter.getText(), isCleared: false),
          );
        }
      } else if (event is CleanButtonMainPageEvent) {
        emit(StatesChangesMainPage(text: '', isCleared: true));
      } else if (event is GetTextInputMainPageEvent) {
        text = event.text;
        emit(StatesChangesMainPage(text: event.text, isCleared: false));
      }
    });
  }
}
